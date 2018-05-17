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
"spawner/city/nature/trees/container" SET RandomProps.PropArea async false numberOfProps 151 collisionCheck false stickToGround false 
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
"spawner/animals/generic/container" SET RandomProps.PropArea async false numberOfProps 12 collisionCheck false stickToGround false 
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
"spawner/animals/birds/container" SET RandomProps.PropArea async false numberOfProps 89 collisionCheck true stickToGround false 
"spawner/animals/birds/container" SET RandomProps.Torus innerRadius 0
"spawner/animals/birds/container" SET RandomProps.Torus radius 120
"spawner/animals/birds/container" SET Transform position (0 85 0) eulerAngles (0 0 0) localScale (1 1 1)
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
"cameras" SET Transform eulerAngles (-18.405884656838346 0 0)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 96
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 4.444233533590042 0)
"cameras" SET Transform eulerAngles (-10.11040614719004 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0730191451616875
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6819978496543375
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18884561449934778
"cameras/drone/drone0" SET Transform localPosition (1.0102161445338818 0.5451098205144222 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1431577073558599 1.2198345897331075 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 4 0)
"cameras/drone/drone0" SET Transform localScale (1.2114608876336002 1.2114608876336002 1.2114608876336002)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 12 -18)
"cameras/drone/drone1" SET Transform localScale (1.1329332020738692 1.1329332020738692 1.1329332020738692)
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
"cameras" SET Transform position (0 3.9490309384155147 0)
"cameras" SET Transform eulerAngles (17.9147736181315 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5706938160978114
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.950616407838019
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0354275924434555
"cameras/drone/drone0" SET Transform localPosition (0.5218930597605425 0.25032671646958154 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.41766269604482975 1.1089083260476742 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -11 11)
"cameras/drone/drone0" SET Transform localScale (1.156334116995625 1.156334116995625 1.156334116995625)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -16 20)
"cameras/drone/drone1" SET Transform localScale (0.7701911066634981 0.7701911066634981 0.7701911066634981)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.416822153760221 0)
"cameras" SET Transform eulerAngles (1.6890045244846306 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6128364865247279
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.902655156304824
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15828715808553687
"cameras/drone/drone0" SET Transform localPosition (0.7302204983235161 0.5237305375814634 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5819123550658665 0.8312154814269983 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -18 12)
"cameras/drone/drone0" SET Transform localScale (1.1091865701209747 1.1091865701209747 1.1091865701209747)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -17 -14)
"cameras/drone/drone1" SET Transform localScale (0.6189938218575918 0.6189938218575918 0.6189938218575918)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.905520150168306 0)
"cameras" SET Transform eulerAngles (-19.378088182802642 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.34365577015449
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4475584733574798
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2998439421910081
"cameras/drone/drone0" SET Transform localPosition (-0.6192893582414908 -0.22327050306884738 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2370746343292136 1.136704326490553 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -14 19)
"cameras/drone/drone0" SET Transform localScale (1.0289352608379103 1.0289352608379103 1.0289352608379103)
"cameras/drone/drone1" SET Transform localEulerAngles (18 17 -6)
"cameras/drone/drone1" SET Transform localScale (1.0227771154783092 1.0227771154783092 1.0227771154783092)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.538460993373779 0)
"cameras" SET Transform eulerAngles (-1.9594369154186886 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9432293022658774
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4787584650186427
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12327133527697792
"cameras/drone/drone0" SET Transform localPosition (0.23252247948810378 0.3921289205570186 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7495188401111234 0.9048048756957316 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -9 -7)
"cameras/drone/drone0" SET Transform localScale (0.901245719854022 0.901245719854022 0.901245719854022)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -17 10)
"cameras/drone/drone1" SET Transform localScale (0.836397508878033 0.836397508878033 0.836397508878033)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0548372483737696 0)
"cameras" SET Transform eulerAngles (-17.369450234041004 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7472058367662845
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0004233878168394
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3157154196638353
"cameras/drone/drone0" SET Transform localPosition (0.40960987454770503 0.19725438855860838 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5163640904337399 1.1401295277673817 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 7 9)
"cameras/drone/drone0" SET Transform localScale (1.4167338654271595 1.4167338654271595 1.4167338654271595)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 13 -4)
"cameras/drone/drone1" SET Transform localScale (0.9557862511634814 0.9557862511634814 0.9557862511634814)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.207557972729844 0)
"cameras" SET Transform eulerAngles (-12.294424982989254 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8490310542131745
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3602818562494468
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09318993738380787
"cameras/drone/drone0" SET Transform localPosition (-0.42674895868359763 -0.21009598379941802 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.048527929448442 0.9873182628670707 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 9 6)
"cameras/drone/drone0" SET Transform localScale (0.9793198995330172 0.9793198995330172 0.9793198995330172)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -13 10)
"cameras/drone/drone1" SET Transform localScale (0.6902102714104381 0.6902102714104381 0.6902102714104381)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.043299628869318 0)
"cameras" SET Transform eulerAngles (-14.095149105058255 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5745054142500917
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.519074183731604
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15784700709450653
"cameras/drone/drone0" SET Transform localPosition (1.0984048399718713 0.25225286579837086 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7729275851632056 0.9592242149283465 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -5 7)
"cameras/drone/drone0" SET Transform localScale (0.6473271474055878 0.6473271474055878 0.6473271474055878)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -4 6)
"cameras/drone/drone1" SET Transform localScale (1.460403681564154 1.460403681564154 1.460403681564154)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.011691001400281 0)
"cameras" SET Transform eulerAngles (-4.0321914120351074 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4704173988052194
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0649215525126083
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18716137415340747
"cameras/drone/drone0" SET Transform localPosition (0.04059572967910041 0.05865902594036637 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.09241019561396913 1.0341421266609236 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 16 -15)
"cameras/drone/drone0" SET Transform localScale (1.331295702028685 1.331295702028685 1.331295702028685)
"cameras/drone/drone1" SET Transform localEulerAngles (4 13 -12)
"cameras/drone/drone1" SET Transform localScale (1.0631859051549843 1.0631859051549843 1.0631859051549843)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.977692750577395 0)
"cameras" SET Transform eulerAngles (5.224833204487428 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7740379068827713
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8433843460177766
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28880940244188097
"cameras/drone/drone0" SET Transform localPosition (-1.1553584459805977 -0.0722081691174486 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1071602280893178 1.1051809373467352 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 20 -18)
"cameras/drone/drone0" SET Transform localScale (0.6615339268340207 0.6615339268340207 0.6615339268340207)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -13 6)
"cameras/drone/drone1" SET Transform localScale (1.3046054974866972 1.3046054974866972 1.3046054974866972)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.827766072464308 0)
"cameras" SET Transform eulerAngles (8.541302745283126 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8779551657106055
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5320074919705349
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16220485021931486
"cameras/drone/drone0" SET Transform localPosition (0.6175617510124787 -0.2617286484354096 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5788152360643719 1.2862699266605282 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -11 20)
"cameras/drone/drone0" SET Transform localScale (1.0896263710549472 1.0896263710549472 1.0896263710549472)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -18 6)
"cameras/drone/drone1" SET Transform localScale (1.0104261067906901 1.0104261067906901 1.0104261067906901)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0543582793331803 0)
"cameras" SET Transform eulerAngles (7.8572258403944595 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.456619156124737
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8962508227186525
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34497742320864627
"cameras/drone/drone0" SET Transform localPosition (1.1592242524731386 -0.09029118313834567 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.009609355622030247 1.0949849526124489 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 10 8)
"cameras/drone/drone0" SET Transform localScale (0.6340953763882927 0.6340953763882927 0.6340953763882927)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 9 -5)
"cameras/drone/drone1" SET Transform localScale (0.6473949965446701 0.6473949965446701 0.6473949965446701)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8795290455841336 0)
"cameras" SET Transform eulerAngles (17.964384541117454 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9323750709521041
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8372436373278447
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.113313995200304
"cameras/drone/drone0" SET Transform localPosition (-0.14670728191270643 0.408161678088479 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2313836711786219 1.0931163811310756 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -20 -7)
"cameras/drone/drone0" SET Transform localScale (1.019536286993143 1.019536286993143 1.019536286993143)
"cameras/drone/drone1" SET Transform localEulerAngles (3 1 -18)
"cameras/drone/drone1" SET Transform localScale (0.875631202255237 0.875631202255237 0.875631202255237)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.126386260779348 0)
"cameras" SET Transform eulerAngles (17.77060694778281 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5818560005470483
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.646130428490076
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17767707280585446
"cameras/drone/drone0" SET Transform localPosition (-0.11880389206298037 0.4561494472250904 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7982511640583121 0.9246741839754706 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 5 20)
"cameras/drone/drone0" SET Transform localScale (0.6026625049350252 0.6026625049350252 0.6026625049350252)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -14 11)
"cameras/drone/drone1" SET Transform localScale (0.7462756491436107 0.7462756491436107 0.7462756491436107)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9931524642840026 0)
"cameras" SET Transform eulerAngles (5.538129418011799 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1792299938559823
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.075374691583755
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21399582909819514
"cameras/drone/drone0" SET Transform localPosition (1.128902687925472 0.4735353143146635 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6609272336593917 1.1314328553929822 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 15 -9)
"cameras/drone/drone0" SET Transform localScale (0.9133080511173386 0.9133080511173386 0.9133080511173386)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 0 12)
"cameras/drone/drone1" SET Transform localScale (0.6661460593210784 0.6661460593210784 0.6661460593210784)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6391031635101836 0)
"cameras" SET Transform eulerAngles (18.143240251455715 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2530678590905295
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9009151424294143
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25015441269603594
"cameras/drone/drone0" SET Transform localPosition (-0.6266370797558031 0.511169980668527 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8100080864078676 0.9293553026148974 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -18 15)
"cameras/drone/drone0" SET Transform localScale (1.0672280535552572 1.0672280535552572 1.0672280535552572)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 5 2)
"cameras/drone/drone1" SET Transform localScale (1.3130750300219165 1.3130750300219165 1.3130750300219165)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.386901743729864 0)
"cameras" SET Transform eulerAngles (-9.548319241681686 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.104736939397349
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6482948023043908
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30929402018122454
"cameras/drone/drone0" SET Transform localPosition (-1.0548606573300783 -0.029978495355324875 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4563249042394535 0.807121840574961 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 19 -7)
"cameras/drone/drone0" SET Transform localScale (1.432045963084289 1.432045963084289 1.432045963084289)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -12 -6)
"cameras/drone/drone1" SET Transform localScale (1.2120600597890485 1.2120600597890485 1.2120600597890485)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.899795914519001 0)
"cameras" SET Transform eulerAngles (-7.562563133486492 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8964604837286945
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2701316715944906
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05290479344620498
"cameras/drone/drone0" SET Transform localPosition (0.8832997145053654 0.6583064913834582 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.16481248522794179 1.0044938568783703 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 7 17)
"cameras/drone/drone0" SET Transform localScale (1.0021528501792925 1.0021528501792925 1.0021528501792925)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -6 -5)
"cameras/drone/drone1" SET Transform localScale (0.8515110034299196 0.8515110034299196 0.8515110034299196)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.085379361625056 0)
"cameras" SET Transform eulerAngles (-8.723557214757935 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7661001545884032
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2159121699072504
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29495283123660343
"cameras/drone/drone0" SET Transform localPosition (-1.1210775494731449 0.3604784390973052 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.537846256958759 1.0212093621862184 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -4 -2)
"cameras/drone/drone0" SET Transform localScale (0.8856282589564987 0.8856282589564987 0.8856282589564987)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 15 13)
"cameras/drone/drone1" SET Transform localScale (1.3474327358862446 1.3474327358862446 1.3474327358862446)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.758879588833777 0)
"cameras" SET Transform eulerAngles (7.406908015665547 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.427723280589569
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5910995128517187
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23940254163354027
"cameras/drone/drone0" SET Transform localPosition (-0.9730135846615433 0.6743229281615706 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0705777043612341 1.1908277411934178 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 8 4)
"cameras/drone/drone0" SET Transform localScale (1.3822791508025722 1.3822791508025722 1.3822791508025722)
"cameras/drone/drone1" SET Transform localEulerAngles (16 1 6)
"cameras/drone/drone1" SET Transform localScale (0.9030071509384243 0.9030071509384243 0.9030071509384243)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.903125551069183 0)
"cameras" SET Transform eulerAngles (-15.760333192153094 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5254660449176654
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5350346678346076
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2955891138023335
"cameras/drone/drone0" SET Transform localPosition (0.37097268306582554 0.45138106951149054 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.08719595675750247 1.2025121261369656 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 5 6)
"cameras/drone/drone0" SET Transform localScale (0.9056966664506256 0.9056966664506256 0.9056966664506256)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -4 -8)
"cameras/drone/drone1" SET Transform localScale (0.8485710174143534 0.8485710174143534 0.8485710174143534)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.623261768325031 0)
"cameras" SET Transform eulerAngles (6.71951616596877 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3852270414458463
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.182471625920758
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14448663403974638
"cameras/drone/drone0" SET Transform localPosition (0.30657510953665934 0.09122303722046315 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.04768817698225147 1.0741342345700673 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 16 -7)
"cameras/drone/drone0" SET Transform localScale (1.1945769740376893 1.1945769740376893 1.1945769740376893)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -15 -19)
"cameras/drone/drone1" SET Transform localScale (1.0603231899716612 1.0603231899716612 1.0603231899716612)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4966730264181587 0)
"cameras" SET Transform eulerAngles (15.97953332244144 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.40221442256890083
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5775400762415164
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37617832151246955
"cameras/drone/drone0" SET Transform localPosition (0.8550430065227752 0.6231727171764225 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.059073486367662 1.2098063598196027 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 19 7)
"cameras/drone/drone0" SET Transform localScale (0.9407327002774724 0.9407327002774724 0.9407327002774724)
"cameras/drone/drone1" SET Transform localEulerAngles (2 9 20)
"cameras/drone/drone1" SET Transform localScale (0.6131180389369509 0.6131180389369509 0.6131180389369509)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2774784366790533 0)
"cameras" SET Transform eulerAngles (5.746036259455096 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4278352094304454
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6717312521228802
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07036353226115058
"cameras/drone/drone0" SET Transform localPosition (0.7764377339287794 0.28820242770934384 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.14671850063350544 1.1049057963442288 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -15 -20)
"cameras/drone/drone0" SET Transform localScale (0.7907718737491529 0.7907718737491529 0.7907718737491529)
"cameras/drone/drone1" SET Transform localEulerAngles (2 5 -8)
"cameras/drone/drone1" SET Transform localScale (0.6271661138525194 0.6271661138525194 0.6271661138525194)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.284884241408598 0)
"cameras" SET Transform eulerAngles (-10.202589877434685 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5413031855456198
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0726555018655755
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2176859406550869
"cameras/drone/drone0" SET Transform localPosition (-1.1248624527368085 -0.2465065731597807 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.945049980521961 1.168973193376059 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 10 18)
"cameras/drone/drone0" SET Transform localScale (1.1310172584775622 1.1310172584775622 1.1310172584775622)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -10 -3)
"cameras/drone/drone1" SET Transform localScale (1.1839514571011818 1.1839514571011818 1.1839514571011818)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8603642302961214 0)
"cameras" SET Transform eulerAngles (13.11906930905112 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3379887293511046
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9048779466317431
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.020888732861784654
"cameras/drone/drone0" SET Transform localPosition (-0.33281913819718656 -0.2926278026768822 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9421774330539188 1.2891401726803489 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 0 14)
"cameras/drone/drone0" SET Transform localScale (0.8947183270996217 0.8947183270996217 0.8947183270996217)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -4 13)
"cameras/drone/drone1" SET Transform localScale (1.2182655345952687 1.2182655345952687 1.2182655345952687)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.439057959521426 0)
"cameras" SET Transform eulerAngles (16.162058066427647 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.729779713689156
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1115523717056544
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.031029966961257396
"cameras/drone/drone0" SET Transform localPosition (-0.9854843539167286 0.39420972041202357 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7340677044190886 1.212344969468544 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 20 2)
"cameras/drone/drone0" SET Transform localScale (0.998695621712431 0.998695621712431 0.998695621712431)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -14 -10)
"cameras/drone/drone1" SET Transform localScale (0.9252667646494953 0.9252667646494953 0.9252667646494953)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6530978344816276 0)
"cameras" SET Transform eulerAngles (9.696001968109165 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2502195885374272
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.035198161930663
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05235994195326357
"cameras/drone/drone0" SET Transform localPosition (-0.27420006595192703 0.44383463630339476 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3942570187498713 1.2608172344912352 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -15 18)
"cameras/drone/drone0" SET Transform localScale (0.7875703555648071 0.7875703555648071 0.7875703555648071)
"cameras/drone/drone1" SET Transform localEulerAngles (12 18 1)
"cameras/drone/drone1" SET Transform localScale (1.4429881440650245 1.4429881440650245 1.4429881440650245)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.492473202466044 0)
"cameras" SET Transform eulerAngles (14.33464065490162 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8197006394954884
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6998833357101677
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1783259536975797
"cameras/drone/drone0" SET Transform localPosition (0.44428193339336075 0.5577971807644082 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5057065211755285 1.152736599247998 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -14 9)
"cameras/drone/drone0" SET Transform localScale (0.7745158499634972 0.7745158499634972 0.7745158499634972)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -7 4)
"cameras/drone/drone1" SET Transform localScale (0.8967421849291313 0.8967421849291313 0.8967421849291313)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.775277455774987 0)
"cameras" SET Transform eulerAngles (-7.818043271654322 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8133079474291802
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.282265420461372
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18729783533691147
"cameras/drone/drone0" SET Transform localPosition (-1.0718497397711608 0.6842531966869883 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.080109899511885 1.2629552327907354 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 8 11)
"cameras/drone/drone0" SET Transform localScale (0.8383907144382895 0.8383907144382895 0.8383907144382895)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 5 -1)
"cameras/drone/drone1" SET Transform localScale (0.7593164262011705 0.7593164262011705 0.7593164262011705)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.876398128902464 0)
"cameras" SET Transform eulerAngles (-13.688019734604232 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5707219424308673
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8874653773665666
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.33607979498567553
"cameras/drone/drone0" SET Transform localPosition (-0.7845055648227968 0.36705104681896034 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2928039489376294 1.065555865799428 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 9 5)
"cameras/drone/drone0" SET Transform localScale (0.9541781993948828 0.9541781993948828 0.9541781993948828)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -20 15)
"cameras/drone/drone1" SET Transform localScale (0.6161199532194689 0.6161199532194689 0.6161199532194689)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.617090364362284 0)
"cameras" SET Transform eulerAngles (18.466828096136318 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7664377893025434
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9869034711296325
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05581665630949067
"cameras/drone/drone0" SET Transform localPosition (0.3220032041342953 0.0011816764924487688 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3730118098114439 1.1845758433478286 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -12 -6)
"cameras/drone/drone0" SET Transform localScale (1.2599890196148493 1.2599890196148493 1.2599890196148493)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -1 1)
"cameras/drone/drone1" SET Transform localScale (0.621259771615194 0.621259771615194 0.621259771615194)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0248285529164285 0)
"cameras" SET Transform eulerAngles (-5.472653143621947 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.44354345827462643
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0018417074726618
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0396577291001377
"cameras/drone/drone0" SET Transform localPosition (0.8269792577302864 0.3802068420209364 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2010337426545672 0.8599040341117433 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 2 -14)
"cameras/drone/drone0" SET Transform localScale (0.6484679752383405 0.6484679752383405 0.6484679752383405)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -9 -11)
"cameras/drone/drone1" SET Transform localScale (0.9234548132968826 0.9234548132968826 0.9234548132968826)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9752148646639967 0)
"cameras" SET Transform eulerAngles (-2.849135065930483 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5778403929532838
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5526939371750514
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.044054893777673645
"cameras/drone/drone0" SET Transform localPosition (0.2036697772666729 0.5795470201704893 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.012907872518486 0.9592083664472546 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 10 -11)
"cameras/drone/drone0" SET Transform localScale (0.8218375358852636 0.8218375358852636 0.8218375358852636)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 11 9)
"cameras/drone/drone1" SET Transform localScale (0.9409212787266723 0.9409212787266723 0.9409212787266723)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.695498943452734 0)
"cameras" SET Transform eulerAngles (12.785450878715025 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6553604134929196
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7944593607231853
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08498740093943989
"cameras/drone/drone0" SET Transform localPosition (1.1433886533815218 -0.22424546849122967 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6632043465420627 1.245842292164172 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -13 18)
"cameras/drone/drone0" SET Transform localScale (0.7742364974564309 0.7742364974564309 0.7742364974564309)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -7 19)
"cameras/drone/drone1" SET Transform localScale (0.7018964868748288 0.7018964868748288 0.7018964868748288)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.064769753913509 0)
"cameras" SET Transform eulerAngles (-15.009917087988093 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5960526479401338
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3500339356881368
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2621121586258471
"cameras/drone/drone0" SET Transform localPosition (-1.0926392477327234 -0.15888999656997743 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4427107265426655 1.1363421582481843 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -12 15)
"cameras/drone/drone0" SET Transform localScale (1.1954759905880974 1.1954759905880974 1.1954759905880974)
"cameras/drone/drone1" SET Transform localEulerAngles (4 8 3)
"cameras/drone/drone1" SET Transform localScale (0.8211563125379275 0.8211563125379275 0.8211563125379275)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.379588822595474 0)
"cameras" SET Transform eulerAngles (-14.200931990052457 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.845803805462661
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6384028902553482
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23922798255253303
"cameras/drone/drone0" SET Transform localPosition (-0.9273710080087495 0.21931820397299145 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8286319823857327 0.9628117108163825 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -6 19)
"cameras/drone/drone0" SET Transform localScale (1.2540983958210719 1.2540983958210719 1.2540983958210719)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -11 16)
"cameras/drone/drone1" SET Transform localScale (0.8370729118204008 0.8370729118204008 0.8370729118204008)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2241390670999723 0)
"cameras" SET Transform eulerAngles (0.15555879567446596 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4044608269082137
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.795470572456937
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02914198342144747
"cameras/drone/drone0" SET Transform localPosition (-1.1651403152188666 0.12996045505390125 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.48628387659700345 0.8915397925544113 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -4 -2)
"cameras/drone/drone0" SET Transform localScale (1.3687273662414412 1.3687273662414412 1.3687273662414412)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 18 -4)
"cameras/drone/drone1" SET Transform localScale (1.2987591076182947 1.2987591076182947 1.2987591076182947)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.210136887623166 0)
"cameras" SET Transform eulerAngles (-3.93872132230549 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4124048772885529
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9220698326952379
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10207585518819746
"cameras/drone/drone0" SET Transform localPosition (0.6313110696763187 -0.13362024604468942 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5694785278179024 0.9711262248388743 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -15 -14)
"cameras/drone/drone0" SET Transform localScale (0.7332371294506718 0.7332371294506718 0.7332371294506718)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 9 -17)
"cameras/drone/drone1" SET Transform localScale (0.7404458223041761 0.7404458223041761 0.7404458223041761)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2916170936507383 0)
"cameras" SET Transform eulerAngles (7.069040276739042 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6179316471951578
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4057398429145205
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06013351644602083
"cameras/drone/drone0" SET Transform localPosition (-0.15437050278050624 -0.2557634650446226 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0324519695054197 1.0224054877899578 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -19 -1)
"cameras/drone/drone0" SET Transform localScale (0.8690225834243908 0.8690225834243908 0.8690225834243908)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -15 -16)
"cameras/drone/drone1" SET Transform localScale (1.0457891898487275 1.0457891898487275 1.0457891898487275)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.676818505005663 0)
"cameras" SET Transform eulerAngles (0.02003353246095685 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7773529184572334
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9554582865886493
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24197920777373474
"cameras/drone/drone0" SET Transform localPosition (0.7662945977692812 -0.068565241806603 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7437027108923202 0.9264181728190959 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -4 -4)
"cameras/drone/drone0" SET Transform localScale (1.4588618268703106 1.4588618268703106 1.4588618268703106)
"cameras/drone/drone1" SET Transform localEulerAngles (11 16 9)
"cameras/drone/drone1" SET Transform localScale (1.4574011379462033 1.4574011379462033 1.4574011379462033)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4358941572963526 0)
"cameras" SET Transform eulerAngles (10.051246388109707 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0993950455260766
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.020586237355612
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0006928563695571378
"cameras/drone/drone0" SET Transform localPosition (0.6465850453574957 0.604949728718146 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8051937904111941 1.0223006200538585 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 20 -3)
"cameras/drone/drone0" SET Transform localScale (0.6515423024841437 0.6515423024841437 0.6515423024841437)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -3 -6)
"cameras/drone/drone1" SET Transform localScale (1.2531402998964718 1.2531402998964718 1.2531402998964718)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.546054192956925 0)
"cameras" SET Transform eulerAngles (13.505963350085878 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6305001124781733
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2530515559970066
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0696013198698247
"cameras/drone/drone0" SET Transform localPosition (0.20244851041704393 -0.23932855881851417 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4421319464822835 1.018544311317175 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -11 1)
"cameras/drone/drone0" SET Transform localScale (1.4930268413358205 1.4930268413358205 1.4930268413358205)
"cameras/drone/drone1" SET Transform localEulerAngles (11 5 14)
"cameras/drone/drone1" SET Transform localScale (0.8060821861450994 0.8060821861450994 0.8060821861450994)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.355192672035921 0)
"cameras" SET Transform eulerAngles (-1.1400724596285627 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.891098813979865
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0799874973637615
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.002251578401587251
"cameras/drone/drone0" SET Transform localPosition (-0.4813735061585491 0.019066991844938708 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7983892837682498 1.1502415533926396 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 10 19)
"cameras/drone/drone0" SET Transform localScale (1.3918273653606374 1.3918273653606374 1.3918273653606374)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -5 13)
"cameras/drone/drone1" SET Transform localScale (0.7260121131582576 0.7260121131582576 0.7260121131582576)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.484081676042184 0)
"cameras" SET Transform eulerAngles (18.00985998023649 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6597426457564481
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.657602225683236
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21731043267850386
"cameras/drone/drone0" SET Transform localPosition (-0.3340031293431299 -0.07424025528747108 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.17261451703733321 1.0777821443372317 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -9 -13)
"cameras/drone/drone0" SET Transform localScale (1.182565959115112 1.182565959115112 1.182565959115112)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -19 -6)
"cameras/drone/drone1" SET Transform localScale (0.9304883731182123 0.9304883731182123 0.9304883731182123)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.457738189936293 0)
"cameras" SET Transform eulerAngles (-10.422072408155625 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6787728473526067
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8809793595059734
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21067169402021502
"cameras/drone/drone0" SET Transform localPosition (0.5481646150378587 0.024922125085263314 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1625920459352006 0.8067538798013584 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -8 -2)
"cameras/drone/drone0" SET Transform localScale (1.4352411826832676 1.4352411826832676 1.4352411826832676)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -1 -8)
"cameras/drone/drone1" SET Transform localScale (1.1245377130095857 1.1245377130095857 1.1245377130095857)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.524722343066867 0)
"cameras" SET Transform eulerAngles (13.990785271669566 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0241720973997557
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.784327469513865
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0181453837285253
"cameras/drone/drone0" SET Transform localPosition (0.9397578789969148 0.21233687307802956 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5657834556230088 0.857329545098833 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 18 12)
"cameras/drone/drone0" SET Transform localScale (1.1417375995116619 1.1417375995116619 1.1417375995116619)
"cameras/drone/drone1" SET Transform localEulerAngles (18 11 9)
"cameras/drone/drone1" SET Transform localScale (1.0837338753167145 1.0837338753167145 1.0837338753167145)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6115201373548746 0)
"cameras" SET Transform eulerAngles (-17.50026315608678 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4513636206901057
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5082747462218515
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1232536172495514
"cameras/drone/drone0" SET Transform localPosition (-0.974770257249162 0.512826873674425 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.43330326169126865 0.854948252371087 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 0 -7)
"cameras/drone/drone0" SET Transform localScale (0.8816209900069991 0.8816209900069991 0.8816209900069991)
"cameras/drone/drone1" SET Transform localEulerAngles (19 6 15)
"cameras/drone/drone1" SET Transform localScale (0.8113806202864502 0.8113806202864502 0.8113806202864502)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.63375411734591 0)
"cameras" SET Transform eulerAngles (-19.046701429207424 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.506385662271259
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7924816481064076
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3400353089216979
"cameras/drone/drone0" SET Transform localPosition (1.1680425471938134 0.058608101967633275 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7318460645653533 0.8699389021645993 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 8 -4)
"cameras/drone/drone0" SET Transform localScale (0.7163105275365782 0.7163105275365782 0.7163105275365782)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -10 -17)
"cameras/drone/drone1" SET Transform localScale (0.9906099756978761 0.9906099756978761 0.9906099756978761)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.438649088099294 0)
"cameras" SET Transform eulerAngles (-11.79046317856785 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5658972863852799
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8746747772849337
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03580503200075707
"cameras/drone/drone0" SET Transform localPosition (-0.02862866634780281 0.1361633793149501 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1718942135514194 1.1241572644361448 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -18 9)
"cameras/drone/drone0" SET Transform localScale (1.2776384348573597 1.2776384348573597 1.2776384348573597)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -9 -2)
"cameras/drone/drone1" SET Transform localScale (0.6603082061729784 0.6603082061729784 0.6603082061729784)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.793671634672433 0)
"cameras" SET Transform eulerAngles (19.739741373588387 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2251153191955297
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8107813959220391
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04883319073459318
"cameras/drone/drone0" SET Transform localPosition (0.7574713771234534 -0.12379464449102212 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4613891061456985 1.1962535740686076 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -4 -7)
"cameras/drone/drone0" SET Transform localScale (0.9527665544731153 0.9527665544731153 0.9527665544731153)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 6 14)
"cameras/drone/drone1" SET Transform localScale (1.4368513730372097 1.4368513730372097 1.4368513730372097)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7497815365341864 0)
"cameras" SET Transform eulerAngles (15.9424526654172 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4515110341170015
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2931308167984958
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09628442229095979
"cameras/drone/drone0" SET Transform localPosition (0.846439577857873 0.1819950749040113 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9856559431874636 1.0102576460818782 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -8 -3)
"cameras/drone/drone0" SET Transform localScale (0.6736122666413336 0.6736122666413336 0.6736122666413336)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -13 13)
"cameras/drone/drone1" SET Transform localScale (0.9795303204314141 0.9795303204314141 0.9795303204314141)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.010514736104967 0)
"cameras" SET Transform eulerAngles (7.939745723153969 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0553956701304457
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.283383707835163
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14389637560474475
"cameras/drone/drone0" SET Transform localPosition (0.5940700050096437 -0.28763711669027897 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.996404200979665 1.1814019220932912 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -14 3)
"cameras/drone/drone0" SET Transform localScale (0.6657852699376213 0.6657852699376213 0.6657852699376213)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 10 0)
"cameras/drone/drone1" SET Transform localScale (0.9766384905018068 0.9766384905018068 0.9766384905018068)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.282113223043204 0)
"cameras" SET Transform eulerAngles (-3.714952917460522 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.507234972012993
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7067878418839073
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13623840153223132
"cameras/drone/drone0" SET Transform localPosition (-1.1407196556111254 0.3015879952008949 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0551254817878852 1.1166195582144915 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -1 17)
"cameras/drone/drone0" SET Transform localScale (0.9874934391082999 0.9874934391082999 0.9874934391082999)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -1 2)
"cameras/drone/drone1" SET Transform localScale (0.611222583393646 0.611222583393646 0.611222583393646)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.870112136108733 0)
"cameras" SET Transform eulerAngles (14.910769769582679 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9203246265273355
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9672574100345634
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23089312785731667
"cameras/drone/drone0" SET Transform localPosition (0.06896928338344965 0.3365996880976226 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6982444883974168 0.8144415567029026 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 16 3)
"cameras/drone/drone0" SET Transform localScale (0.6805056616298033 0.6805056616298033 0.6805056616298033)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -2 7)
"cameras/drone/drone1" SET Transform localScale (0.949298949396813 0.949298949396813 0.949298949396813)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.870623183337447 0)
"cameras" SET Transform eulerAngles (-12.550781313461435 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4675768250679488
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3501678009846652
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04770179289665442
"cameras/drone/drone0" SET Transform localPosition (-0.6102979011383899 0.3025485120833364 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0933983320012632 0.8973660819891088 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -9 -13)
"cameras/drone/drone0" SET Transform localScale (0.9383056827168291 0.9383056827168291 0.9383056827168291)
"cameras/drone/drone1" SET Transform localEulerAngles (2 9 -17)
"cameras/drone/drone1" SET Transform localScale (0.7011857259274583 0.7011857259274583 0.7011857259274583)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6302250280045794 0)
"cameras" SET Transform eulerAngles (-3.3169838311441566 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7917221948087378
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0066218468397754
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21390274383843716
"cameras/drone/drone0" SET Transform localPosition (0.6305011495474007 0.4123313943505527 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6442575377699665 0.8261109382362098 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 6 -2)
"cameras/drone/drone0" SET Transform localScale (1.2518192856006012 1.2518192856006012 1.2518192856006012)
"cameras/drone/drone1" SET Transform localEulerAngles (15 19 -17)
"cameras/drone/drone1" SET Transform localScale (1.414980917392286 1.414980917392286 1.414980917392286)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9066450487429067 0)
"cameras" SET Transform eulerAngles (11.650914864318874 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1856916899758472
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3561669085033206
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2638524760647996
"cameras/drone/drone0" SET Transform localPosition (0.9095525815308789 0.1777607967539278 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2970990345981841 0.8948103138839487 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -9 -3)
"cameras/drone/drone0" SET Transform localScale (1.3298626316453426 1.3298626316453426 1.3298626316453426)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -6 5)
"cameras/drone/drone1" SET Transform localScale (1.2574125051185727 1.2574125051185727 1.2574125051185727)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.129486297164746 0)
"cameras" SET Transform eulerAngles (-11.369395692873479 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.206446903518493
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9102174352059729
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1699565797667845
"cameras/drone/drone0" SET Transform localPosition (-0.45559695959777735 -0.07076491013416425 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.181887348409395 1.1566989790498652 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -6 -12)
"cameras/drone/drone0" SET Transform localScale (1.1020777175224823 1.1020777175224823 1.1020777175224823)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -15 -18)
"cameras/drone/drone1" SET Transform localScale (1.4839137652950407 1.4839137652950407 1.4839137652950407)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.120536796713006 0)
"cameras" SET Transform eulerAngles (-11.271306295023887 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5731474634520914
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4569026583878766
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16398959580170547
"cameras/drone/drone0" SET Transform localPosition (0.5082411673349105 0.2889883545107817 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.48102620021174314 0.9384911636129816 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 1 -6)
"cameras/drone/drone0" SET Transform localScale (0.9344408384761952 0.9344408384761952 0.9344408384761952)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -6 6)
"cameras/drone/drone1" SET Transform localScale (1.2960420882000099 1.2960420882000099 1.2960420882000099)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3261191283809275 0)
"cameras" SET Transform eulerAngles (-17.630967303875885 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.732325384949064
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2043771248205064
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21513506694957985
"cameras/drone/drone0" SET Transform localPosition (0.9740725690149523 0.36368048316126683 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.03752879435744272 0.973134562956941 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 18 -4)
"cameras/drone/drone0" SET Transform localScale (1.006188481411491 1.006188481411491 1.006188481411491)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 20 -4)
"cameras/drone/drone1" SET Transform localScale (1.1849404661384466 1.1849404661384466 1.1849404661384466)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.408122723984393 0)
"cameras" SET Transform eulerAngles (14.199142182393558 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1535505111239326
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1649908236523077
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25229275327392786
"cameras/drone/drone0" SET Transform localPosition (-1.109001975473005 0.13516761422203577 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6632264323203969 1.1874472057536292 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 19 18)
"cameras/drone/drone0" SET Transform localScale (1.005076186991029 1.005076186991029 1.005076186991029)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 16 2)
"cameras/drone/drone1" SET Transform localScale (1.1741932141385678 1.1741932141385678 1.1741932141385678)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0342913283366277 0)
"cameras" SET Transform eulerAngles (-13.086787471591173 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2127926562557831
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3397642612861955
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06712881778931026
"cameras/drone/drone0" SET Transform localPosition (0.7277745272660829 0.1357588618573226 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4319758038289293 0.835820108119381 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -2 15)
"cameras/drone/drone0" SET Transform localScale (0.852847356884964 0.852847356884964 0.852847356884964)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 1 -2)
"cameras/drone/drone1" SET Transform localScale (1.3958238403027465 1.3958238403027465 1.3958238403027465)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.208014044058554 0)
"cameras" SET Transform eulerAngles (13.260916892404907 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6477509260046526
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2032453595799677
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2552910574434436
"cameras/drone/drone0" SET Transform localPosition (0.81787092858878 -0.03082445656944005 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.08571837948323591 1.0503152622012917 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -17 3)
"cameras/drone/drone0" SET Transform localScale (1.068953789876318 1.068953789876318 1.068953789876318)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 11 -11)
"cameras/drone/drone1" SET Transform localScale (1.3068002638808038 1.3068002638808038 1.3068002638808038)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2012426650774772 0)
"cameras" SET Transform eulerAngles (-18.09640375708554 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1205804759984082
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9505791652084387
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21530472715173193
"cameras/drone/drone0" SET Transform localPosition (0.9800090349345767 -0.162856465209877 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9363448646579073 0.8074991144257282 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 10 19)
"cameras/drone/drone0" SET Transform localScale (0.7592547136068462 0.7592547136068462 0.7592547136068462)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -15 -9)
"cameras/drone/drone1" SET Transform localScale (1.0841756298105925 1.0841756298105925 1.0841756298105925)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.644777835031016 0)
"cameras" SET Transform eulerAngles (16.811060058189902 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7426893355648494
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0493179437308755
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3108597856721931
"cameras/drone/drone0" SET Transform localPosition (0.8814359091597963 -0.14743429217693577 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0149607603778992 1.207885348405085 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -10 -1)
"cameras/drone/drone0" SET Transform localScale (0.7391470709401344 0.7391470709401344 0.7391470709401344)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 9 -3)
"cameras/drone/drone1" SET Transform localScale (1.2653636553489247 1.2653636553489247 1.2653636553489247)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.643483896850896 0)
"cameras" SET Transform eulerAngles (-4.7622082617186265 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5368266902808005
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.070035483419344
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0955492824204236
"cameras/drone/drone0" SET Transform localPosition (-0.8672384798606465 0.6651251686513657 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3622461947895512 1.2875686066737058 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 0 -8)
"cameras/drone/drone0" SET Transform localScale (1.4710375312367994 1.4710375312367994 1.4710375312367994)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -6 -10)
"cameras/drone/drone1" SET Transform localScale (1.481373965673667 1.481373965673667 1.481373965673667)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.9415112192891 0)
"cameras" SET Transform eulerAngles (14.707586062175352 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.41334484986368614
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.973093769163604
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17776062274750473
"cameras/drone/drone0" SET Transform localPosition (-0.5790826031472297 -0.20512942138340146 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9293722487515497 1.2518405976597848 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -17 5)
"cameras/drone/drone0" SET Transform localScale (1.0336914304833356 1.0336914304833356 1.0336914304833356)
"cameras/drone/drone1" SET Transform localEulerAngles (19 8 0)
"cameras/drone/drone1" SET Transform localScale (1.2850190388509892 1.2850190388509892 1.2850190388509892)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.899388540079036 0)
"cameras" SET Transform eulerAngles (-7.138373865958236 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1258026200597724
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9914339054108372
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27597481344601466
"cameras/drone/drone0" SET Transform localPosition (-0.025369517446430567 -0.01040128021130321 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4021486824144347 1.0178766204900676 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -6 -20)
"cameras/drone/drone0" SET Transform localScale (1.446797816984918 1.446797816984918 1.446797816984918)
"cameras/drone/drone1" SET Transform localEulerAngles (16 17 -13)
"cameras/drone/drone1" SET Transform localScale (0.9585570544167243 0.9585570544167243 0.9585570544167243)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5355463962389075 0)
"cameras" SET Transform eulerAngles (5.599420356260545 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7286265839448831
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0588660189586991
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37901204075673567
"cameras/drone/drone0" SET Transform localPosition (-0.24390695609837665 -0.1482682537786984 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9520196168257882 0.8040489462603996 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -6 -7)
"cameras/drone/drone0" SET Transform localScale (0.9375564382208429 0.9375564382208429 0.9375564382208429)
"cameras/drone/drone1" SET Transform localEulerAngles (5 0 6)
"cameras/drone/drone1" SET Transform localScale (0.6272409708155791 0.6272409708155791 0.6272409708155791)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.188189545287123 0)
"cameras" SET Transform eulerAngles (19.465675076664226 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2295239806747205
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4000979106948128
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.237414414821121
"cameras/drone/drone0" SET Transform localPosition (-0.6314431654772666 0.0031739798153878618 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3605425472512319 0.8236760344887802 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 1 11)
"cameras/drone/drone0" SET Transform localScale (1.4903977429554471 1.4903977429554471 1.4903977429554471)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -3 -20)
"cameras/drone/drone1" SET Transform localScale (1.2821809927827914 1.2821809927827914 1.2821809927827914)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.1299428408054935 0)
"cameras" SET Transform eulerAngles (-4.381114336461195 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.360171044212984
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.405958880117093
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2563017800170859
"cameras/drone/drone0" SET Transform localPosition (-1.016790833273374 -0.1672845679347053 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.754428471825862 1.172965036265306 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -4 -8)
"cameras/drone/drone0" SET Transform localScale (1.47845192533851 1.47845192533851 1.47845192533851)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 8 -16)
"cameras/drone/drone1" SET Transform localScale (1.0617793458574076 1.0617793458574076 1.0617793458574076)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5210519732999983 0)
"cameras" SET Transform eulerAngles (-11.198440995620551 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5470693596115553
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7260837432970746
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18781999066945707
"cameras/drone/drone0" SET Transform localPosition (-0.03621803716879146 0.11217937425892394 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7050011358933606 0.899927375987198 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 19 3)
"cameras/drone/drone0" SET Transform localScale (1.4815333173011114 1.4815333173011114 1.4815333173011114)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -17 -1)
"cameras/drone/drone1" SET Transform localScale (1.276190869334902 1.276190869334902 1.276190869334902)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.853095482214851 0)
"cameras" SET Transform eulerAngles (-18.017378326857735 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0791114276221372
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.521611513305299
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3715793743635228
"cameras/drone/drone0" SET Transform localPosition (-0.6991960297274884 0.6799128925447437 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.10454884328970637 1.1807588520339398 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 13 -11)
"cameras/drone/drone0" SET Transform localScale (1.0794889389747886 1.0794889389747886 1.0794889389747886)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 9 12)
"cameras/drone/drone1" SET Transform localScale (1.457760880150667 1.457760880150667 1.457760880150667)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.143997095992291 0)
"cameras" SET Transform eulerAngles (19.519067365661414 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4366584271675497
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7747654833363757
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07423669095531067
"cameras/drone/drone0" SET Transform localPosition (-0.5301865474664613 0.2886076223345198 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4932906084335562 1.2463364394452483 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -13 17)
"cameras/drone/drone0" SET Transform localScale (0.7690473674727927 0.7690473674727927 0.7690473674727927)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -12 18)
"cameras/drone/drone1" SET Transform localScale (1.0002024802399703 1.0002024802399703 1.0002024802399703)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2445689527310035 0)
"cameras" SET Transform eulerAngles (-2.81608655051048 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6070666337830904
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.266325143923751
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07286535006243865
"cameras/drone/drone0" SET Transform localPosition (-1.1030306827327383 0.4969652343978886 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.37868156700475675 1.226255304632584 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 6 -7)
"cameras/drone/drone0" SET Transform localScale (0.9250980034996941 0.9250980034996941 0.9250980034996941)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -7 13)
"cameras/drone/drone1" SET Transform localScale (0.7466614938140386 0.7466614938140386 0.7466614938140386)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.2602099476199875 0)
"cameras" SET Transform eulerAngles (-6.31557292263286 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.56008536603684
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9012260346923218
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20611155417240454
"cameras/drone/drone0" SET Transform localPosition (-0.1921669826994492 -0.2098419241030896 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0220783473326682 1.0662805892395475 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 19 -18)
"cameras/drone/drone0" SET Transform localScale (1.024220982943113 1.024220982943113 1.024220982943113)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 15 -14)
"cameras/drone/drone1" SET Transform localScale (0.9727751798447246 0.9727751798447246 0.9727751798447246)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.067161646219841 0)
"cameras" SET Transform eulerAngles (-4.343704018778656 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5848314193686243
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4329611928068515
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15349005031746718
"cameras/drone/drone0" SET Transform localPosition (0.09022721370632736 0.15869827417828547 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1914979045139671 1.0461699381994605 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -15 -5)
"cameras/drone/drone0" SET Transform localScale (1.233783264720865 1.233783264720865 1.233783264720865)
"cameras/drone/drone1" SET Transform localEulerAngles (6 19 -11)
"cameras/drone/drone1" SET Transform localScale (0.6769114720211774 0.6769114720211774 0.6769114720211774)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.516163776615691 0)
"cameras" SET Transform eulerAngles (3.958974965440106 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2019136334964031
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8024660786894642
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03892318214180701
"cameras/drone/drone0" SET Transform localPosition (0.030400453708601782 0.36420159732168195 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1034185788792086 1.1644870081677576 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -9 13)
"cameras/drone/drone0" SET Transform localScale (1.2820340236430963 1.2820340236430963 1.2820340236430963)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -11 15)
"cameras/drone/drone1" SET Transform localScale (1.131082825830195 1.131082825830195 1.131082825830195)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.175973018588377 0)
"cameras" SET Transform eulerAngles (-1.440511355577705 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2493184949503364
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7381296719615589
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.039631004023069454
"cameras/drone/drone0" SET Transform localPosition (-0.7384998660739224 -0.030004142241493337 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9894665599516508 0.8403742549011006 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -14 -11)
"cameras/drone/drone0" SET Transform localScale (1.3641920621657446 1.3641920621657446 1.3641920621657446)
"cameras/drone/drone1" SET Transform localEulerAngles (0 15 -8)
"cameras/drone/drone1" SET Transform localScale (0.9597753310502077 0.9597753310502077 0.9597753310502077)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9003701838571363 0)
"cameras" SET Transform eulerAngles (4.3473416727058805 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1840023161424122
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.84406067779702
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1562296275259939
"cameras/drone/drone0" SET Transform localPosition (0.5445336127505314 0.4927721228500643 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.009845124124864 1.030608634430863 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -14 15)
"cameras/drone/drone0" SET Transform localScale (1.2846231056901467 1.2846231056901467 1.2846231056901467)
"cameras/drone/drone1" SET Transform localEulerAngles (19 16 18)
"cameras/drone/drone1" SET Transform localScale (1.0661525559503608 1.0661525559503608 1.0661525559503608)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.878093207499263 0)
"cameras" SET Transform eulerAngles (-14.669184175610418 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5365939559187827
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9933414254045907
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1871172105868352
"cameras/drone/drone0" SET Transform localPosition (-0.33589280970536317 0.3277274026369941 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1672266984883783 1.1365940237548302 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 3 4)
"cameras/drone/drone0" SET Transform localScale (1.084629974264015 1.084629974264015 1.084629974264015)
"cameras/drone/drone1" SET Transform localEulerAngles (7 6 12)
"cameras/drone/drone1" SET Transform localScale (0.7222826386023674 0.7222826386023674 0.7222826386023674)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.641886406771514 0)
"cameras" SET Transform eulerAngles (-5.203665318753604 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5729292347995918
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0205287669701213
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30778825516352093
"cameras/drone/drone0" SET Transform localPosition (0.1643375878922002 0.05832167224394608 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9430948187955381 1.289376783237642 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 2 9)
"cameras/drone/drone0" SET Transform localScale (1.1961701104149234 1.1961701104149234 1.1961701104149234)
"cameras/drone/drone1" SET Transform localEulerAngles (6 18 2)
"cameras/drone/drone1" SET Transform localScale (1.1146905110218848 1.1146905110218848 1.1146905110218848)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.27329080505705 0)
"cameras" SET Transform eulerAngles (-7.443464562921376 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4244597615624823
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8014699266129397
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10752652925988536
"cameras/drone/drone0" SET Transform localPosition (-0.5128300395709036 0.2970435696206703 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1209570986312476 1.2821562831885183 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -4 -9)
"cameras/drone/drone0" SET Transform localScale (1.4286967464856084 1.4286967464856084 1.4286967464856084)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -13 20)
"cameras/drone/drone1" SET Transform localScale (0.8493036498645518 0.8493036498645518 0.8493036498645518)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.365449925797172 0)
"cameras" SET Transform eulerAngles (1.666399306248799 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3664527655641647
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.157718106533172
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26618208425007484
"cameras/drone/drone0" SET Transform localPosition (-0.4577897646484821 0.24020413800851798 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9636871683552186 1.243714958536726 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 15 -4)
"cameras/drone/drone0" SET Transform localScale (0.6026048932936424 0.6026048932936424 0.6026048932936424)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -6 -11)
"cameras/drone/drone1" SET Transform localScale (1.051509511707271 1.051509511707271 1.051509511707271)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.797836605686868 0)
"cameras" SET Transform eulerAngles (-16.535499458170136 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.48270751999781764
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9580993727117199
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2578096589337352
"cameras/drone/drone0" SET Transform localPosition (0.7510118318870354 -0.259440307415471 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8919721804002813 1.0760672009226544 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -9 -1)
"cameras/drone/drone0" SET Transform localScale (1.1590526697318324 1.1590526697318324 1.1590526697318324)
"cameras/drone/drone1" SET Transform localEulerAngles (7 2 -18)
"cameras/drone/drone1" SET Transform localScale (1.462100940279889 1.462100940279889 1.462100940279889)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.696184651160595 0)
"cameras" SET Transform eulerAngles (-17.337330448138907 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5023797852929417
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4229622202067942
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1819087956152027
"cameras/drone/drone0" SET Transform localPosition (0.7220054183837008 0.06591294090466598 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.26130094583518204 0.8530825779218795 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 3 -20)
"cameras/drone/drone0" SET Transform localScale (1.3875557783777148 1.3875557783777148 1.3875557783777148)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -6 -7)
"cameras/drone/drone1" SET Transform localScale (1.144472714807651 1.144472714807651 1.144472714807651)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3128073745062894 0)
"cameras" SET Transform eulerAngles (17.45039525296844 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7796236150025664
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.991315944964362
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04481623825049126
"cameras/drone/drone0" SET Transform localPosition (0.4498099376217115 0.5208312139429241 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.40146007132432215 0.8360495636953861 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 8 -6)
"cameras/drone/drone0" SET Transform localScale (0.9592830311696223 0.9592830311696223 0.9592830311696223)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 15 -12)
"cameras/drone/drone1" SET Transform localScale (0.9094344825775788 0.9094344825775788 0.9094344825775788)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.229374332079278 0)
"cameras" SET Transform eulerAngles (-14.01444499416586 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4436463237614474
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1901766271267304
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13904059735252736
"cameras/drone/drone0" SET Transform localPosition (-0.37612637079259514 0.38936839527934036 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8086830006319623 0.9787377953043391 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -12 8)
"cameras/drone/drone0" SET Transform localScale (0.8599008823652665 0.8599008823652665 0.8599008823652665)
"cameras/drone/drone1" SET Transform localEulerAngles (11 19 -1)
"cameras/drone/drone1" SET Transform localScale (1.4671647182063121 1.4671647182063121 1.4671647182063121)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.3262019580536215 0)
"cameras" SET Transform eulerAngles (6.62380358415707 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3649630795865606
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.905690166986124
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3753656440184895
"cameras/drone/drone0" SET Transform localPosition (-1.185892071194772 -0.07255229558555903 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9889477086658905 1.1192644736314694 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 17 -11)
"cameras/drone/drone0" SET Transform localScale (1.2625928290160013 1.2625928290160013 1.2625928290160013)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -4 2)
"cameras/drone/drone1" SET Transform localScale (0.8776295585715292 0.8776295585715292 0.8776295585715292)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0913064078266297 0)
"cameras" SET Transform eulerAngles (16.164720704793652 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2802273293511153
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5626940441631962
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.025771167533289632
"cameras/drone/drone0" SET Transform localPosition (0.39541240145984835 0.4533825871591323 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6566808082771954 0.8014916394701485 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -15 17)
"cameras/drone/drone0" SET Transform localScale (1.2851339402967485 1.2851339402967485 1.2851339402967485)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -7 -1)
"cameras/drone/drone1" SET Transform localScale (1.3136064921481645 1.3136064921481645 1.3136064921481645)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.35669367281522 0)
"cameras" SET Transform eulerAngles (2.001867550330637 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.139628542343529
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6338857153788362
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0856324553601775
"cameras/drone/drone0" SET Transform localPosition (-1.0359141260801041 0.1130257994623573 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9446752076428135 0.9880317791471116 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 7 9)
"cameras/drone/drone0" SET Transform localScale (1.1328715676485372 1.1328715676485372 1.1328715676485372)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -8 -9)
"cameras/drone/drone1" SET Transform localScale (1.1015726856428403 1.1015726856428403 1.1015726856428403)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7005778715668374 0)
"cameras" SET Transform eulerAngles (-9.631164613186955 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1099415430470936
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8473669956677994
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11409719735565127
"cameras/drone/drone0" SET Transform localPosition (-0.5252222826203552 0.19054346442608344 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.087230345791326 0.884689537717946 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -3 -11)
"cameras/drone/drone0" SET Transform localScale (1.227987598408538 1.227987598408538 1.227987598408538)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -18 -10)
"cameras/drone/drone1" SET Transform localScale (0.6185036525126005 0.6185036525126005 0.6185036525126005)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.467911381183197 0)
"cameras" SET Transform eulerAngles (3.0138968895821776 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7580113533799222
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.172722841359887
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3450099110432252
"cameras/drone/drone0" SET Transform localPosition (-1.1122089218141495 -0.20928447950307222 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9972072555729016 1.288435756811227 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 9 1)
"cameras/drone/drone0" SET Transform localScale (1.157907094109728 1.157907094109728 1.157907094109728)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -7 19)
"cameras/drone/drone1" SET Transform localScale (0.9700376852792023 0.9700376852792023 0.9700376852792023)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0283778006172266 0)
"cameras" SET Transform eulerAngles (-12.979907593970562 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6933501084201734
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5451969480594707
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15279131082343855
"cameras/drone/drone0" SET Transform localPosition (0.4987510793497649 0.22580548280507712 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.09647335388181721 0.8648111243501606 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 14 10)
"cameras/drone/drone0" SET Transform localScale (1.4382207564472462 1.4382207564472462 1.4382207564472462)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -20 5)
"cameras/drone/drone1" SET Transform localScale (1.0857480616803077 1.0857480616803077 1.0857480616803077)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.111228983076443 0)
"cameras" SET Transform eulerAngles (-5.438101357776347 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2390986760681724
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0150808616693467
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2418409353624844
"cameras/drone/drone0" SET Transform localPosition (-0.910322563407707 0.24505691054803486 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2509080174281253 1.1192508073211682 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 18 17)
"cameras/drone/drone0" SET Transform localScale (1.4596623991875215 1.4596623991875215 1.4596623991875215)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -18 -13)
"cameras/drone/drone1" SET Transform localScale (0.8270245267686601 0.8270245267686601 0.8270245267686601)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2996952295101845 0)
"cameras" SET Transform eulerAngles (-2.371103503075034 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9803389760309705
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.412335045553477
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39672437186650317
"cameras/drone/drone0" SET Transform localPosition (-0.036622122269153845 0.5689896381049591 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8749265637522732 1.0253147629300263 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -4 20)
"cameras/drone/drone0" SET Transform localScale (1.409203719876812 1.409203719876812 1.409203719876812)
"cameras/drone/drone1" SET Transform localEulerAngles (4 12 0)
"cameras/drone/drone1" SET Transform localScale (0.9482782663873728 0.9482782663873728 0.9482782663873728)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.708487671672365 0)
"cameras" SET Transform eulerAngles (2.1493289583813002 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4471069748819074
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9675915996028092
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.007941097040223255
"cameras/drone/drone0" SET Transform localPosition (0.7932576811257361 0.07077948066796086 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.38726378183580623 1.1827607317730435 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 9 0)
"cameras/drone/drone0" SET Transform localScale (1.1433957061586337 1.1433957061586337 1.1433957061586337)
"cameras/drone/drone1" SET Transform localEulerAngles (19 7 -17)
"cameras/drone/drone1" SET Transform localScale (0.8987662181432894 0.8987662181432894 0.8987662181432894)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.941113761081615 0)
"cameras" SET Transform eulerAngles (-10.88202578049923 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4639251803014521
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0768646366186752
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2658960098286748
"cameras/drone/drone0" SET Transform localPosition (0.6604046080300146 0.28934237929614776 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.33983584893439445 1.1229322045748302 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 19 11)
"cameras/drone/drone0" SET Transform localScale (1.4756190037542423 1.4756190037542423 1.4756190037542423)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 13 -15)
"cameras/drone/drone1" SET Transform localScale (0.8937043327046275 0.8937043327046275 0.8937043327046275)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.948620397036596 0)
"cameras" SET Transform eulerAngles (10.181451713380994 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5548942827366983
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8288167141135736
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.267930191934893
"cameras/drone/drone0" SET Transform localPosition (-1.103684978567493 0.6634485570738684 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.47790691516634864 1.2880840338297748 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 0 -1)
"cameras/drone/drone0" SET Transform localScale (1.2467707837895667 1.2467707837895667 1.2467707837895667)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 6 -8)
"cameras/drone/drone1" SET Transform localScale (1.4264011523660356 1.4264011523660356 1.4264011523660356)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
