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
[UI.Window] ShowFromCamera "cameras/segmentation" AS "segmentation" WITH 1536 1152 24 "ARGBFloat" "Default"
"cameras/segmentation" SET active true
CREATE "cameras/cameraRGB"
"cameras/cameraRGB" SET active false
"cameras/cameraRGB" ADD Camera AudioListener
"cameras/cameraRGB" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings" allowHDR true 
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
"disk1/Cameras/segmentation" SET Sensors.RenderTextureLink outputType "CUSTOM" outputChannels 3 outputPixelSize 4 outputExtension "png"
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
"spawner/city/nature/trees/container" SET RandomProps.PropArea async false numberOfProps 170 collisionCheck false stickToGround false 
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
"spawner/animals/generic/container" SET RandomProps.PropArea async false numberOfProps 16 collisionCheck false stickToGround false 
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
"spawner/animals/birds/container" SET RandomProps.PropArea async false numberOfProps 33 collisionCheck true stickToGround false 
"spawner/animals/birds/container" SET RandomProps.Torus radius 120
"spawner/animals/birds/container" SET RandomProps.Torus innerRadius 0
"spawner/animals/birds/container" SET Transform position (0 90 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/animals/birds/container" SET active true
"spawner/animals/birds" SET active true
CREATE "spawner/cars/container"
"spawner/cars/container" SET active false
"spawner/cars/container" ADD RandomProps.Torus
"spawner/cars/container" ADD RandomProps.PropArea
"spawner/cars/container" SET RandomProps.PropArea tags "car"
"spawner/cars/container" SET RandomProps.PropArea async false numberOfProps 5 collisionCheck false stickToGround false 
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
"cameras" SET Transform eulerAngles (-9.37121957037451 0 0)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 99
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 3.1042993325701995 0)
"cameras" SET Transform eulerAngles (-9.113497148859144 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5355769826552109
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.502861765676316
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0041360973776849
"cameras/drone/drone0" SET Transform localPosition (-1.1139375535948763 0.3360368325641034 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1758985218441131 1.1912954066654913 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -20 -5)
"cameras/drone/drone0" SET Transform localScale (1.2814337153072093 1.2814337153072093 1.2814337153072093)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 1 16)
"cameras/drone/drone1" SET Transform localScale (1.3678137235389882 1.3678137235389882 1.3678137235389882)
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
"cameras" SET Transform position (0 3.5355099760599806 0)
"cameras" SET Transform eulerAngles (-13.970675713207266 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4596705742031468
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1861540265608788
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05659591859735605
"cameras/drone/drone0" SET Transform localPosition (0.975059997089528 0.39762828127744115 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8052640622754594 1.0833070245511986 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 4 20)
"cameras/drone/drone0" SET Transform localScale (0.7696063945828009 0.7696063945828009 0.7696063945828009)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -5 9)
"cameras/drone/drone1" SET Transform localScale (0.9868546849817814 0.9868546849817814 0.9868546849817814)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.271671259050105 0)
"cameras" SET Transform eulerAngles (-11.09853687983672 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1734374785885215
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9516648949342885
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24849082341898499
"cameras/drone/drone0" SET Transform localPosition (0.004142086427497693 0.6034399185454373 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.07284066877440254 1.2425017518884933 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -5 -15)
"cameras/drone/drone0" SET Transform localScale (1.4155529290634274 1.4155529290634274 1.4155529290634274)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -2 -13)
"cameras/drone/drone1" SET Transform localScale (1.4213922918215265 1.4213922918215265 1.4213922918215265)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.939184985439395 0)
"cameras" SET Transform eulerAngles (-13.8269398150547 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6263492640989743
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9586765962670185
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0023791008985805107
"cameras/drone/drone0" SET Transform localPosition (-0.29671292949415207 0.09327825110923799 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3569863551083864 1.1151845871250279 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -20 1)
"cameras/drone/drone0" SET Transform localScale (0.9517627623681439 0.9517627623681439 0.9517627623681439)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -18 -14)
"cameras/drone/drone1" SET Transform localScale (1.2950280484218328 1.2950280484218328 1.2950280484218328)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.370874034178053 0)
"cameras" SET Transform eulerAngles (17.977250154439773 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.48100956040636944
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7254712257140707
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23764993219270958
"cameras/drone/drone0" SET Transform localPosition (-1.1931465289809988 0.21928328456756202 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.13482260751568553 1.1457061464415008 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -18 -7)
"cameras/drone/drone0" SET Transform localScale (0.8960815583408599 0.8960815583408599 0.8960815583408599)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -6 2)
"cameras/drone/drone1" SET Transform localScale (1.4278390996120316 1.4278390996120316 1.4278390996120316)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.876311239137522 0)
"cameras" SET Transform eulerAngles (7.040052545968148 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.163226207970188
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5511040668409104
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.053879566029402075
"cameras/drone/drone0" SET Transform localPosition (0.4398372822292216 -0.23924621179356603 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1530098386656278 1.1952219229140937 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 1 -16)
"cameras/drone/drone0" SET Transform localScale (0.6835433851826271 0.6835433851826271 0.6835433851826271)
"cameras/drone/drone1" SET Transform localEulerAngles (2 10 9)
"cameras/drone/drone1" SET Transform localScale (0.8470343161162993 0.8470343161162993 0.8470343161162993)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.507543074086163 0)
"cameras" SET Transform eulerAngles (2.778968485694044 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6593728534531091
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3092078954240698
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30375902366430685
"cameras/drone/drone0" SET Transform localPosition (0.16851622104132402 0.10957139129321886 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.061356638498039 1.211412366884738 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 10 5)
"cameras/drone/drone0" SET Transform localScale (1.1256588186140974 1.1256588186140974 1.1256588186140974)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 7 15)
"cameras/drone/drone1" SET Transform localScale (0.6671083995499755 0.6671083995499755 0.6671083995499755)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4216928322133033 0)
"cameras" SET Transform eulerAngles (11.866058152094375 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9788869489507603
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1534231244016995
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2972227933456077
"cameras/drone/drone0" SET Transform localPosition (0.7989975911786567 0.6086341857092965 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4754225891461228 0.8071004376839581 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -11 13)
"cameras/drone/drone0" SET Transform localScale (0.8823002513930381 0.8823002513930381 0.8823002513930381)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 8 5)
"cameras/drone/drone1" SET Transform localScale (1.4091706609924892 1.4091706609924892 1.4091706609924892)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.664842461295186 0)
"cameras" SET Transform eulerAngles (-5.781000192139576 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.49209655653364714
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5332445069316591
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1885736562976852
"cameras/drone/drone0" SET Transform localPosition (0.5441813300683047 0.05449929536217918 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.019714050546974837 0.8537855197144054 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -16 -13)
"cameras/drone/drone0" SET Transform localScale (0.9140224645517835 0.9140224645517835 0.9140224645517835)
"cameras/drone/drone1" SET Transform localEulerAngles (16 14 -7)
"cameras/drone/drone1" SET Transform localScale (1.3491428308942404 1.3491428308942404 1.3491428308942404)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9697925092260657 0)
"cameras" SET Transform eulerAngles (-1.8569559876338175 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9222775108678598
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0795218478957098
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19997960086613698
"cameras/drone/drone0" SET Transform localPosition (0.16726235834329972 0.6060946615730438 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7908167464586321 1.0611264031307421 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 8 -12)
"cameras/drone/drone0" SET Transform localScale (1.0462271183928955 1.0462271183928955 1.0462271183928955)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 9 18)
"cameras/drone/drone1" SET Transform localScale (1.4808740275715042 1.4808740275715042 1.4808740275715042)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9603544656793606 0)
"cameras" SET Transform eulerAngles (7.222603424737493 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1709401893965852
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3466067724228197
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09913933524343244
"cameras/drone/drone0" SET Transform localPosition (-0.6375219921887557 0.5377679936151958 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6069727576153191 1.0037302343420318 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -18 -13)
"cameras/drone/drone0" SET Transform localScale (1.4557200448454264 1.4557200448454264 1.4557200448454264)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -1 -2)
"cameras/drone/drone1" SET Transform localScale (1.4758397381190167 1.4758397381190167 1.4758397381190167)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2144594195672433 0)
"cameras" SET Transform eulerAngles (11.249641453910357 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.42089083919695586
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5138394590231656
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10723048827688603
"cameras/drone/drone0" SET Transform localPosition (1.032666242709629 0.6687102368433688 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5565203426586358 1.1036490142255793 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -13 0)
"cameras/drone/drone0" SET Transform localScale (0.606932056767367 0.606932056767367 0.606932056767367)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -13 -15)
"cameras/drone/drone1" SET Transform localScale (1.2799501185584379 1.2799501185584379 1.2799501185584379)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.915981958756504 0)
"cameras" SET Transform eulerAngles (-6.167868820917008 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7607979653945199
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9271048247469889
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.005186559436982208
"cameras/drone/drone0" SET Transform localPosition (0.34151756208330486 0.16035054390082587 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6948397058724568 1.2716048722535527 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 19 -7)
"cameras/drone/drone0" SET Transform localScale (0.710891186195464 0.710891186195464 0.710891186195464)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 11 -3)
"cameras/drone/drone1" SET Transform localScale (0.6841259615196412 0.6841259615196412 0.6841259615196412)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.191399369890574 0)
"cameras" SET Transform eulerAngles (8.553518260109094 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5118915121316783
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6763765596014162
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3089479840622642
"cameras/drone/drone0" SET Transform localPosition (-1.0192138137579734 -0.0072280747661346845 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.648609285440474 0.9263623716197279 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 14 3)
"cameras/drone/drone0" SET Transform localScale (0.9064540072535676 0.9064540072535676 0.9064540072535676)
"cameras/drone/drone1" SET Transform localEulerAngles (1 9 -14)
"cameras/drone/drone1" SET Transform localScale (0.6906515448889308 0.6906515448889308 0.6906515448889308)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.758739336742203 0)
"cameras" SET Transform eulerAngles (15.656998932206115 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1902151820552442
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7517604035497292
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39897641241398807
"cameras/drone/drone0" SET Transform localPosition (-0.595014035761127 0.43760828592131945 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2996429549907662 1.2692770405280305 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 9 -8)
"cameras/drone/drone0" SET Transform localScale (0.7537785714222168 0.7537785714222168 0.7537785714222168)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 20 -16)
"cameras/drone/drone1" SET Transform localScale (0.8101212282283514 0.8101212282283514 0.8101212282283514)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.203818836793286 0)
"cameras" SET Transform eulerAngles (-16.54764915886837 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6991298916946467
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4780877317531704
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15526600816937042
"cameras/drone/drone0" SET Transform localPosition (0.5602296730276937 0.36171443146730414 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8065306568466355 0.9458267789294725 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 8 -5)
"cameras/drone/drone0" SET Transform localScale (1.3559242170071641 1.3559242170071641 1.3559242170071641)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -18 -19)
"cameras/drone/drone1" SET Transform localScale (1.4339244043146613 1.4339244043146613 1.4339244043146613)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.2307500519897925 0)
"cameras" SET Transform eulerAngles (4.699121573868382 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5519427367706458
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9525121999636694
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.340030743752113
"cameras/drone/drone0" SET Transform localPosition (-0.23924635169372466 -0.02996707892509559 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0068076798384704 0.9495184753226802 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 14 -11)
"cameras/drone/drone0" SET Transform localScale (1.396813840738123 1.396813840738123 1.396813840738123)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -18 7)
"cameras/drone/drone1" SET Transform localScale (0.6327686507828715 0.6327686507828715 0.6327686507828715)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2880681305919364 0)
"cameras" SET Transform eulerAngles (14.594359793739343 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.44720404523594276
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.392340024100362
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23180845099220282
"cameras/drone/drone0" SET Transform localPosition (-1.0187556377457834 0.10722316215158095 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8821854107854328 1.2380227827266823 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -11 9)
"cameras/drone/drone0" SET Transform localScale (1.4572133285389204 1.4572133285389204 1.4572133285389204)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -2 -2)
"cameras/drone/drone1" SET Transform localScale (1.0611463004435344 1.0611463004435344 1.0611463004435344)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.307775455793713 0)
"cameras" SET Transform eulerAngles (-17.217738254432973 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9932594280296247
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.928095371852503
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3325578745307605
"cameras/drone/drone0" SET Transform localPosition (0.3212111096090229 0.6560179221017821 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.32229918195758045 1.2978510523030515 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -18 -1)
"cameras/drone/drone0" SET Transform localScale (0.6347515391597373 0.6347515391597373 0.6347515391597373)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -13 -5)
"cameras/drone/drone1" SET Transform localScale (1.023138317257102 1.023138317257102 1.023138317257102)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5965414863512954 0)
"cameras" SET Transform eulerAngles (-2.3622364688414237 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3880501058487236
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5581400697573897
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38529526548937115
"cameras/drone/drone0" SET Transform localPosition (-0.5196055343093745 0.23587803661537882 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.0051579347076686766 1.2865698959500367 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 5 -14)
"cameras/drone/drone0" SET Transform localScale (0.6923387819018425 0.6923387819018425 0.6923387819018425)
"cameras/drone/drone1" SET Transform localEulerAngles (16 8 20)
"cameras/drone/drone1" SET Transform localScale (0.6428705429801753 0.6428705429801753 0.6428705429801753)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0230101415091637 0)
"cameras" SET Transform eulerAngles (2.2204282266911015 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3932376625647596
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.563323293006536
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06245292153342135
"cameras/drone/drone0" SET Transform localPosition (-1.1883597436129778 0.11594285976268132 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5110429642277534 0.8992559647727135 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 1 2)
"cameras/drone/drone0" SET Transform localScale (1.3422931084656349 1.3422931084656349 1.3422931084656349)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -10 -4)
"cameras/drone/drone1" SET Transform localScale (1.1297795514467375 1.1297795514467375 1.1297795514467375)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.40978021329276 0)
"cameras" SET Transform eulerAngles (-17.865596450417396 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4970323469436662
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.159003300820069
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3021894881888052
"cameras/drone/drone0" SET Transform localPosition (-0.46605481413259453 -0.2800341634579892 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7567570625609541 0.9328031857661547 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 1 7)
"cameras/drone/drone0" SET Transform localScale (0.8876523621976027 0.8876523621976027 0.8876523621976027)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 18 12)
"cameras/drone/drone1" SET Transform localScale (0.9653258374727531 0.9653258374727531 0.9653258374727531)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7276327955702016 0)
"cameras" SET Transform eulerAngles (-12.516042210239537 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1751547226988288
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.804771747253123
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06016204937605423
"cameras/drone/drone0" SET Transform localPosition (-1.1183355188250441 -0.24632614655691126 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8304132864146183 0.8413723030967142 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -17 -2)
"cameras/drone/drone0" SET Transform localScale (1.41021139000263 1.41021139000263 1.41021139000263)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 6 -11)
"cameras/drone/drone1" SET Transform localScale (1.02335003454197 1.02335003454197 1.02335003454197)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.712198504208014 0)
"cameras" SET Transform eulerAngles (12.723371087536286 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.356099716541167
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3908097440065152
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36058565137364407
"cameras/drone/drone0" SET Transform localPosition (-0.3459002064643225 0.017401853866978845 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.067198447251152 0.8172313053326756 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 7 8)
"cameras/drone/drone0" SET Transform localScale (0.9213624922591976 0.9213624922591976 0.9213624922591976)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 17 7)
"cameras/drone/drone1" SET Transform localScale (0.863212730948573 0.863212730948573 0.863212730948573)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.917161742576691 0)
"cameras" SET Transform eulerAngles (-8.711086487887254 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4315019322877949
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4972371530455344
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3089559097056925
"cameras/drone/drone0" SET Transform localPosition (-0.7615329405756474 -0.2538941847039576 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5011741772010176 1.0255691898035064 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -18 -20)
"cameras/drone/drone0" SET Transform localScale (1.3737631656368325 1.3737631656368325 1.3737631656368325)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -3 -17)
"cameras/drone/drone1" SET Transform localScale (0.9954859220428647 0.9954859220428647 0.9954859220428647)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.466224051967444 0)
"cameras" SET Transform eulerAngles (6.973762955831635 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9083447160847928
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8585809075717663
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.258767211567306
"cameras/drone/drone0" SET Transform localPosition (1.1790406461692797 0.4342762912852966 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7992573994024783 1.0446166034919684 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -14 3)
"cameras/drone/drone0" SET Transform localScale (1.1773266176042383 1.1773266176042383 1.1773266176042383)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -15 18)
"cameras/drone/drone1" SET Transform localScale (0.9264844361103406 0.9264844361103406 0.9264844361103406)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0193286586091252 0)
"cameras" SET Transform eulerAngles (2.799038292015844 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2445976849841722
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.926236785991066
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22622278580179522
"cameras/drone/drone0" SET Transform localPosition (0.44207807980009695 0.612944471493714 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8073478769753077 0.9984889553437606 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -7 -10)
"cameras/drone/drone0" SET Transform localScale (0.6920346248439677 0.6920346248439677 0.6920346248439677)
"cameras/drone/drone1" SET Transform localEulerAngles (19 3 0)
"cameras/drone/drone1" SET Transform localScale (1.446265756740098 1.446265756740098 1.446265756740098)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.561918099475934 0)
"cameras" SET Transform eulerAngles (8.665073726349721 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0238426519699417
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4561077319249662
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.008202236465830959
"cameras/drone/drone0" SET Transform localPosition (0.43966240734029816 0.3105357538219868 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1871771272881284 0.9452706584121983 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -13 1)
"cameras/drone/drone0" SET Transform localScale (0.9292675019247159 0.9292675019247159 0.9292675019247159)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -5 13)
"cameras/drone/drone1" SET Transform localScale (0.6517138475456585 0.6517138475456585 0.6517138475456585)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.082198019416028 0)
"cameras" SET Transform eulerAngles (-17.448461013775013 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4800639016768091
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4424374352200995
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28419783904190854
"cameras/drone/drone0" SET Transform localPosition (0.21305325733078018 0.5603787154730788 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8420059690949369 0.8972181350346231 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 17 13)
"cameras/drone/drone0" SET Transform localScale (0.6571986902340468 0.6571986902340468 0.6571986902340468)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -20 1)
"cameras/drone/drone1" SET Transform localScale (1.2133669354523215 1.2133669354523215 1.2133669354523215)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.070986862190358 0)
"cameras" SET Transform eulerAngles (2.7419523062609166 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.44976319646754465
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5100622593116788
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2973507963259587
"cameras/drone/drone0" SET Transform localPosition (0.0737488672188591 -0.004698874165787903 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.21929153690807246 0.8649077464463071 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -10 0)
"cameras/drone/drone0" SET Transform localScale (1.0937482478111393 1.0937482478111393 1.0937482478111393)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -19 5)
"cameras/drone/drone1" SET Transform localScale (0.6011754375936843 0.6011754375936843 0.6011754375936843)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.145600100771458 0)
"cameras" SET Transform eulerAngles (-15.862280146566242 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3238434273196789
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.24890140569744
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.320926202977042
"cameras/drone/drone0" SET Transform localPosition (0.7640664710569043 0.3159921400962152 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6389028187853567 1.268426381031019 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -8 13)
"cameras/drone/drone0" SET Transform localScale (0.9146221432132655 0.9146221432132655 0.9146221432132655)
"cameras/drone/drone1" SET Transform localEulerAngles (7 19 -17)
"cameras/drone/drone1" SET Transform localScale (1.2273346648624124 1.2273346648624124 1.2273346648624124)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5813872852826827 0)
"cameras" SET Transform eulerAngles (-18.84570994145829 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0832165082509375
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1713022267633255
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3238320182465564
"cameras/drone/drone0" SET Transform localPosition (0.16868505785483068 0.04067958890441575 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.11386202264009881 0.8647515063418425 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 9 7)
"cameras/drone/drone0" SET Transform localScale (0.6921833585029046 0.6921833585029046 0.6921833585029046)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -7 -1)
"cameras/drone/drone1" SET Transform localScale (1.1350276062239217 1.1350276062239217 1.1350276062239217)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.012120421625246 0)
"cameras" SET Transform eulerAngles (17.204525572619985 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7867856032292383
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.345228729224151
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07657559293658639
"cameras/drone/drone0" SET Transform localPosition (-0.0841869861077773 0.5249851409685655 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9171608941156777 0.812846795665658 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 3 -7)
"cameras/drone/drone0" SET Transform localScale (1.0656131008315763 1.0656131008315763 1.0656131008315763)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 14 2)
"cameras/drone/drone1" SET Transform localScale (1.358049805874476 1.358049805874476 1.358049805874476)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5576283988450985 0)
"cameras" SET Transform eulerAngles (7.716724585431102 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4355002711430616
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2131720181189058
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3991533465216635
"cameras/drone/drone0" SET Transform localPosition (-0.6950085928701902 -0.10858805871317828 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.16405336794553183 1.276380243239742 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 10 4)
"cameras/drone/drone0" SET Transform localScale (1.024791373633699 1.024791373633699 1.024791373633699)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 16 13)
"cameras/drone/drone1" SET Transform localScale (1.0705229437353192 1.0705229437353192 1.0705229437353192)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0411393117329437 0)
"cameras" SET Transform eulerAngles (-7.86091225225392 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4194349958967364
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2600083005018372
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03511214846387358
"cameras/drone/drone0" SET Transform localPosition (0.2574814974272248 -0.22514663907874183 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0292400136924076 0.8246181890879729 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -3 15)
"cameras/drone/drone0" SET Transform localScale (0.9931540159233184 0.9931540159233184 0.9931540159233184)
"cameras/drone/drone1" SET Transform localEulerAngles (13 18 7)
"cameras/drone/drone1" SET Transform localScale (0.9971374740602007 0.9971374740602007 0.9971374740602007)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.712992634700079 0)
"cameras" SET Transform eulerAngles (-6.146483992490243 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7748786208900194
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5990767223871982
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17279623299000565
"cameras/drone/drone0" SET Transform localPosition (0.6212714795090704 0.6441074749835249 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5882053411280395 1.2018558242129362 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 4 -3)
"cameras/drone/drone0" SET Transform localScale (0.9453839193645053 0.9453839193645053 0.9453839193645053)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 5 -7)
"cameras/drone/drone1" SET Transform localScale (0.7972351320683336 0.7972351320683336 0.7972351320683336)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9627586346334436 0)
"cameras" SET Transform eulerAngles (9.60355970514195 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8553777828405434
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1218574675179411
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.021169699250298102
"cameras/drone/drone0" SET Transform localPosition (-0.9143946867789974 0.4606255904182492 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.051446084944223314 0.9400390721564496 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -19 -15)
"cameras/drone/drone0" SET Transform localScale (1.0600197735457448 1.0600197735457448 1.0600197735457448)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -9 -6)
"cameras/drone/drone1" SET Transform localScale (0.6247452591617382 0.6247452591617382 0.6247452591617382)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.573132870943275 0)
"cameras" SET Transform eulerAngles (-5.5152963175954675 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7870671537281904
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.20250912503596
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07661965294886262
"cameras/drone/drone0" SET Transform localPosition (0.27125364052728473 -0.052007838729658695 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5653228980796907 1.042958126711793 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -18 3)
"cameras/drone/drone0" SET Transform localScale (1.4417596700418 1.4417596700418 1.4417596700418)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -11 -17)
"cameras/drone/drone1" SET Transform localScale (1.187906160928832 1.187906160928832 1.187906160928832)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.978845938790608 0)
"cameras" SET Transform eulerAngles (-2.3670297466533583 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9660674065685768
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.181930855142297
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28322485056386054
"cameras/drone/drone0" SET Transform localPosition (0.6871720520414186 0.359049929569251 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5060425826617265 0.8511145817799033 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 1 7)
"cameras/drone/drone0" SET Transform localScale (0.8032006762100062 0.8032006762100062 0.8032006762100062)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -14 -17)
"cameras/drone/drone1" SET Transform localScale (1.1952883960858907 1.1952883960858907 1.1952883960858907)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.445960750439579 0)
"cameras" SET Transform eulerAngles (2.195993349278382 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5268611822120021
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8348067265051675
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3701182833050525
"cameras/drone/drone0" SET Transform localPosition (0.6655612326935902 -0.025183264539048122 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9707764637706195 0.9892969376686522 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 3 -18)
"cameras/drone/drone0" SET Transform localScale (0.6263016977943279 0.6263016977943279 0.6263016977943279)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 4 3)
"cameras/drone/drone1" SET Transform localScale (1.2527277481044243 1.2527277481044243 1.2527277481044243)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.915015447102986 0)
"cameras" SET Transform eulerAngles (7.656053589084504 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5111612217474093
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9390161162486693
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06422074420728685
"cameras/drone/drone0" SET Transform localPosition (-1.016956628437472 -0.19882052556020896 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.08061752003271283 0.971858213983972 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 1 -18)
"cameras/drone/drone0" SET Transform localScale (0.9963718853274949 0.9963718853274949 0.9963718853274949)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -11 -9)
"cameras/drone/drone1" SET Transform localScale (1.3337120822170736 1.3337120822170736 1.3337120822170736)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.120270072724069 0)
"cameras" SET Transform eulerAngles (16.12838963796024 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2856492608055
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5831397581733935
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02660303931519925
"cameras/drone/drone0" SET Transform localPosition (0.2413704793993503 0.48795350174719315 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4795840444161559 1.2118737460760176 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 8 -9)
"cameras/drone/drone0" SET Transform localScale (1.2102695343075363 1.2102695343075363 1.2102695343075363)
"cameras/drone/drone1" SET Transform localEulerAngles (1 6 9)
"cameras/drone/drone1" SET Transform localScale (1.2534037793656816 1.2534037793656816 1.2534037793656816)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.451469944307389 0)
"cameras" SET Transform eulerAngles (-11.016032879573103 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.31807324570533
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8531431409523569
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2359769585391144
"cameras/drone/drone0" SET Transform localPosition (-0.5583189730527243 0.6027169480776469 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.35224574452563484 1.1187808985403296 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 13 -17)
"cameras/drone/drone0" SET Transform localScale (1.058069476766883 1.058069476766883 1.058069476766883)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -20 17)
"cameras/drone/drone1" SET Transform localScale (1.0023190295232565 1.0023190295232565 1.0023190295232565)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.110005450793203 0)
"cameras" SET Transform eulerAngles (-9.44998132231072 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5903482759179575
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1256046505647654
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07563586709855503
"cameras/drone/drone0" SET Transform localPosition (-0.10777635137738617 -0.005737548435547579 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.13304670360685833 0.9822845450137707 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 7 17)
"cameras/drone/drone0" SET Transform localScale (0.8723419477454695 0.8723419477454695 0.8723419477454695)
"cameras/drone/drone1" SET Transform localEulerAngles (6 17 7)
"cameras/drone/drone1" SET Transform localScale (0.6909880432115122 0.6909880432115122 0.6909880432115122)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.910422267901043 0)
"cameras" SET Transform eulerAngles (8.836578983516418 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3395217298453908
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.653976547110764
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18676255084238602
"cameras/drone/drone0" SET Transform localPosition (0.09192298787072906 0.07710112850271372 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5861145632748848 1.0871540072543042 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 3 20)
"cameras/drone/drone0" SET Transform localScale (0.6604037022920414 0.6604037022920414 0.6604037022920414)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -3 -12)
"cameras/drone/drone1" SET Transform localScale (0.7709628610658277 0.7709628610658277 0.7709628610658277)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0336896170229335 0)
"cameras" SET Transform eulerAngles (15.209644847178502 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5879277959449274
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2983870534376876
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3161939825693763
"cameras/drone/drone0" SET Transform localPosition (0.3642349922962085 -0.09119865045819159 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.14826843283996194 0.8804462895035061 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -13 5)
"cameras/drone/drone0" SET Transform localScale (1.1737817862776603 1.1737817862776603 1.1737817862776603)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 16 11)
"cameras/drone/drone1" SET Transform localScale (1.0769634329345055 1.0769634329345055 1.0769634329345055)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.524827075715779 0)
"cameras" SET Transform eulerAngles (14.624921099630782 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5323024185885059
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3345687792079088
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19690126895338636
"cameras/drone/drone0" SET Transform localPosition (1.1762058297948037 0.4052627663641221 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9443091074061234 1.1068038710914156 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -8 -6)
"cameras/drone/drone0" SET Transform localScale (1.3292586813905605 1.3292586813905605 1.3292586813905605)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 16 4)
"cameras/drone/drone1" SET Transform localScale (1.117720266206876 1.117720266206876 1.117720266206876)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.173038101639609 0)
"cameras" SET Transform eulerAngles (5.3362015517041925 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8776620677728197
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9901368743143246
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30473020716321364
"cameras/drone/drone0" SET Transform localPosition (-1.1826190702599766 0.6927756669746963 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.07537304454223137 0.8115842624350383 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -12 7)
"cameras/drone/drone0" SET Transform localScale (1.1040020297312965 1.1040020297312965 1.1040020297312965)
"cameras/drone/drone1" SET Transform localEulerAngles (15 7 -15)
"cameras/drone/drone1" SET Transform localScale (0.7558051068464262 0.7558051068464262 0.7558051068464262)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.849595661955592 0)
"cameras" SET Transform eulerAngles (16.047136854477827 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6778855276418849
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6213116324137686
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1393916452348563
"cameras/drone/drone0" SET Transform localPosition (0.9310028285452325 0.05123616614318588 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4408986043291172 0.8909759311666576 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -5 -19)
"cameras/drone/drone0" SET Transform localScale (1.167834997843069 1.167834997843069 1.167834997843069)
"cameras/drone/drone1" SET Transform localEulerAngles (16 17 4)
"cameras/drone/drone1" SET Transform localScale (1.0223904057074569 1.0223904057074569 1.0223904057074569)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.787917019363177 0)
"cameras" SET Transform eulerAngles (3.7277722285407435 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1159738670933197
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7485830321069762
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2723418550513011
"cameras/drone/drone0" SET Transform localPosition (-0.7393518170461432 0.554287903378857 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4779550211739907 0.9515481825153767 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -3 0)
"cameras/drone/drone0" SET Transform localScale (1.1725416113944562 1.1725416113944562 1.1725416113944562)
"cameras/drone/drone1" SET Transform localEulerAngles (16 19 1)
"cameras/drone/drone1" SET Transform localScale (0.9214026883962356 0.9214026883962356 0.9214026883962356)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.894289541376767 0)
"cameras" SET Transform eulerAngles (4.597560450823597 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9348018120777764
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0932196784534312
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16255267937779092
"cameras/drone/drone0" SET Transform localPosition (0.7845064398878556 0.24474683102667033 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5950916619388484 1.004728108423842 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -16 2)
"cameras/drone/drone0" SET Transform localScale (1.179530881161273 1.179530881161273 1.179530881161273)
"cameras/drone/drone1" SET Transform localEulerAngles (15 20 3)
"cameras/drone/drone1" SET Transform localScale (0.9493630558141919 0.9493630558141919 0.9493630558141919)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.367971773984454 0)
"cameras" SET Transform eulerAngles (-15.926029184613505 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.24398950795278
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1461511279039889
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04190857415409362
"cameras/drone/drone0" SET Transform localPosition (-0.15970498727449245 -0.07348639368839133 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1984082718868636 0.9466256436438321 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 4 -8)
"cameras/drone/drone0" SET Transform localScale (0.6977533040007508 0.6977533040007508 0.6977533040007508)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 16 -19)
"cameras/drone/drone1" SET Transform localScale (1.036129381746917 1.036129381746917 1.036129381746917)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.53868753962604 0)
"cameras" SET Transform eulerAngles (13.626917633550136 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5936114822812435
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.231495711116898
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15044736435494555
"cameras/drone/drone0" SET Transform localPosition (-0.2908054966832776 -0.26502041219894407 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1217933164411158 1.1674661562351305 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -15 -4)
"cameras/drone/drone0" SET Transform localScale (0.8556260957898196 0.8556260957898196 0.8556260957898196)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -2 -8)
"cameras/drone/drone1" SET Transform localScale (0.6009980065341348 0.6009980065341348 0.6009980065341348)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.395432962426117 0)
"cameras" SET Transform eulerAngles (-19.977264699912386 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5101636774975158
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.55456859011916
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11900808455794604
"cameras/drone/drone0" SET Transform localPosition (-1.1647659867712006 0.43968066294092983 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.46735403411599474 1.1651826610174254 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 16 -10)
"cameras/drone/drone0" SET Transform localScale (0.6400687031805742 0.6400687031805742 0.6400687031805742)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 10 -8)
"cameras/drone/drone1" SET Transform localScale (1.033994830225816 1.033994830225816 1.033994830225816)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.32495061810365 0)
"cameras" SET Transform eulerAngles (2.3876410002175064 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5466467321850137
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1335542669189296
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16763999471523935
"cameras/drone/drone0" SET Transform localPosition (0.4623211053453573 -0.08223216645525472 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7426676738762894 1.0294830427421902 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 7 -16)
"cameras/drone/drone0" SET Transform localScale (0.8047126324933891 0.8047126324933891 0.8047126324933891)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 0 1)
"cameras/drone/drone1" SET Transform localScale (1.3863327866462223 1.3863327866462223 1.3863327866462223)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.572697646846026 0)
"cameras" SET Transform eulerAngles (-5.202155147023632 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1471162005189766
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.758430718827833
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2958302854223032
"cameras/drone/drone0" SET Transform localPosition (0.8867680639815878 0.09091841017326535 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8890509870395675 0.8687372674648676 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 2 -19)
"cameras/drone/drone0" SET Transform localScale (1.3362603204306773 1.3362603204306773 1.3362603204306773)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 19 20)
"cameras/drone/drone1" SET Transform localScale (0.8728930455799297 0.8728930455799297 0.8728930455799297)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.851487590896096 0)
"cameras" SET Transform eulerAngles (-16.774083003604012 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3002230936714025
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9972858372216815
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18494978639105192
"cameras/drone/drone0" SET Transform localPosition (-0.37854274624467965 0.6807777691786752 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4077643345755101 1.1725493550216668 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -9 -14)
"cameras/drone/drone0" SET Transform localScale (0.9421629814405948 0.9421629814405948 0.9421629814405948)
"cameras/drone/drone1" SET Transform localEulerAngles (13 2 16)
"cameras/drone/drone1" SET Transform localScale (1.0652944228980208 1.0652944228980208 1.0652944228980208)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3101405302278035 0)
"cameras" SET Transform eulerAngles (-3.7166608350786454 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4058493752456234
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5740544747844436
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.238817360408442
"cameras/drone/drone0" SET Transform localPosition (-1.0579072776063836 0.614265589037156 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.34666965708780495 1.1085378351637372 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 1 11)
"cameras/drone/drone0" SET Transform localScale (0.910695879118296 0.910695879118296 0.910695879118296)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -9 19)
"cameras/drone/drone1" SET Transform localScale (0.9845225986074451 0.9845225986074451 0.9845225986074451)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.678526531064601 0)
"cameras" SET Transform eulerAngles (7.157662726950136 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.40001940814779613
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2053495159623666
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14027872910553582
"cameras/drone/drone0" SET Transform localPosition (0.15046134739636008 0.32821337707436277 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.17928225686732224 1.2781440915282654 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 16 -12)
"cameras/drone/drone0" SET Transform localScale (0.6886616527506414 0.6886616527506414 0.6886616527506414)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 12 -20)
"cameras/drone/drone1" SET Transform localScale (0.72116701685503 0.72116701685503 0.72116701685503)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.143567755766983 0)
"cameras" SET Transform eulerAngles (-1.2004883931342256 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2096466043405156
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3480763464853092
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21399028661247665
"cameras/drone/drone0" SET Transform localPosition (0.6517020996525953 0.17061601535281384 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5137894362889643 1.2903843068116425 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 12 7)
"cameras/drone/drone0" SET Transform localScale (1.3158746092403342 1.3158746092403342 1.3158746092403342)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 4 8)
"cameras/drone/drone1" SET Transform localScale (1.1660718521810522 1.1660718521810522 1.1660718521810522)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.195489977288128 0)
"cameras" SET Transform eulerAngles (-17.099342455355814 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.44272809872661023
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0396678060451345
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03466805660524304
"cameras/drone/drone0" SET Transform localPosition (-0.15433826762290326 0.26499349312785997 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.013114330897637 1.2525873550686752 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 4 0)
"cameras/drone/drone0" SET Transform localScale (1.1728705216415354 1.1728705216415354 1.1728705216415354)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -19 17)
"cameras/drone/drone1" SET Transform localScale (1.4965345509646664 1.4965345509646664 1.4965345509646664)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.156111765939619 0)
"cameras" SET Transform eulerAngles (-6.664156606535169 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.40500421851244417
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0669655183226734
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03255324557011576
"cameras/drone/drone0" SET Transform localPosition (0.962430204760554 -0.2917916643027792 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6985989847390213 1.2817403985316789 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 11 -16)
"cameras/drone/drone0" SET Transform localScale (1.415475608498355 1.415475608498355 1.415475608498355)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -15 16)
"cameras/drone/drone1" SET Transform localScale (0.8920794973038484 0.8920794973038484 0.8920794973038484)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.880174757808999 0)
"cameras" SET Transform eulerAngles (-16.05569172414315 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6485056133095412
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6450649218684534
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23727340251247836
"cameras/drone/drone0" SET Transform localPosition (-0.3394828786335067 0.4219127117359392 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.31511450015235354 1.252656358254571 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -1 -7)
"cameras/drone/drone0" SET Transform localScale (1.172253436761671 1.172253436761671 1.172253436761671)
"cameras/drone/drone1" SET Transform localEulerAngles (17 9 -8)
"cameras/drone/drone1" SET Transform localScale (1.37729352284064 1.37729352284064 1.37729352284064)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.001582079769766 0)
"cameras" SET Transform eulerAngles (9.882274094295664 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8691802935158407
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8703024326754178
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34672756147227723
"cameras/drone/drone0" SET Transform localPosition (0.12440090557663197 -0.06397089084075608 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9923884655788819 0.957298184099878 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 6 10)
"cameras/drone/drone0" SET Transform localScale (1.3946871832966241 1.3946871832966241 1.3946871832966241)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -11 3)
"cameras/drone/drone1" SET Transform localScale (1.4387132424119562 1.4387132424119562 1.4387132424119562)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.656788788320178 0)
"cameras" SET Transform eulerAngles (6.710739395028121 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9936113308694278
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2986886938214641
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2958443730168442
"cameras/drone/drone0" SET Transform localPosition (-0.16332159521031042 0.699666193201443 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1891765533898766 1.1242847746979217 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -2 -9)
"cameras/drone/drone0" SET Transform localScale (0.9463335144124803 0.9463335144124803 0.9463335144124803)
"cameras/drone/drone1" SET Transform localEulerAngles (8 1 2)
"cameras/drone/drone1" SET Transform localScale (1.1212487683580186 1.1212487683580186 1.1212487683580186)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2749654395918344 0)
"cameras" SET Transform eulerAngles (-14.78212648145275 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5072363143767626
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4357465848750706
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09893361158630101
"cameras/drone/drone0" SET Transform localPosition (1.1009482645226745 0.3043264260317113 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8173674291660478 1.253426802088071 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -16 6)
"cameras/drone/drone0" SET Transform localScale (0.6034423966268405 0.6034423966268405 0.6034423966268405)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -9 -13)
"cameras/drone/drone1" SET Transform localScale (1.2112104789650209 1.2112104789650209 1.2112104789650209)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.217864138878981 0)
"cameras" SET Transform eulerAngles (-6.869917639171028 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5250224771306504
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.781237434830716
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03507880170765554
"cameras/drone/drone0" SET Transform localPosition (0.2308445907080645 0.5755262572358382 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9134940059332977 0.8394977974035106 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 13 -1)
"cameras/drone/drone0" SET Transform localScale (0.9040766050579895 0.9040766050579895 0.9040766050579895)
"cameras/drone/drone1" SET Transform localEulerAngles (17 15 20)
"cameras/drone/drone1" SET Transform localScale (0.7223673693057568 0.7223673693057568 0.7223673693057568)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.9157990059603165 0)
"cameras" SET Transform eulerAngles (-7.677625946356299 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5574077660095824
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5686844287477366
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19784096335349438
"cameras/drone/drone0" SET Transform localPosition (0.887866202536183 0.42827753508130345 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0498578658759066 0.9606284211317604 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -7 6)
"cameras/drone/drone0" SET Transform localScale (1.175853164967881 1.175853164967881 1.175853164967881)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -18 3)
"cameras/drone/drone1" SET Transform localScale (1.3003640277552428 1.3003640277552428 1.3003640277552428)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6329772652349384 0)
"cameras" SET Transform eulerAngles (1.8099159433040768 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6657612976130791
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0416560520012808
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2345625949058969
"cameras/drone/drone0" SET Transform localPosition (-0.6317350491580448 0.5247483240836535 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5707952352263717 0.907338615985446 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -17 13)
"cameras/drone/drone0" SET Transform localScale (1.1560424603533423 1.1560424603533423 1.1560424603533423)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -8 -19)
"cameras/drone/drone1" SET Transform localScale (0.8197666114566879 0.8197666114566879 0.8197666114566879)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.988862782058943 0)
"cameras" SET Transform eulerAngles (10.411592022664337 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2970869877630182
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0708912994580428
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2962294321022059
"cameras/drone/drone0" SET Transform localPosition (-0.30035611910953974 0.4546900786877532 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6019723395368288 1.202823487373795 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -18 5)
"cameras/drone/drone0" SET Transform localScale (0.6653694428999805 0.6653694428999805 0.6653694428999805)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 5 0)
"cameras/drone/drone1" SET Transform localScale (1.170885984537811 1.170885984537811 1.170885984537811)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.659483045708055 0)
"cameras" SET Transform eulerAngles (-6.393213547622963 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0447233779473661
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7220188952379565
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.06450577661469858
"cameras/drone/drone0" SET Transform localPosition (-0.17117784741940878 0.6125326258135764 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7773170419046125 1.2900785742578555 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 5 -4)
"cameras/drone/drone0" SET Transform localScale (0.9439279152265785 0.9439279152265785 0.9439279152265785)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 5 -12)
"cameras/drone/drone1" SET Transform localScale (1.4157943793317838 1.4157943793317838 1.4157943793317838)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.028551584424796 0)
"cameras" SET Transform eulerAngles (2.7786454792184934 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5052688901759588
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3683554527274495
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25043477115283447
"cameras/drone/drone0" SET Transform localPosition (-1.1678555800166615 0.2687880034828503 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6837455439957802 1.0628477123793751 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -4 10)
"cameras/drone/drone0" SET Transform localScale (1.0420634057008518 1.0420634057008518 1.0420634057008518)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -13 -8)
"cameras/drone/drone1" SET Transform localScale (1.4795731984204767 1.4795731984204767 1.4795731984204767)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.988347292221182 0)
"cameras" SET Transform eulerAngles (11.131775341573768 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9610309338247613
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9510681334554633
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2136119392250919
"cameras/drone/drone0" SET Transform localPosition (0.43498091140325523 0.44025258575265785 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3913790264230902 1.1069706128143566 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -9 1)
"cameras/drone/drone0" SET Transform localScale (1.4374077259320757 1.4374077259320757 1.4374077259320757)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -10 -6)
"cameras/drone/drone1" SET Transform localScale (0.8846866109281396 0.8846866109281396 0.8846866109281396)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.580067363883012 0)
"cameras" SET Transform eulerAngles (-11.580506489562028 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6027833440244192
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1605974804368473
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16538345012512795
"cameras/drone/drone0" SET Transform localPosition (0.45404371537403576 0.4881912070627195 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4748299772938879 1.270695932709698 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 16 -1)
"cameras/drone/drone0" SET Transform localScale (1.0809358942064151 1.0809358942064151 1.0809358942064151)
"cameras/drone/drone1" SET Transform localEulerAngles (16 4 1)
"cameras/drone/drone1" SET Transform localScale (1.4823719142605438 1.4823719142605438 1.4823719142605438)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.489090915154767 0)
"cameras" SET Transform eulerAngles (0.12638618283783742 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4998358954073798
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6291519869481625
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17095048418055625
"cameras/drone/drone0" SET Transform localPosition (-0.9965442983164672 0.18105133706617 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.08241991243702884 0.9500177793576068 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -1 11)
"cameras/drone/drone0" SET Transform localScale (0.8573937794792847 0.8573937794792847 0.8573937794792847)
"cameras/drone/drone1" SET Transform localEulerAngles (7 19 -4)
"cameras/drone/drone1" SET Transform localScale (0.6529962072256983 0.6529962072256983 0.6529962072256983)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.082774739833186 0)
"cameras" SET Transform eulerAngles (-11.47172836484145 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4118048687988773
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0293288695664016
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3231183339107341
"cameras/drone/drone0" SET Transform localPosition (-1.1748581373958837 0.10489480395166434 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1919537216609293 0.8785155727415478 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 12 -7)
"cameras/drone/drone0" SET Transform localScale (0.9806196196628374 0.9806196196628374 0.9806196196628374)
"cameras/drone/drone1" SET Transform localEulerAngles (3 2 12)
"cameras/drone/drone1" SET Transform localScale (0.8469493865453198 0.8469493865453198 0.8469493865453198)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.131496504819731 0)
"cameras" SET Transform eulerAngles (7.364598903120747 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7643391412033405
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1823557881793305
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12562735158720548
"cameras/drone/drone0" SET Transform localPosition (0.4490649108371374 -0.2813000852362462 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6329717355598568 1.089853800295772 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 17 9)
"cameras/drone/drone0" SET Transform localScale (0.9152556590579488 0.9152556590579488 0.9152556590579488)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -16 -3)
"cameras/drone/drone1" SET Transform localScale (1.16322507228685 1.16322507228685 1.16322507228685)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.39856183002919 0)
"cameras" SET Transform eulerAngles (-19.36275215924853 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7657910580863554
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.784052703411381
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16808904171023575
"cameras/drone/drone0" SET Transform localPosition (-0.8923710177685655 0.46175927496836394 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.21745147512742236 1.2020789653543262 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -7 -15)
"cameras/drone/drone0" SET Transform localScale (1.4397405865531856 1.4397405865531856 1.4397405865531856)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 4 -6)
"cameras/drone/drone1" SET Transform localScale (0.9480860031902825 0.9480860031902825 0.9480860031902825)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.426145751947604 0)
"cameras" SET Transform eulerAngles (-7.288198096199107 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4204486716285154
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1864610611081194
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.294997010321386
"cameras/drone/drone0" SET Transform localPosition (0.10584757775503384 0.3731491040141626 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7629767009430972 1.1397667129425852 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 0 -13)
"cameras/drone/drone0" SET Transform localScale (0.940786440955365 0.940786440955365 0.940786440955365)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -2 9)
"cameras/drone/drone1" SET Transform localScale (1.4584909194453424 1.4584909194453424 1.4584909194453424)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0722856862741086 0)
"cameras" SET Transform eulerAngles (-3.6988718066263537 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.688499343758044
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.578173654069643
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1122038679544669
"cameras/drone/drone0" SET Transform localPosition (-0.31631341110368727 0.3943343188888396 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.977768237729475 1.1717559539159579 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -3 10)
"cameras/drone/drone0" SET Transform localScale (1.1920358583410366 1.1920358583410366 1.1920358583410366)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -9 11)
"cameras/drone/drone1" SET Transform localScale (0.96265888069565 0.96265888069565 0.96265888069565)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.41318304596155 0)
"cameras" SET Transform eulerAngles (3.954841888672675 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6886533241008401
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6392305624744095
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02536823859648889
"cameras/drone/drone0" SET Transform localPosition (-0.032522454797011324 -0.09452658670547548 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.727442690376993 1.2557991759932212 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -18 10)
"cameras/drone/drone0" SET Transform localScale (1.2287263051783475 1.2287263051783475 1.2287263051783475)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -20 -2)
"cameras/drone/drone1" SET Transform localScale (1.3396137942172328 1.3396137942172328 1.3396137942172328)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0263295692956076 0)
"cameras" SET Transform eulerAngles (-13.262989298306106 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2437065836171772
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9763100455086238
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05649386122302307
"cameras/drone/drone0" SET Transform localPosition (-1.1771494765237602 0.29963928629426945 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3416387544702004 1.0324709259855993 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 9 15)
"cameras/drone/drone0" SET Transform localScale (0.9721998351124603 0.9721998351124603 0.9721998351124603)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -11 -16)
"cameras/drone/drone1" SET Transform localScale (0.7915525174938306 0.7915525174938306 0.7915525174938306)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.483898043369929 0)
"cameras" SET Transform eulerAngles (16.087233667769297 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.947933905767412
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.925554200755256
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2927607245608492
"cameras/drone/drone0" SET Transform localPosition (-0.2355768500871911 0.029942290772211833 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4831057156260141 1.087964325066091 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 17 6)
"cameras/drone/drone0" SET Transform localScale (1.347932104038871 1.347932104038871 1.347932104038871)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -10 -5)
"cameras/drone/drone1" SET Transform localScale (0.9572344327879772 0.9572344327879772 0.9572344327879772)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.274191027185807 0)
"cameras" SET Transform eulerAngles (-12.175060477318006 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6108719213966781
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.537108740537123
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.058702608653072155
"cameras/drone/drone0" SET Transform localPosition (0.4297536537700388 0.6965108775293989 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.00934872816419019 1.0897098658151272 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 11 13)
"cameras/drone/drone0" SET Transform localScale (1.3807765962869718 1.3807765962869718 1.3807765962869718)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -8 20)
"cameras/drone/drone1" SET Transform localScale (1.1767584673685079 1.1767584673685079 1.1767584673685079)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4338448383576967 0)
"cameras" SET Transform eulerAngles (-18.264153642604242 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2239436244537663
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.774202471488839
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14412865046777426
"cameras/drone/drone0" SET Transform localPosition (-0.4889991722486461 -0.04633268522520834 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1310314707612898 1.0217386685459993 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -19 -13)
"cameras/drone/drone0" SET Transform localScale (1.244927878421027 1.244927878421027 1.244927878421027)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -20 0)
"cameras/drone/drone1" SET Transform localScale (1.144896958856116 1.144896958856116 1.144896958856116)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.430250255528781 0)
"cameras" SET Transform eulerAngles (19.375594932917508 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3035972744276512
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2969590561587756
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10542989894056404
"cameras/drone/drone0" SET Transform localPosition (-0.726744161577705 -0.05331495794688895 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.04362071512104193 0.8224215062620042 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -17 8)
"cameras/drone/drone0" SET Transform localScale (0.6337464186213516 0.6337464186213516 0.6337464186213516)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -16 -18)
"cameras/drone/drone1" SET Transform localScale (1.387253969126415 1.387253969126415 1.387253969126415)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.493382941009375 0)
"cameras" SET Transform eulerAngles (0.21899756606943654 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2263140386397535
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9740242494236346
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2718226895379428
"cameras/drone/drone0" SET Transform localPosition (0.036375248339806765 -0.12646820282486476 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7990171758344069 1.2793785455800637 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 6 -2)
"cameras/drone/drone0" SET Transform localScale (1.0852460616144524 1.0852460616144524 1.0852460616144524)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 7 12)
"cameras/drone/drone1" SET Transform localScale (0.8018929336556951 0.8018929336556951 0.8018929336556951)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.347931397063513 0)
"cameras" SET Transform eulerAngles (7.07949000740248 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.07239862610627
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9931608195757118
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0618678401367883
"cameras/drone/drone0" SET Transform localPosition (1.1197754485039872 0.1611439091674886 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6754819863129669 1.1214705287603992 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -8 -13)
"cameras/drone/drone0" SET Transform localScale (1.006849126292515 1.006849126292515 1.006849126292515)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -15 0)
"cameras/drone/drone1" SET Transform localScale (1.2596049852829685 1.2596049852829685 1.2596049852829685)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2003875778551736 0)
"cameras" SET Transform eulerAngles (3.9165668656558026 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9670143618767172
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5683570903309345
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31850612010241586
"cameras/drone/drone0" SET Transform localPosition (0.15745442050940395 -0.17152399264843604 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.09964640699691 1.248876590365756 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 9 -17)
"cameras/drone/drone0" SET Transform localScale (1.0500440446621426 1.0500440446621426 1.0500440446621426)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -18 -14)
"cameras/drone/drone1" SET Transform localScale (1.259513330863367 1.259513330863367 1.259513330863367)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0003845625028 0)
"cameras" SET Transform eulerAngles (-8.807715295130052 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1014684633852183
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.579135917631998
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07683216574788482
"cameras/drone/drone0" SET Transform localPosition (-0.21813559392413806 0.27041708797008807 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.01382135958918651 1.0174466801797533 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 16 0)
"cameras/drone/drone0" SET Transform localScale (0.8708857521241347 0.8708857521241347 0.8708857521241347)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -8 2)
"cameras/drone/drone1" SET Transform localScale (0.9478482048671057 0.9478482048671057 0.9478482048671057)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.8272873879229445 0)
"cameras" SET Transform eulerAngles (2.5382790220651685 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2446770700902063
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4148934027570332
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15797561292819268
"cameras/drone/drone0" SET Transform localPosition (-0.7057992319543285 0.008119762406606112 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4918496946421599 1.2099607562932955 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 7 18)
"cameras/drone/drone0" SET Transform localScale (1.1913551133734976 1.1913551133734976 1.1913551133734976)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -6 -17)
"cameras/drone/drone1" SET Transform localScale (0.6824786106382231 0.6824786106382231 0.6824786106382231)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.690063184807161 0)
"cameras" SET Transform eulerAngles (-13.830943837370317 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.756257627718067
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6682684823035503
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2718281841709042
"cameras/drone/drone0" SET Transform localPosition (1.0777335608630942 -0.18586513437155033 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.813860882994818 1.1971817846394675 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 10 10)
"cameras/drone/drone0" SET Transform localScale (1.0715581593182897 1.0715581593182897 1.0715581593182897)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -18 9)
"cameras/drone/drone1" SET Transform localScale (0.9282695217876711 0.9282695217876711 0.9282695217876711)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.69626680175298 0)
"cameras" SET Transform eulerAngles (-0.5064567034247425 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8890596860702045
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6836033076080206
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09629585989399954
"cameras/drone/drone0" SET Transform localPosition (-0.36040635118158915 -0.13173806589349407 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7629329485275227 0.9219044235158391 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -8 -1)
"cameras/drone/drone0" SET Transform localScale (1.2953353985104719 1.2953353985104719 1.2953353985104719)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -13 -8)
"cameras/drone/drone1" SET Transform localScale (1.0989977771013708 1.0989977771013708 1.0989977771013708)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.871564340981795 0)
"cameras" SET Transform eulerAngles (6.966777328589831 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3469428770385616
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.356928043441113
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2787147473917978
"cameras/drone/drone0" SET Transform localPosition (0.8105135518216813 -0.13989600456451107 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5328455430229148 0.9886377153507089 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -18 6)
"cameras/drone/drone0" SET Transform localScale (0.6115667213180923 0.6115667213180923 0.6115667213180923)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 15 13)
"cameras/drone/drone1" SET Transform localScale (1.1498146816019703 1.1498146816019703 1.1498146816019703)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1313649185391066 0)
"cameras" SET Transform eulerAngles (-18.336233073502434 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8453987354434253
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1869317120226412
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39451506220976373
"cameras/drone/drone0" SET Transform localPosition (-0.0019702408027535423 0.20285691072856743 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.12074968281342624 1.2270578327133699 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 9 -16)
"cameras/drone/drone0" SET Transform localScale (1.4606870025575218 1.4606870025575218 1.4606870025575218)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -12 -12)
"cameras/drone/drone1" SET Transform localScale (1.229331504457355 1.229331504457355 1.229331504457355)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.006662706841884 0)
"cameras" SET Transform eulerAngles (9.39408263260066 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8890863612779093
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9755545054390438
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04219745957539605
"cameras/drone/drone0" SET Transform localPosition (-0.5570851921141436 0.09930321305590534 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5158782294380628 1.2941280669327555 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 7 -12)
"cameras/drone/drone0" SET Transform localScale (1.1330193654770306 1.1330193654770306 1.1330193654770306)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -6 4)
"cameras/drone/drone1" SET Transform localScale (1.2950343240786046 1.2950343240786046 1.2950343240786046)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.641622805049096 0)
"cameras" SET Transform eulerAngles (16.058906052202644 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7963572097188124
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4254750960968559
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3188421007338091
"cameras/drone/drone0" SET Transform localPosition (0.28116955138657307 -0.014890065594543922 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.23251118242053204 0.9012453910285796 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 3 -9)
"cameras/drone/drone0" SET Transform localScale (1.086132319719154 1.086132319719154 1.086132319719154)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -17 -20)
"cameras/drone/drone1" SET Transform localScale (0.8183818772726708 0.8183818772726708 0.8183818772726708)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1888854231631094 0)
"cameras" SET Transform eulerAngles (18.482009288897686 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0828378602731994
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.185760681165963
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20871930986643636
"cameras/drone/drone0" SET Transform localPosition (0.6428776080869516 0.6753356780983755 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5402348853568055 0.9517014682827873 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -17 -7)
"cameras/drone/drone0" SET Transform localScale (1.006697102753301 1.006697102753301 1.006697102753301)
"cameras/drone/drone1" SET Transform localEulerAngles (0 2 -20)
"cameras/drone/drone1" SET Transform localScale (0.9397137361507915 0.9397137361507915 0.9397137361507915)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.609383540877777 0)
"cameras" SET Transform eulerAngles (-0.9593394104541098 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7187091175487696
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.389849049074262
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.004849606680090402
"cameras/drone/drone0" SET Transform localPosition (0.8792572995011769 0.689773575174534 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.10367068290012149 0.9719570001286881 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -11 11)
"cameras/drone/drone0" SET Transform localScale (1.3244091222790497 1.3244091222790497 1.3244091222790497)
"cameras/drone/drone1" SET Transform localEulerAngles (17 7 -14)
"cameras/drone/drone1" SET Transform localScale (0.8483615178653843 0.8483615178653843 0.8483615178653843)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.552437499279526 0)
"cameras" SET Transform eulerAngles (-19.07223327324192 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4504243767292908
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3620908241775345
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03085194322010958
"cameras/drone/drone0" SET Transform localPosition (0.5145225166533416 -0.07932707519102894 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.13750537768995041 1.2557080369470384 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -18 4)
"cameras/drone/drone0" SET Transform localScale (0.9415641768913952 0.9415641768913952 0.9415641768913952)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -16 -1)
"cameras/drone/drone1" SET Transform localScale (1.106038954584936 1.106038954584936 1.106038954584936)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 58
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 4.37663654041433 0)
"cameras" SET Transform eulerAngles (4.339700131413057 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3093479135532275
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9628302693731325
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20394256551673992
"cameras/drone/drone0" SET Transform localPosition (-0.8421382739298504 0.5135593272710843 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0236011087843362 0.9373655349286556 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 1 -11)
"cameras/drone/drone0" SET Transform localScale (0.9126183763587765 0.9126183763587765 0.9126183763587765)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -7 4)
"cameras/drone/drone1" SET Transform localScale (0.7692978050298823 0.7692978050298823 0.7692978050298823)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0111773688429615 0)
"cameras" SET Transform eulerAngles (-17.08634721203164 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2236567652321406
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7021427871999388
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25760707512921965
"cameras/drone/drone0" SET Transform localPosition (0.1503814632321976 0.012675222966560373 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3640529136306532 0.9924032141818466 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 2 14)
"cameras/drone/drone0" SET Transform localScale (1.2438524077073279 1.2438524077073279 1.2438524077073279)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 15 -7)
"cameras/drone/drone1" SET Transform localScale (1.1351233434225296 1.1351233434225296 1.1351233434225296)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4443680922150413 0)
"cameras" SET Transform eulerAngles (8.430672186153771 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.007131141949272
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4945848790798593
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09684917471792392
"cameras/drone/drone0" SET Transform localPosition (-0.10257298957274608 0.4281690469997071 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8176684350862748 0.9726508085922776 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -13 -5)
"cameras/drone/drone0" SET Transform localScale (1.1880114842748497 1.1880114842748497 1.1880114842748497)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -20 -8)
"cameras/drone/drone1" SET Transform localScale (1.22576443828096 1.22576443828096 1.22576443828096)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.652225916201655 0)
"cameras" SET Transform eulerAngles (-2.763102536622405 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3236919013587454
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4176020279376504
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2128103162664523
"cameras/drone/drone0" SET Transform localPosition (-0.46466681779527774 0.0749248046185112 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.052935786977701405 1.033403363357965 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 17 -8)
"cameras/drone/drone0" SET Transform localScale (1.1806829642098309 1.1806829642098309 1.1806829642098309)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -8 -3)
"cameras/drone/drone1" SET Transform localScale (0.6626375127118284 0.6626375127118284 0.6626375127118284)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.186315773792389 0)
"cameras" SET Transform eulerAngles (2.3626781565875277 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5805472426458975
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6459930313397302
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18495722927218528
"cameras/drone/drone0" SET Transform localPosition (-0.5948783176395336 0.5692163080853234 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1068527653770863 1.0226745246131008 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -13 -17)
"cameras/drone/drone0" SET Transform localScale (1.1618991391618234 1.1618991391618234 1.1618991391618234)
"cameras/drone/drone1" SET Transform localEulerAngles (8 7 -19)
"cameras/drone/drone1" SET Transform localScale (0.603218712351695 0.603218712351695 0.603218712351695)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5484770362885865 0)
"cameras" SET Transform eulerAngles (-12.866988972273594 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0350110629020408
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7493799913562524
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3296899496949215
"cameras/drone/drone0" SET Transform localPosition (0.7205793845282684 0.6139095776011139 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.790839111311268 1.1522756603516262 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 20 11)
"cameras/drone/drone0" SET Transform localScale (1.1092414768493408 1.1092414768493408 1.1092414768493408)
"cameras/drone/drone1" SET Transform localEulerAngles (4 7 -2)
"cameras/drone/drone1" SET Transform localScale (1.119624172888623 1.119624172888623 1.119624172888623)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9747026455969383 0)
"cameras" SET Transform eulerAngles (-5.242730125589601 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5723999537476316
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1441290800668953
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36429460328390567
"cameras/drone/drone0" SET Transform localPosition (-0.7051205863913976 0.34519216545890735 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.0487284134559447 1.0301487467942376 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 2 -16)
"cameras/drone/drone0" SET Transform localScale (0.9220697452906845 0.9220697452906845 0.9220697452906845)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -14 14)
"cameras/drone/drone1" SET Transform localScale (1.2164145868298566 1.2164145868298566 1.2164145868298566)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4037089357325616 0)
"cameras" SET Transform eulerAngles (18.065287740177155 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6348904603410561
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.688147341504994
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27662099838094595
"cameras/drone/drone0" SET Transform localPosition (0.34781942905497476 0.15609702434929834 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.22354397156969763 0.9487628840595128 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -16 -2)
"cameras/drone/drone0" SET Transform localScale (0.6118251916618784 0.6118251916618784 0.6118251916618784)
"cameras/drone/drone1" SET Transform localEulerAngles (18 16 17)
"cameras/drone/drone1" SET Transform localScale (1.2902003221288378 1.2902003221288378 1.2902003221288378)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.689476924599346 0)
"cameras" SET Transform eulerAngles (7.887227879526016 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0472238657751891
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3524022572083085
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.340279369021696
"cameras/drone/drone0" SET Transform localPosition (0.24915619572690884 0.3591248601102552 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.06003634394887847 1.2710469532570634 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 9 17)
"cameras/drone/drone0" SET Transform localScale (1.0268792731466712 1.0268792731466712 1.0268792731466712)
"cameras/drone/drone1" SET Transform localEulerAngles (13 20 -3)
"cameras/drone/drone1" SET Transform localScale (1.1662329032824852 1.1662329032824852 1.1662329032824852)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7308048239784024 0)
"cameras" SET Transform eulerAngles (6.807427041952128 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1820262538711919
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3320860217587847
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0528820356730737
"cameras/drone/drone0" SET Transform localPosition (-1.0256285837819041 0.6099330033504808 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.32331849155465764 1.0451926660453872 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 15 14)
"cameras/drone/drone0" SET Transform localScale (1.360190375641543 1.360190375641543 1.360190375641543)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 -12 -17)
"cameras/drone/drone1" SET Transform localScale (0.8088078288604651 0.8088078288604651 0.8088078288604651)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7397282642528067 0)
"cameras" SET Transform eulerAngles (12.621518703034312 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1922556700219238
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1485707525431406
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15604714269096545
"cameras/drone/drone0" SET Transform localPosition (1.0900164279524798 -0.15565748861001144 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1880743183453297 0.8498177725122134 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 9 -5)
"cameras/drone/drone0" SET Transform localScale (0.9533054540978348 0.9533054540978348 0.9533054540978348)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -17 7)
"cameras/drone/drone1" SET Transform localScale (1.4394570868056835 1.4394570868056835 1.4394570868056835)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.412250894506447 0)
"cameras" SET Transform eulerAngles (-5.07604530989822 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.303813655164903
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7091916035184032
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26444001793580985
"cameras/drone/drone0" SET Transform localPosition (0.7533886097783922 0.5630726403316479 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.058524442692559964 0.9925665651534955 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -2 -1)
"cameras/drone/drone0" SET Transform localScale (0.9835892127579211 0.9835892127579211 0.9835892127579211)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -9 -12)
"cameras/drone/drone1" SET Transform localScale (0.9038912288914187 0.9038912288914187 0.9038912288914187)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.1096223932114695 0)
"cameras" SET Transform eulerAngles (-6.064212628883823 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5141214844633777
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.852458323700461
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24037014082368044
"cameras/drone/drone0" SET Transform localPosition (-0.35228539630514843 -0.02401786336609285 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6028704824606832 0.940267823801751 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 19 8)
"cameras/drone/drone0" SET Transform localScale (1.3231184023135887 1.3231184023135887 1.3231184023135887)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -18 17)
"cameras/drone/drone1" SET Transform localScale (0.7991403332782288 0.7991403332782288 0.7991403332782288)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.701080177142933 0)
"cameras" SET Transform eulerAngles (-8.901851038700537 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0486740459629504
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4555160969675658
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07575152324137227
"cameras/drone/drone0" SET Transform localPosition (0.19170808043849163 0.15978552014721797 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9761658238891787 1.170589714400023 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 19 17)
"cameras/drone/drone0" SET Transform localScale (0.9659738280669075 0.9659738280669075 0.9659738280669075)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -20 -12)
"cameras/drone/drone1" SET Transform localScale (1.1384975738918097 1.1384975738918097 1.1384975738918097)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.471790120785473 0)
"cameras" SET Transform eulerAngles (-11.98903691679332 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2897267701852178
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9396305844404815
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.012768598557919609
"cameras/drone/drone0" SET Transform localPosition (-0.22709480841883978 -0.006948776685512803 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.520228362153494 0.9434863465383172 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -18 -6)
"cameras/drone/drone0" SET Transform localScale (1.4326235660003934 1.4326235660003934 1.4326235660003934)
"cameras/drone/drone1" SET Transform localEulerAngles (0 19 13)
"cameras/drone/drone1" SET Transform localScale (1.3505544656139272 1.3505544656139272 1.3505544656139272)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.370392840050695 0)
"cameras" SET Transform eulerAngles (-0.11037547204672293 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1275229340085045
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6249771881481878
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18177694422506976
"cameras/drone/drone0" SET Transform localPosition (1.116184205680174 0.23378200100259555 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1359389827755495 1.2755221930760776 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -11 11)
"cameras/drone/drone0" SET Transform localScale (0.9496092376492086 0.9496092376492086 0.9496092376492086)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 8 -9)
"cameras/drone/drone1" SET Transform localScale (0.7348756728786165 0.7348756728786165 0.7348756728786165)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8459883800000885 0)
"cameras" SET Transform eulerAngles (-17.546471959009104 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1781161339348267
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8986995918431386
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20384163155161367
"cameras/drone/drone0" SET Transform localPosition (1.1863599211645102 -0.16190198249392612 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8172076539857959 1.1083605040744324 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 15 -4)
"cameras/drone/drone0" SET Transform localScale (0.7288807375931567 0.7288807375931567 0.7288807375931567)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -11 -8)
"cameras/drone/drone1" SET Transform localScale (0.7931593358377058 0.7931593358377058 0.7931593358377058)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2188571566805573 0)
"cameras" SET Transform eulerAngles (-7.844594833676123 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7582293963412932
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.08385636154756
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39055817947281213
"cameras/drone/drone0" SET Transform localPosition (0.5746604678082998 0.6690926371907142 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7181826159748845 0.899037450251019 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 16 19)
"cameras/drone/drone0" SET Transform localScale (0.6611350635844802 0.6611350635844802 0.6611350635844802)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -20 -18)
"cameras/drone/drone1" SET Transform localScale (1.071769940474189 1.071769940474189 1.071769940474189)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4353453806078837 0)
"cameras" SET Transform eulerAngles (12.441246982281776 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.497606636345965
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1579011165740642
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1240630521895791
"cameras/drone/drone0" SET Transform localPosition (0.8815170562991603 0.43985379333745184 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2882707074247083 1.122211908449096 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 7 -15)
"cameras/drone/drone0" SET Transform localScale (1.309266525908305 1.309266525908305 1.309266525908305)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -18 -18)
"cameras/drone/drone1" SET Transform localScale (0.8525260237865131 0.8525260237865131 0.8525260237865131)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.813518553777489 0)
"cameras" SET Transform eulerAngles (-9.610080219987513 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6883269488912366
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0849539992165953
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18876212066302958
"cameras/drone/drone0" SET Transform localPosition (-0.29863639506943307 0.08367671836982898 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7781747444458662 0.8891111286754 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 0 -8)
"cameras/drone/drone0" SET Transform localScale (0.9407198446663493 0.9407198446663493 0.9407198446663493)
"cameras/drone/drone1" SET Transform localEulerAngles (6 17 17)
"cameras/drone/drone1" SET Transform localScale (1.118562122574304 1.118562122574304 1.118562122574304)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.50655402399881 0)
"cameras" SET Transform eulerAngles (1.623549629854022 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1976683011033953
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3101483649830556
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39356281056578557
"cameras/drone/drone0" SET Transform localPosition (-0.3176160510455265 0.4109393663363628 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.00025018533640075447 0.9280139496561324 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -11 19)
"cameras/drone/drone0" SET Transform localScale (0.6754774142143853 0.6754774142143853 0.6754774142143853)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -14 -7)
"cameras/drone/drone1" SET Transform localScale (1.3951570045386306 1.3951570045386306 1.3951570045386306)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.863319419821306 0)
"cameras" SET Transform eulerAngles (-6.0664728073119 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5264346642294813
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7418608643303273
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16665155889642796
"cameras/drone/drone0" SET Transform localPosition (-1.1967197461036923 0.46456321486323554 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.38051501344204297 1.1353079991047035 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -18 -18)
"cameras/drone/drone0" SET Transform localScale (1.1462483428391057 1.1462483428391057 1.1462483428391057)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -4 -8)
"cameras/drone/drone1" SET Transform localScale (0.667722563506051 0.667722563506051 0.667722563506051)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.618953246758885 0)
"cameras" SET Transform eulerAngles (9.599990355603705 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7564680419478342
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7460372953978376
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2927573807103638
"cameras/drone/drone0" SET Transform localPosition (-0.9822507286195719 0.1365706171005176 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.069622331385011 0.8745976863045898 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 8 -5)
"cameras/drone/drone0" SET Transform localScale (1.4644280084372032 1.4644280084372032 1.4644280084372032)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 -6 -17)
"cameras/drone/drone1" SET Transform localScale (1.134779522438367 1.134779522438367 1.134779522438367)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.590882278716448 0)
"cameras" SET Transform eulerAngles (11.584785548005524 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5917539232459492
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1532752263297645
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24136368897606209
"cameras/drone/drone0" SET Transform localPosition (-0.583145984250686 0.2947106320650574 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6885869540851479 0.8145875447122193 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 15 13)
"cameras/drone/drone0" SET Transform localScale (0.731147215059859 0.731147215059859 0.731147215059859)
"cameras/drone/drone1" SET Transform localEulerAngles (0 10 -20)
"cameras/drone/drone1" SET Transform localScale (0.6589374712171966 0.6589374712171966 0.6589374712171966)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.892483533140296 0)
"cameras" SET Transform eulerAngles (-17.551414969421653 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4035774704632045
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0261104325500952
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3815149901313057
"cameras/drone/drone0" SET Transform localPosition (1.1553926870762152 0.3722664163605918 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8873288155498174 1.0005268213060377 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -13 8)
"cameras/drone/drone0" SET Transform localScale (1.32136743966737 1.32136743966737 1.32136743966737)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 17 1)
"cameras/drone/drone1" SET Transform localScale (0.8745429354283578 0.8745429354283578 0.8745429354283578)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1829503851502516 0)
"cameras" SET Transform eulerAngles (13.093460769394724 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.021480547658582
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9006090425466099
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27648350329293714
"cameras/drone/drone0" SET Transform localPosition (0.8290569768140392 -0.18347345251269126 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7955422877128289 0.9591708637803735 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -5 6)
"cameras/drone/drone0" SET Transform localScale (1.1062530458548805 1.1062530458548805 1.1062530458548805)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 7 -11)
"cameras/drone/drone1" SET Transform localScale (1.0288402104401237 1.0288402104401237 1.0288402104401237)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.543739607019107 0)
"cameras" SET Transform eulerAngles (7.920613290656991 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5864353368642512
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4009251527524604
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2020001917654565
"cameras/drone/drone0" SET Transform localPosition (1.0782410325683724 0.08901531571771087 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7101077670816391 0.9080012030436823 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -10 -12)
"cameras/drone/drone0" SET Transform localScale (1.4207516339060695 1.4207516339060695 1.4207516339060695)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 14 2)
"cameras/drone/drone1" SET Transform localScale (0.8476056551403468 0.8476056551403468 0.8476056551403468)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.153137357012511 0)
"cameras" SET Transform eulerAngles (-4.3274353237723915 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7986933448462061
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1787176522270952
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1773671910691162
"cameras/drone/drone0" SET Transform localPosition (0.5791831731209456 0.6340178119244222 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5979794372123881 1.0378853706670919 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 11 -14)
"cameras/drone/drone0" SET Transform localScale (0.9230192046887087 0.9230192046887087 0.9230192046887087)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -19 -18)
"cameras/drone/drone1" SET Transform localScale (1.1070728449534755 1.1070728449534755 1.1070728449534755)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.598515103143744 0)
"cameras" SET Transform eulerAngles (-1.8122280618992868 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9316723280388978
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8642233879946635
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16463918775151853
"cameras/drone/drone0" SET Transform localPosition (0.318705410716436 0.2558434440244192 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.746826423706884 1.1799816450982803 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -20 -3)
"cameras/drone/drone0" SET Transform localScale (1.1964591506112894 1.1964591506112894 1.1964591506112894)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -20 -6)
"cameras/drone/drone1" SET Transform localScale (1.0313383494440052 1.0313383494440052 1.0313383494440052)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.618869059139794 0)
"cameras" SET Transform eulerAngles (-6.789982944023745 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4906058776842803
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1960500420714053
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1563187532176988
"cameras/drone/drone0" SET Transform localPosition (0.2296756015946837 0.6121177859031708 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3719761231215286 0.879397160766772 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 14 -4)
"cameras/drone/drone0" SET Transform localScale (0.8021759119002696 0.8021759119002696 0.8021759119002696)
"cameras/drone/drone1" SET Transform localEulerAngles (3 13 10)
"cameras/drone/drone1" SET Transform localScale (1.2658668827174586 1.2658668827174586 1.2658668827174586)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.323421149758975 0)
"cameras" SET Transform eulerAngles (-12.164290485723232 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2213379392878168
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8498403067620548
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23225173000038893
"cameras/drone/drone0" SET Transform localPosition (-0.4718291985069968 0.4298738745186235 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.33670288179469154 1.1912429102953963 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 2 -19)
"cameras/drone/drone0" SET Transform localScale (1.451844456399901 1.451844456399901 1.451844456399901)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -3 16)
"cameras/drone/drone1" SET Transform localScale (0.6463098965064629 0.6463098965064629 0.6463098965064629)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.487751409306398 0)
"cameras" SET Transform eulerAngles (11.298486982018531 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4693571963472394
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8047475187756654
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10693647000725677
"cameras/drone/drone0" SET Transform localPosition (0.12331069803605299 0.2857798785203233 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.05502243628240189 0.9155001783459633 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 14 2)
"cameras/drone/drone0" SET Transform localScale (0.9052568451422449 0.9052568451422449 0.9052568451422449)
"cameras/drone/drone1" SET Transform localEulerAngles (19 17 14)
"cameras/drone/drone1" SET Transform localScale (0.6281911079660764 0.6281911079660764 0.6281911079660764)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.351653413675939 0)
"cameras" SET Transform eulerAngles (-7.679556364887485 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9060903518078646
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4099713339256523
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08615314607818902
"cameras/drone/drone0" SET Transform localPosition (1.0899247974774176 0.31853694875913713 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2860556726090342 0.9286449733432081 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 14 -5)
"cameras/drone/drone0" SET Transform localScale (0.8237689915909933 0.8237689915909933 0.8237689915909933)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 1 19)
"cameras/drone/drone1" SET Transform localScale (0.9107102729523493 0.9107102729523493 0.9107102729523493)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.248579824167798 0)
"cameras" SET Transform eulerAngles (12.843990426548764 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.370148283866421
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7016551176656947
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29911105970221236
"cameras/drone/drone0" SET Transform localPosition (0.5180737550704915 0.5093127941784834 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.119535347091522 1.0027168432528224 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 17 -18)
"cameras/drone/drone0" SET Transform localScale (1.3721388914246841 1.3721388914246841 1.3721388914246841)
"cameras/drone/drone1" SET Transform localEulerAngles (15 5 -1)
"cameras/drone/drone1" SET Transform localScale (1.320079686133562 1.320079686133562 1.320079686133562)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.627508546409194 0)
"cameras" SET Transform eulerAngles (-16.479311016458446 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5912875123398997
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5160527800552228
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11346247576761291
"cameras/drone/drone0" SET Transform localPosition (-0.7522141828266664 0.5712572332098513 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.39710377929896934 1.1329705469597242 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -3 -4)
"cameras/drone/drone0" SET Transform localScale (1.2219298653210515 1.2219298653210515 1.2219298653210515)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 10 -12)
"cameras/drone/drone1" SET Transform localScale (1.3998414573433262 1.3998414573433262 1.3998414573433262)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.381869257942741 0)
"cameras" SET Transform eulerAngles (3.170382644679716 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5143430767924791
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5796192416598938
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.008389183710695925
"cameras/drone/drone0" SET Transform localPosition (-1.1684500042153534 -0.07446095709761519 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8582453207301546 0.9329324753485218 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -8 -13)
"cameras/drone/drone0" SET Transform localScale (1.0993062633833812 1.0993062633833812 1.0993062633833812)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -11 -11)
"cameras/drone/drone1" SET Transform localScale (0.8714392219868347 0.8714392219868347 0.8714392219868347)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.64474144020932 0)
"cameras" SET Transform eulerAngles (-7.044102766235007 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.076647922895658
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9009078596353169
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.007422573023101942
"cameras/drone/drone0" SET Transform localPosition (-0.45298003279443944 0.28410235439394776 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7096192991930489 0.9853156824043823 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 18 -7)
"cameras/drone/drone0" SET Transform localScale (0.6798805192990405 0.6798805192990405 0.6798805192990405)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -19 -19)
"cameras/drone/drone1" SET Transform localScale (1.1240149728972848 1.1240149728972848 1.1240149728972848)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.651268385432754 0)
"cameras" SET Transform eulerAngles (-17.79787245057883 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4876331377142036
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2512211132171065
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.034505179629227015
"cameras/drone/drone0" SET Transform localPosition (-0.542834000744426 0.6332930303486504 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1103421681280088 1.010664898628683 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 5 19)
"cameras/drone/drone0" SET Transform localScale (0.9799065137405519 0.9799065137405519 0.9799065137405519)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 5 -13)
"cameras/drone/drone1" SET Transform localScale (1.2382181244299362 1.2382181244299362 1.2382181244299362)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.912265949689915 0)
"cameras" SET Transform eulerAngles (-7.321635509274614 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7434489905707751
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9114831645546309
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3303252370570943
"cameras/drone/drone0" SET Transform localPosition (1.0439684435935115 0.06133931725320391 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3222798078884197 0.9059487246483185 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -15 -9)
"cameras/drone/drone0" SET Transform localScale (0.7669511153879869 0.7669511153879869 0.7669511153879869)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -1 4)
"cameras/drone/drone1" SET Transform localScale (1.1002614899934762 1.1002614899934762 1.1002614899934762)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.874305347431483 0)
"cameras" SET Transform eulerAngles (-12.905998285355714 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9331625029276492
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2779735884664785
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18867989916909825
"cameras/drone/drone0" SET Transform localPosition (-0.5800782681941339 -0.06998950656155728 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.10252211135916989 1.2285485224170793 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 8 15)
"cameras/drone/drone0" SET Transform localScale (1.4617643487688787 1.4617643487688787 1.4617643487688787)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 9 -5)
"cameras/drone/drone1" SET Transform localScale (1.2196407219632848 1.2196407219632848 1.2196407219632848)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.589964280980839 0)
"cameras" SET Transform eulerAngles (-13.151119041807874 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3441968410207665
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9945010115381856
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23021629150536882
"cameras/drone/drone0" SET Transform localPosition (0.2950586856287538 0.2474985448000489 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1214557742538684 1.0150818161067334 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -1 6)
"cameras/drone/drone0" SET Transform localScale (1.328731634070217 1.328731634070217 1.328731634070217)
"cameras/drone/drone1" SET Transform localEulerAngles (17 10 20)
"cameras/drone/drone1" SET Transform localScale (1.1720713038235067 1.1720713038235067 1.1720713038235067)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9735725684352854 0)
"cameras" SET Transform eulerAngles (0.5988046250128676 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.969558287786864
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1584929124000583
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3776783235574221
"cameras/drone/drone0" SET Transform localPosition (-0.6836300969712774 0.5525211762726958 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1179301183992674 0.9951760930735151 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 18 -17)
"cameras/drone/drone0" SET Transform localScale (0.7169765257319937 0.7169765257319937 0.7169765257319937)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 14 8)
"cameras/drone/drone1" SET Transform localScale (1.4899390523802345 1.4899390523802345 1.4899390523802345)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9151601119716366 0)
"cameras" SET Transform eulerAngles (3.283260121179424 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0194289451550949
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4060372164239388
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35388190916157036
"cameras/drone/drone0" SET Transform localPosition (-0.951191757535266 -0.07616349673451323 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.979717679113371 0.9316213509656359 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 13 -14)
"cameras/drone/drone0" SET Transform localScale (0.8030835175248189 0.8030835175248189 0.8030835175248189)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -3 -3)
"cameras/drone/drone1" SET Transform localScale (0.8889908664471426 0.8889908664471426 0.8889908664471426)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4885500416902095 0)
"cameras" SET Transform eulerAngles (13.794227629015069 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9044549323423121
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6483025917972083
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24070447177506518
"cameras/drone/drone0" SET Transform localPosition (-0.7019257436267952 0.374481325437182 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.28626494248265044 1.0433008094196738 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -1 3)
"cameras/drone/drone0" SET Transform localScale (1.33802852949472 1.33802852949472 1.33802852949472)
"cameras/drone/drone1" SET Transform localEulerAngles (14 4 5)
"cameras/drone/drone1" SET Transform localScale (1.0669657155385064 1.0669657155385064 1.0669657155385064)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.663609599494945 0)
"cameras" SET Transform eulerAngles (10.110750280950214 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.52292690989696
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.123425648646541
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23333860517010663
"cameras/drone/drone0" SET Transform localPosition (1.0079567884074818 0.24761528618607537 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.20723273595762048 1.1720214367198745 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 4 16)
"cameras/drone/drone0" SET Transform localScale (1.4572039535395391 1.4572039535395391 1.4572039535395391)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 5 19)
"cameras/drone/drone1" SET Transform localScale (1.0235714046530782 1.0235714046530782 1.0235714046530782)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.98355483047138 0)
"cameras" SET Transform eulerAngles (16.622233013019297 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4788062621588511
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4677663638070766
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24623274235422
"cameras/drone/drone0" SET Transform localPosition (0.7244997717201016 0.03167025186732969 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.04498680827074786 1.2568990625286864 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -9 4)
"cameras/drone/drone0" SET Transform localScale (1.207215304853118 1.207215304853118 1.207215304853118)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -5 -2)
"cameras/drone/drone1" SET Transform localScale (0.7415568028858524 0.7415568028858524 0.7415568028858524)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.989288005379799 0)
"cameras" SET Transform eulerAngles (-8.963024259629538 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8459523713751503
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4956751211291777
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1397984350664049
"cameras/drone/drone0" SET Transform localPosition (0.7441459928139551 -0.023124876536205263 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.26092279719847955 1.096788434592558 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -20 4)
"cameras/drone/drone0" SET Transform localScale (1.3689972473667313 1.3689972473667313 1.3689972473667313)
"cameras/drone/drone1" SET Transform localEulerAngles (13 3 -13)
"cameras/drone/drone1" SET Transform localScale (0.820931770562312 0.820931770562312 0.820931770562312)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.515301500202614 0)
"cameras" SET Transform eulerAngles (-4.129222538353478 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.671206008199234
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7530747143532657
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3674540102048884
"cameras/drone/drone0" SET Transform localPosition (-0.9202374854325643 0.4745073011773889 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6928140054285032 0.864585143008745 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 19 3)
"cameras/drone/drone0" SET Transform localScale (0.9854689484546527 0.9854689484546527 0.9854689484546527)
"cameras/drone/drone1" SET Transform localEulerAngles (18 16 -8)
"cameras/drone/drone1" SET Transform localScale (1.3484400339495801 1.3484400339495801 1.3484400339495801)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.880664553270464 0)
"cameras" SET Transform eulerAngles (3.403308023425641 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5923147925631452
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9419906120110153
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.042513534988915906
"cameras/drone/drone0" SET Transform localPosition (0.3558761120429583 0.04892750146019381 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5281288750977109 0.8695739305705028 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 5 16)
"cameras/drone/drone0" SET Transform localScale (0.9775697386738809 0.9775697386738809 0.9775697386738809)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -4 -19)
"cameras/drone/drone1" SET Transform localScale (1.144216661382372 1.144216661382372 1.144216661382372)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.050527421925365 0)
"cameras" SET Transform eulerAngles (13.604310217530433 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1650484219052537
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7799249430694708
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2080040792638049
"cameras/drone/drone0" SET Transform localPosition (-0.12335846608825873 0.6230832055989968 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5820998955838717 1.274881767701911 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 17 -4)
"cameras/drone/drone0" SET Transform localScale (0.8403316979939996 0.8403316979939996 0.8403316979939996)
"cameras/drone/drone1" SET Transform localEulerAngles (10 18 -8)
"cameras/drone/drone1" SET Transform localScale (0.7399261767991157 0.7399261767991157 0.7399261767991157)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.707262528548522 0)
"cameras" SET Transform eulerAngles (16.67130457200051 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6692788376386993
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0179413929216088
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0935745516416715
"cameras/drone/drone0" SET Transform localPosition (-0.9161835625752958 0.6630422735224957 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.086059624910425 1.0343074422281535 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -18 -1)
"cameras/drone/drone0" SET Transform localScale (0.6573764894596049 0.6573764894596049 0.6573764894596049)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -8 1)
"cameras/drone/drone1" SET Transform localScale (1.4132360444769496 1.4132360444769496 1.4132360444769496)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.915643556810627 0)
"cameras" SET Transform eulerAngles (-11.26345566844706 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.425024780753266
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9693457415335316
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14386537427059384
"cameras/drone/drone0" SET Transform localPosition (-0.6869784078255446 -0.23684175844830196 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.09608132640696643 1.236907600511176 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 14 9)
"cameras/drone/drone0" SET Transform localScale (0.6963173304531933 0.6963173304531933 0.6963173304531933)
"cameras/drone/drone1" SET Transform localEulerAngles (18 12 10)
"cameras/drone/drone1" SET Transform localScale (1.2357939032351966 1.2357939032351966 1.2357939032351966)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.504612963118234 0)
"cameras" SET Transform eulerAngles (2.876285135822428 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4606457800410961
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6189752861475073
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36923943015794825
"cameras/drone/drone0" SET Transform localPosition (-0.484406375339164 0.19381194890085934 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4862065931677235 1.2822353477515227 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -13 -11)
"cameras/drone/drone0" SET Transform localScale (0.985173465141547 0.985173465141547 0.985173465141547)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -6 -16)
"cameras/drone/drone1" SET Transform localScale (0.9561330746245835 0.9561330746245835 0.9561330746245835)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.749395536990982 0)
"cameras" SET Transform eulerAngles (-9.040880927856424 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4806436844227449
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0461819199919238
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0020978255687543967
"cameras/drone/drone0" SET Transform localPosition (-0.8881606273484185 -0.2735633284234385 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8410029427647758 1.0825861421963352 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -1 -6)
"cameras/drone/drone0" SET Transform localScale (0.925267910792942 0.925267910792942 0.925267910792942)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -12 -5)
"cameras/drone/drone1" SET Transform localScale (0.8558595681338577 0.8558595681338577 0.8558595681338577)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0608011117134595 0)
"cameras" SET Transform eulerAngles (17.26155585589587 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2754328939638975
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8850882492731353
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29037131231625873
"cameras/drone/drone0" SET Transform localPosition (-0.9954505720903771 -0.26217082970441313 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5912272848006809 1.0400177999472602 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 9 -8)
"cameras/drone/drone0" SET Transform localScale (0.8333378481739875 0.8333378481739875 0.8333378481739875)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -7 -3)
"cameras/drone/drone1" SET Transform localScale (1.22051214658442 1.22051214658442 1.22051214658442)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8967579735896436 0)
"cameras" SET Transform eulerAngles (-17.644175830797995 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4091548120754096
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7604978577468735
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18187969025681247
"cameras/drone/drone0" SET Transform localPosition (-1.1040489752584912 0.43957304124602 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.13316865465438665 1.0443784436521906 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -7 -15)
"cameras/drone/drone0" SET Transform localScale (0.6061527208865132 0.6061527208865132 0.6061527208865132)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -1 18)
"cameras/drone/drone1" SET Transform localScale (1.2387306661602717 1.2387306661602717 1.2387306661602717)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.958261298516899 0)
"cameras" SET Transform eulerAngles (-12.3058922570196 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9231251172621557
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3711912772984352
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.036902509180076
"cameras/drone/drone0" SET Transform localPosition (0.010429723322567641 0.19732329505190843 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.530936425000122 1.1653457455097296 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -4 7)
"cameras/drone/drone0" SET Transform localScale (0.7363252839595306 0.7363252839595306 0.7363252839595306)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -11 3)
"cameras/drone/drone1" SET Transform localScale (0.6211705658966218 0.6211705658966218 0.6211705658966218)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.583561320027412 0)
"cameras" SET Transform eulerAngles (-18.33335652263696 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5853382011158068
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7313425429064355
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3307714056043076
"cameras/drone/drone0" SET Transform localPosition (-0.5033355111066207 0.12689366415651931 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3520236155354768 1.2087691199137869 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 1 9)
"cameras/drone/drone0" SET Transform localScale (1.0807857987351996 1.0807857987351996 1.0807857987351996)
"cameras/drone/drone1" SET Transform localEulerAngles (9 5 -20)
"cameras/drone/drone1" SET Transform localScale (0.6375910476723269 0.6375910476723269 0.6375910476723269)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.740356028567291 0)
"cameras" SET Transform eulerAngles (6.698371011409851 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3108965046623298
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0387612576900418
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37928959150560154
"cameras/drone/drone0" SET Transform localPosition (-0.06323210511024224 0.6475459781776656 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.24125501952479944 0.9442185235801983 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -2 15)
"cameras/drone/drone0" SET Transform localScale (1.3569733528115466 1.3569733528115466 1.3569733528115466)
"cameras/drone/drone1" SET Transform localEulerAngles (14 7 -6)
"cameras/drone/drone1" SET Transform localScale (1.1648942317296187 1.1648942317296187 1.1648942317296187)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.306119088445042 0)
"cameras" SET Transform eulerAngles (2.952565244539823 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5171541517644384
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4682870839660107
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.204652000404692
"cameras/drone/drone0" SET Transform localPosition (0.522051421225934 0.334279786625503 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3567771479255396 1.1974084273535612 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 7 -16)
"cameras/drone/drone0" SET Transform localScale (1.2882502491114431 1.2882502491114431 1.2882502491114431)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 5 -1)
"cameras/drone/drone1" SET Transform localScale (0.8611114978018554 0.8611114978018554 0.8611114978018554)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.753708511659239 0)
"cameras" SET Transform eulerAngles (-6.100902862689917 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6610073550218063
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3277354434590067
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2369830036495896
"cameras/drone/drone0" SET Transform localPosition (-0.9407312826482319 0.13354796321793722 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5339080945413994 1.2577273960138193 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -13 18)
"cameras/drone/drone0" SET Transform localScale (1.2654610528904744 1.2654610528904744 1.2654610528904744)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -3 -8)
"cameras/drone/drone1" SET Transform localScale (0.8857184850960385 0.8857184850960385 0.8857184850960385)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.10469870311831 0)
"cameras" SET Transform eulerAngles (8.318909144454246 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.57560488462906
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2918181020285842
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1673126954756775
"cameras/drone/drone0" SET Transform localPosition (-0.8948451116848413 0.17957520728032134 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2762468374966598 1.1154994581363316 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -10 -3)
"cameras/drone/drone0" SET Transform localScale (0.6036882496647207 0.6036882496647207 0.6036882496647207)
"cameras/drone/drone1" SET Transform localEulerAngles (12 3 -11)
"cameras/drone/drone1" SET Transform localScale (1.2172713986535237 1.2172713986535237 1.2172713986535237)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.755054345657689 0)
"cameras" SET Transform eulerAngles (-1.4771843343704205 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.629914890542246
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8296035744112893
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11209683944130916
"cameras/drone/drone0" SET Transform localPosition (-0.5671437663853532 0.6010817078126205 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0827958626967702 1.0429339897393777 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -7 11)
"cameras/drone/drone0" SET Transform localScale (1.2083224335261704 1.2083224335261704 1.2083224335261704)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -19 -20)
"cameras/drone/drone1" SET Transform localScale (1.00071769366662 1.00071769366662 1.00071769366662)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.066985739531347 0)
"cameras" SET Transform eulerAngles (11.589575142379324 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4786201725700665
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3303473193026987
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08023038910686703
"cameras/drone/drone0" SET Transform localPosition (0.9940063376882444 0.16968406090514737 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3267538687436782 0.9338815401502809 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 3 15)
"cameras/drone/drone0" SET Transform localScale (0.9612357280759432 0.9612357280759432 0.9612357280759432)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 19 -2)
"cameras/drone/drone1" SET Transform localScale (1.1437958273587872 1.1437958273587872 1.1437958273587872)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.562439899529226 0)
"cameras" SET Transform eulerAngles (-5.277947307236307 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7611341117095767
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9048935456232705
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10980657703085428
"cameras/drone/drone0" SET Transform localPosition (-0.9864182319202288 0.6112875032773386 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7283506592140767 1.29268645644287 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -11 17)
"cameras/drone/drone0" SET Transform localScale (1.431079763716782 1.431079763716782 1.431079763716782)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -16 -2)
"cameras/drone/drone1" SET Transform localScale (1.3055844572692752 1.3055844572692752 1.3055844572692752)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.039808799230214 0)
"cameras" SET Transform eulerAngles (10.45874677914749 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9939286713183677
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.61615159875353
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.031045851211600174
"cameras/drone/drone0" SET Transform localPosition (-0.36997588061030495 0.5107030768725369 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.940399284663237 0.9359573581932954 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -2 -6)
"cameras/drone/drone0" SET Transform localScale (0.9172015901996078 0.9172015901996078 0.9172015901996078)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -3 13)
"cameras/drone/drone1" SET Transform localScale (1.3331892455684216 1.3331892455684216 1.3331892455684216)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.439868198454444 0)
"cameras" SET Transform eulerAngles (-5.080604831012412 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9259479574945606
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6671136438758776
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2881224520471246
"cameras/drone/drone0" SET Transform localPosition (0.8587724901125122 -0.09994087418115011 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2120227625461255 1.160388955854787 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 12 -8)
"cameras/drone/drone0" SET Transform localScale (1.185493951212306 1.185493951212306 1.185493951212306)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -10 16)
"cameras/drone/drone1" SET Transform localScale (0.8900083625178377 0.8900083625178377 0.8900083625178377)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.4304316582692564 0)
"cameras" SET Transform eulerAngles (-14.839964823492684 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4613891317020655
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3564060205023163
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11841482116113466
"cameras/drone/drone0" SET Transform localPosition (-1.0838277952825999 -0.1607555035732075 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.04665349274153896 1.0976335612039079 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -20 -16)
"cameras/drone/drone0" SET Transform localScale (0.909610047104598 0.909610047104598 0.909610047104598)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -4 -10)
"cameras/drone/drone1" SET Transform localScale (0.8706488310069995 0.8706488310069995 0.8706488310069995)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.1635534356514885 0)
"cameras" SET Transform eulerAngles (-9.00853058991618 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.183940723309505
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5153172093528298
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15959529811252568
"cameras/drone/drone0" SET Transform localPosition (1.1608735789155447 -0.18595164829152205 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5673965748072745 1.270469231502588 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 7 4)
"cameras/drone/drone0" SET Transform localScale (1.0329665215006014 1.0329665215006014 1.0329665215006014)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 12 -1)
"cameras/drone/drone1" SET Transform localScale (0.9204405443669152 0.9204405443669152 0.9204405443669152)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.481081543916398 0)
"cameras" SET Transform eulerAngles (10.40918299750416 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6721826919028098
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5115761461103525
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3703062305800569
"cameras/drone/drone0" SET Transform localPosition (-0.8261399996743595 -0.25670542106292765 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.970805447326234 0.9489875350844128 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 20 5)
"cameras/drone/drone0" SET Transform localScale (1.0448083957608083 1.0448083957608083 1.0448083957608083)
"cameras/drone/drone1" SET Transform localEulerAngles (7 8 8)
"cameras/drone/drone1" SET Transform localScale (0.632294563782254 0.632294563782254 0.632294563782254)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.3829493391028755 0)
"cameras" SET Transform eulerAngles (-4.78561185135138 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9604356911513033
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9623735563222073
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2899354407198555
"cameras/drone/drone0" SET Transform localPosition (-0.6581134121968618 -0.2896964322289704 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8322610477097343 1.2048252895668903 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -3 -20)
"cameras/drone/drone0" SET Transform localScale (1.067603832264462 1.067603832264462 1.067603832264462)
"cameras/drone/drone1" SET Transform localEulerAngles (19 9 -2)
"cameras/drone/drone1" SET Transform localScale (0.8897774259595111 0.8897774259595111 0.8897774259595111)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6381060270034187 0)
"cameras" SET Transform eulerAngles (4.457974587303809 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5112268466645042
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9576851323534822
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20947329029982376
"cameras/drone/drone0" SET Transform localPosition (0.884947173949828 0.29392546211141185 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7391945063818456 0.9595557967936525 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 14 15)
"cameras/drone/drone0" SET Transform localScale (0.7592555191605712 0.7592555191605712 0.7592555191605712)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 18 -20)
"cameras/drone/drone1" SET Transform localScale (0.695547152852563 0.695547152852563 0.695547152852563)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.1819156220719025 0)
"cameras" SET Transform eulerAngles (5.756178132385866 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.241015634119738
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3216092087971893
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10879601210837367
"cameras/drone/drone0" SET Transform localPosition (-0.5992645171382445 -0.166250468907355 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.15779646933718694 1.0785483874515027 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -15 6)
"cameras/drone/drone0" SET Transform localScale (0.9176850886133567 0.9176850886133567 0.9176850886133567)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -19 -11)
"cameras/drone/drone1" SET Transform localScale (1.1250847294954336 1.1250847294954336 1.1250847294954336)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.610996100173363 0)
"cameras" SET Transform eulerAngles (-14.067624314230876 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8873939930990868
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9468884859854185
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39704713569832184
"cameras/drone/drone0" SET Transform localPosition (-0.8438516326874397 -0.10424676147196105 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.38569056834378346 0.9321267784253424 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -7 10)
"cameras/drone/drone0" SET Transform localScale (1.2125176267447517 1.2125176267447517 1.2125176267447517)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -17 -12)
"cameras/drone/drone1" SET Transform localScale (0.8805742812562753 0.8805742812562753 0.8805742812562753)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.584881779385352 0)
"cameras" SET Transform eulerAngles (2.169643643305662 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5158960785873421
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1893248847238365
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2773571412711138
"cameras/drone/drone0" SET Transform localPosition (0.8822274088808502 0.46050368989157425 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0383442091420523 1.0449861310891642 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 15 11)
"cameras/drone/drone0" SET Transform localScale (0.6561735380900714 0.6561735380900714 0.6561735380900714)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -7 -18)
"cameras/drone/drone1" SET Transform localScale (1.2706789843275677 1.2706789843275677 1.2706789843275677)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5713951319424595 0)
"cameras" SET Transform eulerAngles (16.206741802939106 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.563871558047271
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5642996192518341
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04389599991987008
"cameras/drone/drone0" SET Transform localPosition (-0.7588307746368048 0.42561036084802223 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.017925178258165086 0.8384508581329448 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 9 20)
"cameras/drone/drone0" SET Transform localScale (1.162054369696742 1.162054369696742 1.162054369696742)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 5 -7)
"cameras/drone/drone1" SET Transform localScale (1.2359459958679637 1.2359459958679637 1.2359459958679637)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.990786302795221 0)
"cameras" SET Transform eulerAngles (-5.675246055933712 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3001479416689987
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0593584031071723
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.191783323746744
"cameras/drone/drone0" SET Transform localPosition (-0.17575371529790784 0.07041739652020135 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9356811533999444 1.224783123571577 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 9 3)
"cameras/drone/drone0" SET Transform localScale (0.693373632042173 0.693373632042173 0.693373632042173)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -12 6)
"cameras/drone/drone1" SET Transform localScale (1.1901247203136207 1.1901247203136207 1.1901247203136207)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.588887443579087 0)
"cameras" SET Transform eulerAngles (-13.192522526757408 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1202595985445236
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9654745109254157
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1721171450271499
"cameras/drone/drone0" SET Transform localPosition (0.7299712721229887 0.28686623710413534 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4494555129997041 0.9859383853876977 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -16 12)
"cameras/drone/drone0" SET Transform localScale (1.033540626653779 1.033540626653779 1.033540626653779)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -16 7)
"cameras/drone/drone1" SET Transform localScale (0.8216420532045665 0.8216420532045665 0.8216420532045665)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.425860967430112 0)
"cameras" SET Transform eulerAngles (-10.390711338608885 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5534624007570684
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5541315701235443
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03408283138069126
"cameras/drone/drone0" SET Transform localPosition (0.7220040912846446 0.11065785511124288 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9234135234171672 1.2175632932874496 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 8 4)
"cameras/drone/drone0" SET Transform localScale (0.6521245573888884 0.6521245573888884 0.6521245573888884)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 1 12)
"cameras/drone/drone1" SET Transform localScale (1.4395973199823868 1.4395973199823868 1.4395973199823868)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.652677548755218 0)
"cameras" SET Transform eulerAngles (7.949105539784348 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5328016264807345
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0104115000720268
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16572851689135853
"cameras/drone/drone0" SET Transform localPosition (0.6520358064966039 -0.02742378582234367 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9777274557519835 1.0506234567124793 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 9 -6)
"cameras/drone/drone0" SET Transform localScale (0.9674226793345277 0.9674226793345277 0.9674226793345277)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -3 -6)
"cameras/drone/drone1" SET Transform localScale (0.779166931859359 0.779166931859359 0.779166931859359)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.473256716937643 0)
"cameras" SET Transform eulerAngles (-18.16586824287473 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1965989826201122
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9822772090376439
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2798614196059273
"cameras/drone/drone0" SET Transform localPosition (-0.38322556109754624 0.27336083386130156 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.333007869547955 0.831944163626896 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -2 3)
"cameras/drone/drone0" SET Transform localScale (1.2017204673136184 1.2017204673136184 1.2017204673136184)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -18 14)
"cameras/drone/drone1" SET Transform localScale (1.4684703422822702 1.4684703422822702 1.4684703422822702)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.845315895750915 0)
"cameras" SET Transform eulerAngles (-8.60255049060395 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2538132287981218
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5129533297629676
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.025838815615194435
"cameras/drone/drone0" SET Transform localPosition (-0.5511763925506875 0.311076248711399 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.25415316315770853 1.2308594010120433 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 12 -5)
"cameras/drone/drone0" SET Transform localScale (1.3031103346391995 1.3031103346391995 1.3031103346391995)
"cameras/drone/drone1" SET Transform localEulerAngles (11 12 14)
"cameras/drone/drone1" SET Transform localScale (0.8391763320985033 0.8391763320985033 0.8391763320985033)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9112590903187474 0)
"cameras" SET Transform eulerAngles (18.866680149988717 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5764617735817605
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5200240768155542
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3612617798851753
"cameras/drone/drone0" SET Transform localPosition (0.9007716935975301 -0.053605703862049825 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6052120437278384 0.9071482273857383 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 6 -12)
"cameras/drone/drone0" SET Transform localScale (1.07909341671793 1.07909341671793 1.07909341671793)
"cameras/drone/drone1" SET Transform localEulerAngles (7 18 -17)
"cameras/drone/drone1" SET Transform localScale (1.2543504692735603 1.2543504692735603 1.2543504692735603)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.807383147302307 0)
"cameras" SET Transform eulerAngles (14.65875850141434 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4981351250177086
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2133715908614084
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17244188435377308
"cameras/drone/drone0" SET Transform localPosition (-0.9855842226376638 0.36227764573335103 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.25372683294470366 1.1238710087983574 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 9 -2)
"cameras/drone/drone0" SET Transform localScale (0.7113442195738636 0.7113442195738636 0.7113442195738636)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 14 2)
"cameras/drone/drone1" SET Transform localScale (0.6357542909304963 0.6357542909304963 0.6357542909304963)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7471436928306465 0)
"cameras" SET Transform eulerAngles (9.309230268793925 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0955263817154104
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.773796557703848
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03165286828214251
"cameras/drone/drone0" SET Transform localPosition (-1.1769539762352232 0.2653872628142297 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9420370576797772 0.9739773019334548 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -15 -15)
"cameras/drone/drone0" SET Transform localScale (0.8746975735917824 0.8746975735917824 0.8746975735917824)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -18 -17)
"cameras/drone/drone1" SET Transform localScale (0.6298670140700845 0.6298670140700845 0.6298670140700845)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.300281477229387 0)
"cameras" SET Transform eulerAngles (3.9726215906602107 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.587464075748942
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9456248643170448
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39831545706050975
"cameras/drone/drone0" SET Transform localPosition (-0.7151182580436692 0.508214694782783 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8034463227988067 1.0298060116871577 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -12 -20)
"cameras/drone/drone0" SET Transform localScale (0.7897756456506997 0.7897756456506997 0.7897756456506997)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -14 -6)
"cameras/drone/drone1" SET Transform localScale (0.9086585073535025 0.9086585073535025 0.9086585073535025)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.920582953590907 0)
"cameras" SET Transform eulerAngles (-17.604407971034842 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8368683061299871
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.44040014997664
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05206594382259131
"cameras/drone/drone0" SET Transform localPosition (0.9217017834238044 -0.2284529752524545 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5559607560370895 0.9515345733383103 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 19 8)
"cameras/drone/drone0" SET Transform localScale (1.2669662656504865 1.2669662656504865 1.2669662656504865)
"cameras/drone/drone1" SET Transform localEulerAngles (4 13 12)
"cameras/drone/drone1" SET Transform localScale (1.459737338247038 1.459737338247038 1.459737338247038)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.77918931672597 0)
"cameras" SET Transform eulerAngles (-4.0799039400719295 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3686798549658876
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1014637526088331
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13632402769622773
"cameras/drone/drone0" SET Transform localPosition (-0.36813965152723904 -0.1984115698416688 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8428973792271848 1.016457948948538 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 13 17)
"cameras/drone/drone0" SET Transform localScale (1.2347202329321294 1.2347202329321294 1.2347202329321294)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -11 -17)
"cameras/drone/drone1" SET Transform localScale (1.3961403308480782 1.3961403308480782 1.3961403308480782)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7702894596231626 0)
"cameras" SET Transform eulerAngles (-13.515180229212689 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9828299479627938
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9740256338579325
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10292875648806254
"cameras/drone/drone0" SET Transform localPosition (-0.673638047175809 0.1399076686418081 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0838695303568207 1.0059459454020638 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 5 10)
"cameras/drone/drone0" SET Transform localScale (1.2753373580164844 1.2753373580164844 1.2753373580164844)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -17 -19)
"cameras/drone/drone1" SET Transform localScale (1.4782863777931823 1.4782863777931823 1.4782863777931823)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.061898394522382 0)
"cameras" SET Transform eulerAngles (-18.95658108415402 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1586764874602746
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6968863128880045
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1652940628233402
"cameras/drone/drone0" SET Transform localPosition (-0.6930070824072424 0.5424215938891324 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6158873825327844 0.8805575709099936 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 19 17)
"cameras/drone/drone0" SET Transform localScale (1.0952895051295723 1.0952895051295723 1.0952895051295723)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -8 20)
"cameras/drone/drone1" SET Transform localScale (1.3144112565564328 1.3144112565564328 1.3144112565564328)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.802643389166455 0)
"cameras" SET Transform eulerAngles (-7.846652466849262 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5561683184989213
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.172888477513896
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07463295575923055
"cameras/drone/drone0" SET Transform localPosition (-0.3973287445609467 -0.23932709123647272 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0536614740868615 1.1960095736803327 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 20 13)
"cameras/drone/drone0" SET Transform localScale (0.6236137422295198 0.6236137422295198 0.6236137422295198)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -16 -16)
"cameras/drone/drone1" SET Transform localScale (0.7072697779289815 0.7072697779289815 0.7072697779289815)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.456338040830644 0)
"cameras" SET Transform eulerAngles (0.563847301487371 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6498946187217115
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9517655896781506
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38912684407126535
"cameras/drone/drone0" SET Transform localPosition (-0.7303536121812034 -0.24015014682324615 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5167985945846653 0.9651488392923573 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -14 -12)
"cameras/drone/drone0" SET Transform localScale (0.7026101803855843 0.7026101803855843 0.7026101803855843)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -11 -15)
"cameras/drone/drone1" SET Transform localScale (0.9398841219501984 0.9398841219501984 0.9398841219501984)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9476330356310223 0)
"cameras" SET Transform eulerAngles (4.366291632501664 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0068928892323838
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2600503769706521
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22191989997745815
"cameras/drone/drone0" SET Transform localPosition (0.8536077233591632 0.28457136862179583 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5624759473947759 0.8769853070566949 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 11 -17)
"cameras/drone/drone0" SET Transform localScale (0.6848256620291711 0.6848256620291711 0.6848256620291711)
"cameras/drone/drone1" SET Transform localEulerAngles (20 12 6)
"cameras/drone/drone1" SET Transform localScale (0.9538561452611525 0.9538561452611525 0.9538561452611525)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.894896931084462 0)
"cameras" SET Transform eulerAngles (-7.232014378336995 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.44185900231705
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8698743537201903
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29081545659988545
"cameras/drone/drone0" SET Transform localPosition (1.060465124869163 0.01216027962377536 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.087805329480099 0.9861058049316291 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -8 5)
"cameras/drone/drone0" SET Transform localScale (0.6902958686587345 0.6902958686587345 0.6902958686587345)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -5 -6)
"cameras/drone/drone1" SET Transform localScale (1.0859244420662595 1.0859244420662595 1.0859244420662595)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7661916557834365 0)
"cameras" SET Transform eulerAngles (-7.517931003673034 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6632633342115584
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1022342753422452
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08911643156318552
"cameras/drone/drone0" SET Transform localPosition (-0.37178264294672114 -0.05924330604020972 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8956068910829929 0.9242485442428996 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -7 -9)
"cameras/drone/drone0" SET Transform localScale (0.7140791801348088 0.7140791801348088 0.7140791801348088)
"cameras/drone/drone1" SET Transform localEulerAngles (11 0 8)
"cameras/drone/drone1" SET Transform localScale (1.4625489344286868 1.4625489344286868 1.4625489344286868)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.454805546978288 0)
"cameras" SET Transform eulerAngles (-19.652088889755284 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.116719930375064
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8099865515275595
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0959426335250508
"cameras/drone/drone0" SET Transform localPosition (0.7884917045781563 0.4749566704021318 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7425564730721494 1.1331198252171069 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -13 19)
"cameras/drone/drone0" SET Transform localScale (1.1378900808624737 1.1378900808624737 1.1378900808624737)
"cameras/drone/drone1" SET Transform localEulerAngles (5 16 4)
"cameras/drone/drone1" SET Transform localScale (0.9361324494666012 0.9361324494666012 0.9361324494666012)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.725752985221191 0)
"cameras" SET Transform eulerAngles (9.070333003913863 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7533986257271243
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5969055085101624
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2084008290180618
"cameras/drone/drone0" SET Transform localPosition (0.5646697428096417 0.3537326472748346 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.21087667173345837 1.0148998167847607 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -17 -20)
"cameras/drone/drone0" SET Transform localScale (0.765349653181558 0.765349653181558 0.765349653181558)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 14 -18)
"cameras/drone/drone1" SET Transform localScale (1.1086965643328504 1.1086965643328504 1.1086965643328504)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7341866842384555 0)
"cameras" SET Transform eulerAngles (19.761211242346647 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.411108771906676
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4749245200921208
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.022498032015835757
"cameras/drone/drone0" SET Transform localPosition (-0.14207519241253297 0.6854099156838818 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.42748690938781475 0.8574293345301349 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -16 -20)
"cameras/drone/drone0" SET Transform localScale (0.6944047161278647 0.6944047161278647 0.6944047161278647)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -9 -10)
"cameras/drone/drone1" SET Transform localScale (0.7509121512592923 0.7509121512592923 0.7509121512592923)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.682647372250329 0)
"cameras" SET Transform eulerAngles (14.905125000905272 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5556285277371127
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5384609113004184
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10342435956005974
"cameras/drone/drone0" SET Transform localPosition (0.6960401763568225 0.5485763282086564 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.970530672338983 0.9170426990658075 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -16 -13)
"cameras/drone/drone0" SET Transform localScale (1.3102795958656577 1.3102795958656577 1.3102795958656577)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 15 14)
"cameras/drone/drone1" SET Transform localScale (1.1423185660874342 1.1423185660874342 1.1423185660874342)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.677606595312401 0)
"cameras" SET Transform eulerAngles (-19.714713441068415 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.21874384007805
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.870424025199629
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.262438203408178
"cameras/drone/drone0" SET Transform localPosition (-0.6519798159954393 -0.278572074699827 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6886734397953358 0.8746070638979848 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -9 -11)
"cameras/drone/drone0" SET Transform localScale (1.1051938615273758 1.1051938615273758 1.1051938615273758)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 6 -10)
"cameras/drone/drone1" SET Transform localScale (0.6301422661047386 0.6301422661047386 0.6301422661047386)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 80
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 4.854734605985627 0)
"cameras" SET Transform eulerAngles (12.069744400811082 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6662740669832341
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3465908035374923
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1927962079399883
"cameras/drone/drone0" SET Transform localPosition (0.05361894457675076 0.4707087164542059 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7887372715881924 0.8893579391595933 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -11 19)
"cameras/drone/drone0" SET Transform localScale (1.2750431538550977 1.2750431538550977 1.2750431538550977)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -6 19)
"cameras/drone/drone1" SET Transform localScale (1.1369309255964364 1.1369309255964364 1.1369309255964364)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.194329024357825 0)
"cameras" SET Transform eulerAngles (11.447803432998 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7690366409255207
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.108530847271758
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31575584700083537
"cameras/drone/drone0" SET Transform localPosition (-1.0452403563152612 -0.2960076926343283 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7032349937079565 0.8757992209589539 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -20 -20)
"cameras/drone/drone0" SET Transform localScale (1.216680018793722 1.216680018793722 1.216680018793722)
"cameras/drone/drone1" SET Transform localEulerAngles (12 19 8)
"cameras/drone/drone1" SET Transform localScale (0.6865572670773927 0.6865572670773927 0.6865572670773927)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.535635832206268 0)
"cameras" SET Transform eulerAngles (-17.914672498090486 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9298766535708821
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1811139186683481
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15187247534231765
"cameras/drone/drone0" SET Transform localPosition (-0.4015075210415846 0.6805608947153641 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.442804519983818 0.8433235350409147 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -14 10)
"cameras/drone/drone0" SET Transform localScale (0.8989429654796931 0.8989429654796931 0.8989429654796931)
"cameras/drone/drone1" SET Transform localEulerAngles (13 18 0)
"cameras/drone/drone1" SET Transform localScale (1.2838253306124705 1.2838253306124705 1.2838253306124705)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9225019608888227 0)
"cameras" SET Transform eulerAngles (14.298986473266815 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0862729918499507
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4577244801135352
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1813262259768741
"cameras/drone/drone0" SET Transform localPosition (-0.8750775481181097 0.4359752708263746 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1414954153215369 1.1532872921684345 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -7 -9)
"cameras/drone/drone0" SET Transform localScale (0.9728034891554441 0.9728034891554441 0.9728034891554441)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 20 -13)
"cameras/drone/drone1" SET Transform localScale (0.7977819803114583 0.7977819803114583 0.7977819803114583)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.333163875675342 0)
"cameras" SET Transform eulerAngles (6.2717320096874865 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2620701704707882
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4071697278735371
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25785643053639135
"cameras/drone/drone0" SET Transform localPosition (0.16119632437678533 -0.07302711533963685 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.34362442709025554 1.26814883958474 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 5 -10)
"cameras/drone/drone0" SET Transform localScale (1.0575697291839512 1.0575697291839512 1.0575697291839512)
"cameras/drone/drone1" SET Transform localEulerAngles (2 0 -5)
"cameras/drone/drone1" SET Transform localScale (1.0631560219589045 1.0631560219589045 1.0631560219589045)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.352902190599065 0)
"cameras" SET Transform eulerAngles (17.22624535850425 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4070046622629988
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9570438769903675
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3271898973967964
"cameras/drone/drone0" SET Transform localPosition (-0.4237304448410907 0.5242971821790734 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.630104816865055 0.8554938846847172 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 16 9)
"cameras/drone/drone0" SET Transform localScale (1.4907160698312394 1.4907160698312394 1.4907160698312394)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -2 0)
"cameras/drone/drone1" SET Transform localScale (1.3006855962278818 1.3006855962278818 1.3006855962278818)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8286468849951083 0)
"cameras" SET Transform eulerAngles (-14.870106454713653 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1492021590784431
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4321291823114755
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34650185107938025
"cameras/drone/drone0" SET Transform localPosition (-1.1526902211804393 0.5791814700039888 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.006967201513190968 0.9991549113594907 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 -10 -6)
"cameras/drone/drone0" SET Transform localScale (0.6974712665408224 0.6974712665408224 0.6974712665408224)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -11 -10)
"cameras/drone/drone1" SET Transform localScale (1.4471578100408307 1.4471578100408307 1.4471578100408307)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.819303492917834 0)
"cameras" SET Transform eulerAngles (19.23881686599443 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2624681930407424
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3964511488953582
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3023562284487966
"cameras/drone/drone0" SET Transform localPosition (0.12079868691550688 0.21595431975305984 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6771018828623909 1.1128692405455416 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 5 -2)
"cameras/drone/drone0" SET Transform localScale (0.7669965877890708 0.7669965877890708 0.7669965877890708)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 10 -14)
"cameras/drone/drone1" SET Transform localScale (0.8801875880848813 0.8801875880848813 0.8801875880848813)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.598126836022053 0)
"cameras" SET Transform eulerAngles (-9.092452066473493 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2315654230433204
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4669936117837228
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2707204445501754
"cameras/drone/drone0" SET Transform localPosition (0.6398673654285854 0.15172185410050026 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.78827390191829 1.2601785697619183 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 -14 -2)
"cameras/drone/drone0" SET Transform localScale (1.1439765123982197 1.1439765123982197 1.1439765123982197)
"cameras/drone/drone1" SET Transform localEulerAngles (11 14 -2)
"cameras/drone/drone1" SET Transform localScale (0.7275637890440978 0.7275637890440978 0.7275637890440978)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6556886399000676 0)
"cameras" SET Transform eulerAngles (17.667631933996816 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.125468461266132
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5526997748046538
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3047111226046783
"cameras/drone/drone0" SET Transform localPosition (-1.1348508594957123 0.05239762709280876 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5841045604862423 1.1039895142997276 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 5 4)
"cameras/drone/drone0" SET Transform localScale (0.7096504506955545 0.7096504506955545 0.7096504506955545)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 0 -10)
"cameras/drone/drone1" SET Transform localScale (1.2642732791080449 1.2642732791080449 1.2642732791080449)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.677414213791102 0)
"cameras" SET Transform eulerAngles (-3.4111203260912326 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.110959657526478
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0610040236834766
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12082167666318289
"cameras/drone/drone0" SET Transform localPosition (0.29619270640569395 0.25739015584745756 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5512714280250592 1.0146068505724724 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -16 16)
"cameras/drone/drone0" SET Transform localScale (1.0604468577439947 1.0604468577439947 1.0604468577439947)
"cameras/drone/drone1" SET Transform localEulerAngles (5 7 10)
"cameras/drone/drone1" SET Transform localScale (1.10047121706575 1.10047121706575 1.10047121706575)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.549273184702489 0)
"cameras" SET Transform eulerAngles (9.153057796166046 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0112878867125485
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0096536045823323
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05517204072320552
"cameras/drone/drone0" SET Transform localPosition (0.6559577539084378 -0.2512311108221334 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.11074831084213566 1.1497841620549512 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 2 -3)
"cameras/drone/drone0" SET Transform localScale (0.7702652870203432 0.7702652870203432 0.7702652870203432)
"cameras/drone/drone1" SET Transform localEulerAngles (2 14 -20)
"cameras/drone/drone1" SET Transform localScale (1.244305388612514 1.244305388612514 1.244305388612514)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.533992476428121 0)
"cameras" SET Transform eulerAngles (6.665688808005484 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4545097217507204
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4861544925598358
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2777925363135556
"cameras/drone/drone0" SET Transform localPosition (0.7683013589214867 0.09834042121671044 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.47384869780829064 0.8552635157701569 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 18 6)
"cameras/drone/drone0" SET Transform localScale (0.7243397242850366 0.7243397242850366 0.7243397242850366)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -3 13)
"cameras/drone/drone1" SET Transform localScale (0.9631998683952456 0.9631998683952456 0.9631998683952456)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.943125165713326 0)
"cameras" SET Transform eulerAngles (-10.21520280007918 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5509884900268203
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6858084048869477
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3857990993045327
"cameras/drone/drone0" SET Transform localPosition (-1.0440906845881401 0.20276304370904258 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6937293521089609 0.9835667201294053 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -19 -11)
"cameras/drone/drone0" SET Transform localScale (0.6853671511769364 0.6853671511769364 0.6853671511769364)
"cameras/drone/drone1" SET Transform localEulerAngles (18 14 17)
"cameras/drone/drone1" SET Transform localScale (1.092566781292164 1.092566781292164 1.092566781292164)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7664192804406635 0)
"cameras" SET Transform eulerAngles (14.28595260695117 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1309207043507774
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.029693808105862
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05310111663175121
"cameras/drone/drone0" SET Transform localPosition (-1.0049887335686207 0.24559264977154388 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5225695596906867 0.8682092967413355 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -14 -4)
"cameras/drone/drone0" SET Transform localScale (0.7410671800478286 0.7410671800478286 0.7410671800478286)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -19 20)
"cameras/drone/drone1" SET Transform localScale (0.7963444340259774 0.7963444340259774 0.7963444340259774)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9030365682299584 0)
"cameras" SET Transform eulerAngles (-15.187728843266841 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7544971330215964
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7339223898243104
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12161829009351943
"cameras/drone/drone0" SET Transform localPosition (-0.6079301685651951 0.6468577043483323 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.126729125264124 0.983199837131383 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -5 -9)
"cameras/drone/drone0" SET Transform localScale (1.4359011492926315 1.4359011492926315 1.4359011492926315)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -2 18)
"cameras/drone/drone1" SET Transform localScale (1.0889687353375614 1.0889687353375614 1.0889687353375614)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.303019089579732 0)
"cameras" SET Transform eulerAngles (8.252445313773869 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.382369644240937
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7041644269930933
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.054243530224897724
"cameras/drone/drone0" SET Transform localPosition (-1.072442208997771 0.5638905231365909 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1135937663423328 0.9781014667940547 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 16 8)
"cameras/drone/drone0" SET Transform localScale (0.8340222855593312 0.8340222855593312 0.8340222855593312)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 13 -19)
"cameras/drone/drone1" SET Transform localScale (1.35386105848765 1.35386105848765 1.35386105848765)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.4660850008094055 0)
"cameras" SET Transform eulerAngles (3.547906746169936 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2029481534523856
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0607460069042556
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13651020920897233
"cameras/drone/drone0" SET Transform localPosition (0.6523616614361181 0.3503193416470088 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.824789007354055 1.0473406485926704 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 16 -5)
"cameras/drone/drone0" SET Transform localScale (1.300210828746376 1.300210828746376 1.300210828746376)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -14 -8)
"cameras/drone/drone1" SET Transform localScale (1.4140821662246934 1.4140821662246934 1.4140821662246934)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1038975541850604 0)
"cameras" SET Transform eulerAngles (-11.822065003713815 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9230698325555615
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4732892761037895
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3584837326507519
"cameras/drone/drone0" SET Transform localPosition (0.6685743199396013 0.5261667363994411 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3156964116926535 0.9452022686819925 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 11 -12)
"cameras/drone/drone0" SET Transform localScale (1.1658674580327517 1.1658674580327517 1.1658674580327517)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 16 6)
"cameras/drone/drone1" SET Transform localScale (0.7357462408791612 0.7357462408791612 0.7357462408791612)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.859913761348629 0)
"cameras" SET Transform eulerAngles (1.6287512748184518 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9605776622839737
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.916093146594147
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3217571568278423
"cameras/drone/drone0" SET Transform localPosition (0.03973204615004078 0.39529327266095543 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1162510811150015 0.895820367010121 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -18 -6)
"cameras/drone/drone0" SET Transform localScale (1.0021028270058443 1.0021028270058443 1.0021028270058443)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -1 11)
"cameras/drone/drone1" SET Transform localScale (0.8660113003236023 0.8660113003236023 0.8660113003236023)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.589952723572695 0)
"cameras" SET Transform eulerAngles (-6.095105069497752 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0103939755790785
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0275674829796064
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20305901969996928
"cameras/drone/drone0" SET Transform localPosition (-0.5982251619310733 0.41244381238482614 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6673429700141958 1.2808295770044276 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -7 5)
"cameras/drone/drone0" SET Transform localScale (0.8027831315048329 0.8027831315048329 0.8027831315048329)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -3 -16)
"cameras/drone/drone1" SET Transform localScale (0.822525305660798 0.822525305660798 0.822525305660798)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.852479582655788 0)
"cameras" SET Transform eulerAngles (-12.73177428126937 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.062099513787459
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0584467000580011
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37359226078440044
"cameras/drone/drone0" SET Transform localPosition (-0.1128317562248844 0.24037793119526402 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2969613217088882 0.8316641800239778 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -11 14)
"cameras/drone/drone0" SET Transform localScale (0.7616438118667906 0.7616438118667906 0.7616438118667906)
"cameras/drone/drone1" SET Transform localEulerAngles (18 8 -10)
"cameras/drone/drone1" SET Transform localScale (0.7148432419662302 0.7148432419662302 0.7148432419662302)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9026156535978798 0)
"cameras" SET Transform eulerAngles (3.349065567952195 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5638907854493439
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.788589058442526
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.025282067535276245
"cameras/drone/drone0" SET Transform localPosition (0.9917180052810297 0.6172127346768732 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6609471031540011 1.1185102207970594 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -18 1)
"cameras/drone/drone0" SET Transform localScale (0.9257387823290382 0.9257387823290382 0.9257387823290382)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -4 -6)
"cameras/drone/drone1" SET Transform localScale (1.191561219347895 1.191561219347895 1.191561219347895)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.710531200577581 0)
"cameras" SET Transform eulerAngles (10.162215065546292 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0551567874682046
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4234192268155526
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19032725171673245
"cameras/drone/drone0" SET Transform localPosition (-0.8468080521172394 -0.011082937089455569 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4116067501853845 1.12411862735755 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -7 10)
"cameras/drone/drone0" SET Transform localScale (0.9596031208238918 0.9596031208238918 0.9596031208238918)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -17 20)
"cameras/drone/drone1" SET Transform localScale (1.1499878937164392 1.1499878937164392 1.1499878937164392)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.106077436583016 0)
"cameras" SET Transform eulerAngles (8.092540934767921 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.07941925448471
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6968240183332206
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11550513396928785
"cameras/drone/drone0" SET Transform localPosition (0.29467518036791707 -0.018044275683740507 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1431402477003278 1.1676008598100034 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 5 18)
"cameras/drone/drone0" SET Transform localScale (0.6867138231685324 0.6867138231685324 0.6867138231685324)
"cameras/drone/drone1" SET Transform localEulerAngles (2 13 6)
"cameras/drone/drone1" SET Transform localScale (0.830863272422008 0.830863272422008 0.830863272422008)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.373992473940801 0)
"cameras" SET Transform eulerAngles (-0.7195326662111192 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.615677645847835
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.982615350778965
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07538732142940754
"cameras/drone/drone0" SET Transform localPosition (-1.1442959262983456 0.4074891811338354 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.919282746234168 0.8264802663593827 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -4 8)
"cameras/drone/drone0" SET Transform localScale (1.428344938578323 1.428344938578323 1.428344938578323)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 4 -19)
"cameras/drone/drone1" SET Transform localScale (1.0342863642420483 1.0342863642420483 1.0342863642420483)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.228011598062718 0)
"cameras" SET Transform eulerAngles (-8.703830233097737 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4457093534922443
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9885410124243035
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.016869684586049427
"cameras/drone/drone0" SET Transform localPosition (0.45895707504396266 0.2679753722305252 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.08951282898106938 1.0311373125182344 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -8 10)
"cameras/drone/drone0" SET Transform localScale (1.2626108862215215 1.2626108862215215 1.2626108862215215)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 3 -1)
"cameras/drone/drone1" SET Transform localScale (0.6526979376252011 0.6526979376252011 0.6526979376252011)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.353219271344264 0)
"cameras" SET Transform eulerAngles (14.531500688447558 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0900911447501827
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6650744941225493
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1004163605480096
"cameras/drone/drone0" SET Transform localPosition (0.37765527067913585 0.3233264961619497 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.19867930508956122 0.8160112130453109 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 16 17)
"cameras/drone/drone0" SET Transform localScale (1.463777538225096 1.463777538225096 1.463777538225096)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -19 2)
"cameras/drone/drone1" SET Transform localScale (1.4874978376451984 1.4874978376451984 1.4874978376451984)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6167567045234463 0)
"cameras" SET Transform eulerAngles (12.909087596033906 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0087978900212526
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3626361070483952
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1596905595331624
"cameras/drone/drone0" SET Transform localPosition (0.1679106330339024 -0.09868142969538657 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4190931771940697 1.0146062588081 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 18 1)
"cameras/drone/drone0" SET Transform localScale (0.8631623330216347 0.8631623330216347 0.8631623330216347)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 15 10)
"cameras/drone/drone1" SET Transform localScale (0.614860590791228 0.614860590791228 0.614860590791228)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7823309799738265 0)
"cameras" SET Transform eulerAngles (-1.745845043253432 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2364467374011916
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5048617729994107
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2684176094251518
"cameras/drone/drone0" SET Transform localPosition (-0.17014293430818928 0.6054067084901926 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.14513648072842966 0.8240019381279755 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 16 3)
"cameras/drone/drone0" SET Transform localScale (1.1512587930915732 1.1512587930915732 1.1512587930915732)
"cameras/drone/drone1" SET Transform localEulerAngles (17 12 -1)
"cameras/drone/drone1" SET Transform localScale (1.1232179629434498 1.1232179629434498 1.1232179629434498)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.012901976133601 0)
"cameras" SET Transform eulerAngles (-12.882630230701242 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.44430226970818254
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7254342399654965
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37474515404854636
"cameras/drone/drone0" SET Transform localPosition (0.7684126477117947 0.1328177301385685 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1350899302733717 1.2923310133127859 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 4 7)
"cameras/drone/drone0" SET Transform localScale (0.9525052486574472 0.9525052486574472 0.9525052486574472)
"cameras/drone/drone1" SET Transform localEulerAngles (15 20 -8)
"cameras/drone/drone1" SET Transform localScale (1.3881492864901102 1.3881492864901102 1.3881492864901102)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.667448083792348 0)
"cameras" SET Transform eulerAngles (19.66340104662479 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.341343193985808
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0715026714245017
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18624860294588844
"cameras/drone/drone0" SET Transform localPosition (0.05174188443527061 -0.06261735440295751 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.44647305967141104 0.9853849505060696 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 0 1)
"cameras/drone/drone0" SET Transform localScale (1.0414557440516907 1.0414557440516907 1.0414557440516907)
"cameras/drone/drone1" SET Transform localEulerAngles (7 6 15)
"cameras/drone/drone1" SET Transform localScale (1.0537740181217268 1.0537740181217268 1.0537740181217268)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.260689757437903 0)
"cameras" SET Transform eulerAngles (-0.21342829236211713 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.470648709352071
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.59426042810493
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2960053382760361
"cameras/drone/drone0" SET Transform localPosition (-0.07779611290508037 0.6119127145436345 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8759066440657008 0.9864134965915241 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -3 -3)
"cameras/drone/drone0" SET Transform localScale (1.0617817820008746 1.0617817820008746 1.0617817820008746)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -1 4)
"cameras/drone/drone1" SET Transform localScale (0.6105875973422552 0.6105875973422552 0.6105875973422552)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.323005044435348 0)
"cameras" SET Transform eulerAngles (-7.885876326876353 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2309401411840928
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.905177969147959
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0208633876515135
"cameras/drone/drone0" SET Transform localPosition (1.113696336250371 -0.16506698599823538 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.12107216670419785 0.8671989718702742 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -6 -14)
"cameras/drone/drone0" SET Transform localScale (1.10046747932616 1.10046747932616 1.10046747932616)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 7 15)
"cameras/drone/drone1" SET Transform localScale (1.1882331027357345 1.1882331027357345 1.1882331027357345)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.307649939595737 0)
"cameras" SET Transform eulerAngles (14.392430101010973 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6440625309208896
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.408052064757206
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09054543372609523
"cameras/drone/drone0" SET Transform localPosition (0.4614962400433682 0.18108455923808658 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6088921053949505 1.073829402606558 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 20 -16)
"cameras/drone/drone0" SET Transform localScale (1.4468381713365892 1.4468381713365892 1.4468381713365892)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -4 2)
"cameras/drone/drone1" SET Transform localScale (0.6050864097337446 0.6050864097337446 0.6050864097337446)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.463118115605532 0)
"cameras" SET Transform eulerAngles (5.9983674190958105 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8352377354674966
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.242578705838719
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10005443601999597
"cameras/drone/drone0" SET Transform localPosition (-0.7809468197763576 0.1390853843377931 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7127845882722674 1.169797846593686 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 15 -15)
"cameras/drone/drone0" SET Transform localScale (0.8013303311316078 0.8013303311316078 0.8013303311316078)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 14 20)
"cameras/drone/drone1" SET Transform localScale (0.8960693699996938 0.8960693699996938 0.8960693699996938)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3694639461840583 0)
"cameras" SET Transform eulerAngles (14.228874614619244 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7337355861181067
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0449680364415523
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13758715118667567
"cameras/drone/drone0" SET Transform localPosition (-0.7294066325092827 0.4721604314590701 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9706417251411461 0.9456255163228192 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -15 0)
"cameras/drone/drone0" SET Transform localScale (0.8066723342461082 0.8066723342461082 0.8066723342461082)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 17 20)
"cameras/drone/drone1" SET Transform localScale (0.8612382725233858 0.8612382725233858 0.8612382725233858)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5078784514034544 0)
"cameras" SET Transform eulerAngles (-2.431031209024713 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.365275955493865
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1851574387400277
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3420449697130974
"cameras/drone/drone0" SET Transform localPosition (0.10440829713692956 0.6127781282710498 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.941768119525223 1.0207073330164178 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -18 -13)
"cameras/drone/drone0" SET Transform localScale (0.9075384947426877 0.9075384947426877 0.9075384947426877)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -12 10)
"cameras/drone/drone1" SET Transform localScale (1.4209496053024016 1.4209496053024016 1.4209496053024016)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.114835873443695 0)
"cameras" SET Transform eulerAngles (11.600988812333561 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2059669095852779
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7009667214121607
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12450606831917721
"cameras/drone/drone0" SET Transform localPosition (-0.048899752401180496 0.042855384768624216 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1019180619871336 0.821278433646631 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 0 -1)
"cameras/drone/drone0" SET Transform localScale (1.2152648307624865 1.2152648307624865 1.2152648307624865)
"cameras/drone/drone1" SET Transform localEulerAngles (19 7 7)
"cameras/drone/drone1" SET Transform localScale (0.6670728380720821 0.6670728380720821 0.6670728380720821)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.560711678774549 0)
"cameras" SET Transform eulerAngles (0.7634229189262811 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5631729400053361
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1822426670985045
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03621056772073814
"cameras/drone/drone0" SET Transform localPosition (-1.1478515000437624 0.6355278873220362 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.885944426210864 1.2065755903011026 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 10 16)
"cameras/drone/drone0" SET Transform localScale (1.1038938821283901 1.1038938821283901 1.1038938821283901)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 13 18)
"cameras/drone/drone1" SET Transform localScale (1.4310878668994933 1.4310878668994933 1.4310878668994933)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.655406450586922 0)
"cameras" SET Transform eulerAngles (0.1803633249000356 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.44972557712957806
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5046477372542926
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3271592935369072
"cameras/drone/drone0" SET Transform localPosition (-0.46038366111215645 0.6207316202999902 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6041300953592073 1.0247573472971547 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -9 14)
"cameras/drone/drone0" SET Transform localScale (0.9680480100259424 0.9680480100259424 0.9680480100259424)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 17 -10)
"cameras/drone/drone1" SET Transform localScale (0.9948887463975911 0.9948887463975911 0.9948887463975911)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.879929811542893 0)
"cameras" SET Transform eulerAngles (-5.77853501878935 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7939507143135616
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3448264868990711
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16831172069061126
"cameras/drone/drone0" SET Transform localPosition (1.161941119603697 -0.07503575192376083 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0377383418803714 1.2098761904713404 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -7 4)
"cameras/drone/drone0" SET Transform localScale (1.4155754535552192 1.4155754535552192 1.4155754535552192)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -15 14)
"cameras/drone/drone1" SET Transform localScale (1.0893478860687233 1.0893478860687233 1.0893478860687233)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6043149381082 0)
"cameras" SET Transform eulerAngles (-9.193912112404075 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8511129744997123
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.057198735501185
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16080599531205705
"cameras/drone/drone0" SET Transform localPosition (0.19564799649201792 0.28286120585484814 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.15738317946587266 0.9123373430793386 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 16 -13)
"cameras/drone/drone0" SET Transform localScale (1.3040919628278955 1.3040919628278955 1.3040919628278955)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 3 -14)
"cameras/drone/drone1" SET Transform localScale (1.185875917040462 1.185875917040462 1.185875917040462)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.953575742265929 0)
"cameras" SET Transform eulerAngles (13.948099500440179 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6529557591393584
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.955321423748999
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3295238896642444
"cameras/drone/drone0" SET Transform localPosition (0.41648219154057076 0.07231309609506348 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.909638451269722 1.010119108369428 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -12 -3)
"cameras/drone/drone0" SET Transform localScale (0.8190723340676845 0.8190723340676845 0.8190723340676845)
"cameras/drone/drone1" SET Transform localEulerAngles (4 7 -1)
"cameras/drone/drone1" SET Transform localScale (0.9582395552249473 0.9582395552249473 0.9582395552249473)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5929241971899755 0)
"cameras" SET Transform eulerAngles (13.755262601289843 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8521216115487212
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3148146769276923
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.019184603169616565
"cameras/drone/drone0" SET Transform localPosition (0.8316871396853449 -0.23012059622647213 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.838832748921686 1.0624710840135199 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 17 -13)
"cameras/drone/drone0" SET Transform localScale (0.6154717059168723 0.6154717059168723 0.6154717059168723)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -9 -14)
"cameras/drone/drone1" SET Transform localScale (0.8544572658525886 0.8544572658525886 0.8544572658525886)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7175606753691706 0)
"cameras" SET Transform eulerAngles (-2.688313641875112 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0339745509594336
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.763694093484846
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34975198648492106
"cameras/drone/drone0" SET Transform localPosition (0.6467654833634655 0.2178560982934165 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.19327097577462027 1.0761937260080248 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 20 13)
"cameras/drone/drone0" SET Transform localScale (0.8280719184299041 0.8280719184299041 0.8280719184299041)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -5 3)
"cameras/drone/drone1" SET Transform localScale (0.961386781490049 0.961386781490049 0.961386781490049)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4154915212284847 0)
"cameras" SET Transform eulerAngles (8.471193688515935 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6002289234504596
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.049501047286129
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23970029786658445
"cameras/drone/drone0" SET Transform localPosition (-0.12208659151670087 0.47861297065438296 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5720196979031847 1.2530555594291537 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -13 -16)
"cameras/drone/drone0" SET Transform localScale (1.3342880142662898 1.3342880142662898 1.3342880142662898)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 9 8)
"cameras/drone/drone1" SET Transform localScale (0.7542779729465102 0.7542779729465102 0.7542779729465102)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.930010042967783 0)
"cameras" SET Transform eulerAngles (-7.382238041643948 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7745177242400139
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.222159587682313
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18596238731225073
"cameras/drone/drone0" SET Transform localPosition (-0.9185106117394746 0.06420494446162678 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7034921244506949 0.9913418744233726 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 -19 0)
"cameras/drone/drone0" SET Transform localScale (0.6419233758884567 0.6419233758884567 0.6419233758884567)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -8 1)
"cameras/drone/drone1" SET Transform localScale (1.2284524293757078 1.2284524293757078 1.2284524293757078)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8281083541114462 0)
"cameras" SET Transform eulerAngles (15.13898395290579 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5427833962991055
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1294122032397549
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3490583484676877
"cameras/drone/drone0" SET Transform localPosition (-0.5742310751334015 -0.19282214566414263 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1407404690912815 1.0196195723808017 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 5 -16)
"cameras/drone/drone0" SET Transform localScale (1.466092981738595 1.466092981738595 1.466092981738595)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -18 0)
"cameras/drone/drone1" SET Transform localScale (0.9360485363786257 0.9360485363786257 0.9360485363786257)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.417516069228171 0)
"cameras" SET Transform eulerAngles (-16.323337964361336 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2244734774722186
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9963107434004728
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2929274071210709
"cameras/drone/drone0" SET Transform localPosition (0.32126992788156983 -0.00808949564858591 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2230567540775903 0.8815860374398217 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 10 -17)
"cameras/drone/drone0" SET Transform localScale (1.473646114457472 1.473646114457472 1.473646114457472)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 13 3)
"cameras/drone/drone1" SET Transform localScale (1.084765579668043 1.084765579668043 1.084765579668043)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.369169104046144 0)
"cameras" SET Transform eulerAngles (-16.1237203734629 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5661473936670847
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5374116097232138
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02014332258614724
"cameras/drone/drone0" SET Transform localPosition (-1.05472634455046 -0.07844623554255387 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8433601585690915 1.0089126180096404 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -4 -17)
"cameras/drone/drone0" SET Transform localScale (1.3284387299823486 1.3284387299823486 1.3284387299823486)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 4 -7)
"cameras/drone/drone1" SET Transform localScale (1.4788285988043253 1.4788285988043253 1.4788285988043253)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.964840747357831 0)
"cameras" SET Transform eulerAngles (-1.4713637009379639 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.121727073471022
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3265177529022891
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10495130798865926
"cameras/drone/drone0" SET Transform localPosition (0.1927964387860408 -0.24409742158548514 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1477138430221006 0.9439199598565039 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -15 -20)
"cameras/drone/drone0" SET Transform localScale (0.63054535322987 0.63054535322987 0.63054535322987)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 17 0)
"cameras/drone/drone1" SET Transform localScale (0.9359495705993683 0.9359495705993683 0.9359495705993683)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.262837159509675 0)
"cameras" SET Transform eulerAngles (-0.9694621588864507 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7672213949396819
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.013022462528846
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13778563202639638
"cameras/drone/drone0" SET Transform localPosition (0.3301897893602741 0.5968469329085389 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.041374765310539185 1.0835322272643657 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 1 18)
"cameras/drone/drone0" SET Transform localScale (0.7647856233178999 0.7647856233178999 0.7647856233178999)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -20 -19)
"cameras/drone/drone1" SET Transform localScale (1.0996768459232884 1.0996768459232884 1.0996768459232884)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.255761285393773 0)
"cameras" SET Transform eulerAngles (13.006572928737903 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7759395189415594
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.893798832627731
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.314933666840133
"cameras/drone/drone0" SET Transform localPosition (-1.1130288344751196 0.6797926548175293 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.018749025911871886 0.9224593670103813 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 2 18)
"cameras/drone/drone0" SET Transform localScale (1.2768728831310763 1.2768728831310763 1.2768728831310763)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 14 18)
"cameras/drone/drone1" SET Transform localScale (0.9815729168869357 0.9815729168869357 0.9815729168869357)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.101764021226879 0)
"cameras" SET Transform eulerAngles (-1.8171280286299947 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8168102980931771
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.453764835360008
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07876847986422111
"cameras/drone/drone0" SET Transform localPosition (-0.43966871229624593 0.2111807929286495 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5310062899205634 1.0198518808985573 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 5 14)
"cameras/drone/drone0" SET Transform localScale (0.729257628981969 0.729257628981969 0.729257628981969)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -15 -19)
"cameras/drone/drone1" SET Transform localScale (0.6875540048363415 0.6875540048363415 0.6875540048363415)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6266302783712416 0)
"cameras" SET Transform eulerAngles (-0.6224293910696375 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5152923470654196
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3571590520964363
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08109397391200437
"cameras/drone/drone0" SET Transform localPosition (-0.9657392298988479 -0.15633680491213725 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3542488570887863 0.8610740672484918 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -18 7)
"cameras/drone/drone0" SET Transform localScale (1.1736828305291493 1.1736828305291493 1.1736828305291493)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 20 19)
"cameras/drone/drone1" SET Transform localScale (0.9344648671934022 0.9344648671934022 0.9344648671934022)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.355360205278185 0)
"cameras" SET Transform eulerAngles (16.336571518182048 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9778780427919287
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8001433374452294
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12653784067128648
"cameras/drone/drone0" SET Transform localPosition (0.01170918958735312 0.3208973083046896 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5257433558004304 1.129241311942859 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -6 -13)
"cameras/drone/drone0" SET Transform localScale (0.797075298805184 0.797075298805184 0.797075298805184)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -20 -18)
"cameras/drone/drone1" SET Transform localScale (1.1991057225467068 1.1991057225467068 1.1991057225467068)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5421879725135685 0)
"cameras" SET Transform eulerAngles (-11.403269122685193 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4377143009061895
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.639770517926415
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3963884360715279
"cameras/drone/drone0" SET Transform localPosition (0.4695522325074537 -0.15342815700633788 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7164700391542032 1.1520047698575973 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -16 14)
"cameras/drone/drone0" SET Transform localScale (0.7617183114534574 0.7617183114534574 0.7617183114534574)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -16 -13)
"cameras/drone/drone1" SET Transform localScale (0.6584925750919278 0.6584925750919278 0.6584925750919278)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.699208861179987 0)
"cameras" SET Transform eulerAngles (5.8976951169988965 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1109965390574281
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9496822256600055
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16041914572754334
"cameras/drone/drone0" SET Transform localPosition (-0.22054901948979566 0.2897428633305485 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.532609439562874 1.1580286539910505 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 12 7)
"cameras/drone/drone0" SET Transform localScale (0.9787347441371734 0.9787347441371734 0.9787347441371734)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 8 11)
"cameras/drone/drone1" SET Transform localScale (1.096115242759275 1.096115242759275 1.096115242759275)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.802795913678204 0)
"cameras" SET Transform eulerAngles (-3.9116332316976923 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.009424862099822
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.103912506490135
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04274316543548817
"cameras/drone/drone0" SET Transform localPosition (0.9272843767740591 -0.16075738913669274 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.07909814576261875 0.9119625909237479 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -13 12)
"cameras/drone/drone0" SET Transform localScale (1.263644674215247 1.263644674215247 1.263644674215247)
"cameras/drone/drone1" SET Transform localEulerAngles (11 17 -13)
"cameras/drone/drone1" SET Transform localScale (0.7427506769291883 0.7427506769291883 0.7427506769291883)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.431111741582595 0)
"cameras" SET Transform eulerAngles (-18.874026474492233 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7559809951609546
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7161818763018255
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1257126849561523
"cameras/drone/drone0" SET Transform localPosition (-0.356513808208479 0.17278788057637967 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.199775657388421 1.2040049214079862 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -14 6)
"cameras/drone/drone0" SET Transform localScale (0.9249114135303447 0.9249114135303447 0.9249114135303447)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 18 -4)
"cameras/drone/drone1" SET Transform localScale (0.7014246625442513 0.7014246625442513 0.7014246625442513)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.150564762422065 0)
"cameras" SET Transform eulerAngles (-4.252398387133972 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.439136153488095
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3673412274259091
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17795329841363264
"cameras/drone/drone0" SET Transform localPosition (-0.5176460450201703 0.28507282607849077 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.25356926803657986 1.1559235109626 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 6 -17)
"cameras/drone/drone0" SET Transform localScale (1.11794691594327 1.11794691594327 1.11794691594327)
"cameras/drone/drone1" SET Transform localEulerAngles (18 6 1)
"cameras/drone/drone1" SET Transform localScale (0.6150304718121126 0.6150304718121126 0.6150304718121126)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.150810613667342 0)
"cameras" SET Transform eulerAngles (10.928989004575755 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0663434229571704
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1027420627977254
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37341857112066495
"cameras/drone/drone0" SET Transform localPosition (0.9412443292341834 0.3024401759528376 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5592083838257698 1.128096073216777 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -4 1)
"cameras/drone/drone0" SET Transform localScale (1.457359450377739 1.457359450377739 1.457359450377739)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 3 11)
"cameras/drone/drone1" SET Transform localScale (0.8207640275290528 0.8207640275290528 0.8207640275290528)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.11949945495453 0)
"cameras" SET Transform eulerAngles (6.469552101027492 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9645145112423218
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.510920433815565
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24028897334767974
"cameras/drone/drone0" SET Transform localPosition (-0.9532883223670043 0.4317929115605667 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.08786780711405817 1.2516740761664549 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 19 11)
"cameras/drone/drone0" SET Transform localScale (0.6025109038589718 0.6025109038589718 0.6025109038589718)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 5 17)
"cameras/drone/drone1" SET Transform localScale (1.3232884508722775 1.3232884508722775 1.3232884508722775)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.982895647891983 0)
"cameras" SET Transform eulerAngles (-13.762995072372197 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.568539114480112
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5028757794171548
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1902148138816515
"cameras/drone/drone0" SET Transform localPosition (0.2565027761389067 0.5578516086835326 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3574007639019823 0.8537957657771347 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -2 12)
"cameras/drone/drone0" SET Transform localScale (1.1200382166042395 1.1200382166042395 1.1200382166042395)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -6 -13)
"cameras/drone/drone1" SET Transform localScale (1.2271716165009119 1.2271716165009119 1.2271716165009119)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.151379834734991 0)
"cameras" SET Transform eulerAngles (2.4781077115599537 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4865543786993847
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2108758866787606
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37804003427854943
"cameras/drone/drone0" SET Transform localPosition (-0.875871935841732 0.20460176697817872 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8239812333339127 1.1439085729993246 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 -20 19)
"cameras/drone/drone0" SET Transform localScale (1.3184938277979175 1.3184938277979175 1.3184938277979175)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 14 -20)
"cameras/drone/drone1" SET Transform localScale (1.0841187954220084 1.0841187954220084 1.0841187954220084)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3471390140663866 0)
"cameras" SET Transform eulerAngles (0.6449631689018034 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3230991803966217
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9809540979976766
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03984013300451923
"cameras/drone/drone0" SET Transform localPosition (0.14720273906261294 0.06042248699898406 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1874624069346755 1.2702954628136793 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 15 -15)
"cameras/drone/drone0" SET Transform localScale (1.2331654151322755 1.2331654151322755 1.2331654151322755)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -10 16)
"cameras/drone/drone1" SET Transform localScale (1.1680001294433715 1.1680001294433715 1.1680001294433715)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.689316613654501 0)
"cameras" SET Transform eulerAngles (12.386380236451757 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7177747950296984
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.239791943604524
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.013729707009949044
"cameras/drone/drone0" SET Transform localPosition (-0.1514329095991067 0.6075909685829113 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.06193126358336376 1.1663501914058654 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 18 13)
"cameras/drone/drone0" SET Transform localScale (1.459439581947431 1.459439581947431 1.459439581947431)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 10 -18)
"cameras/drone/drone1" SET Transform localScale (1.4155386524194222 1.4155386524194222 1.4155386524194222)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.747470180302543 0)
"cameras" SET Transform eulerAngles (17.75826520533628 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4571342256006805
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1160876002064233
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.011335460021010447
"cameras/drone/drone0" SET Transform localPosition (0.4466957449126574 -0.11883188945619422 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7963767864788631 1.0007253189822745 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 9 13)
"cameras/drone/drone0" SET Transform localScale (1.338570604767108 1.338570604767108 1.338570604767108)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -11 -3)
"cameras/drone/drone1" SET Transform localScale (1.2414708478149126 1.2414708478149126 1.2414708478149126)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.830699534023079 0)
"cameras" SET Transform eulerAngles (2.3877356575675606 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5108612549585527
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8784054244984334
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1808339406869669
"cameras/drone/drone0" SET Transform localPosition (1.1991810268651097 0.5222719548205008 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0831044770894311 1.2686150767429125 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 11 12)
"cameras/drone/drone0" SET Transform localScale (1.2152037945147924 1.2152037945147924 1.2152037945147924)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 17 -20)
"cameras/drone/drone1" SET Transform localScale (1.4928519182375364 1.4928519182375364 1.4928519182375364)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.19042347841109 0)
"cameras" SET Transform eulerAngles (-4.168813571060316 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5411383404043949
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.961875010266065
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37780101193840493
"cameras/drone/drone0" SET Transform localPosition (-0.2509388437030743 0.6121348417857806 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.38342534227739533 0.9531883492551814 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -14 6)
"cameras/drone/drone0" SET Transform localScale (0.9115992883039248 0.9115992883039248 0.9115992883039248)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -4 14)
"cameras/drone/drone1" SET Transform localScale (0.8475979606609322 0.8475979606609322 0.8475979606609322)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.695005068353746 0)
"cameras" SET Transform eulerAngles (-19.31198323728399 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7364661286811777
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4238190102224082
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08548849549465141
"cameras/drone/drone0" SET Transform localPosition (-0.4861050716636234 0.1485604119340343 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0677990901062004 0.8029362778755158 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -11 -9)
"cameras/drone/drone0" SET Transform localScale (0.9556458716760714 0.9556458716760714 0.9556458716760714)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 18 16)
"cameras/drone/drone1" SET Transform localScale (0.9526204266104618 0.9526204266104618 0.9526204266104618)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.525848666041375 0)
"cameras" SET Transform eulerAngles (0.5560456507713809 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7852795381308133
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.690880608851625
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30513814544428225
"cameras/drone/drone0" SET Transform localPosition (0.5552994334246397 -0.29004287705631143 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3616734212380236 0.9970749471435083 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -2 -10)
"cameras/drone/drone0" SET Transform localScale (1.1399247229316205 1.1399247229316205 1.1399247229316205)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -5 -11)
"cameras/drone/drone1" SET Transform localScale (1.1003846890344602 1.1003846890344602 1.1003846890344602)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.850932793864564 0)
"cameras" SET Transform eulerAngles (4.430253620981475 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5439802682657497
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8500123731418774
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15860500936767197
"cameras/drone/drone0" SET Transform localPosition (1.0871273186092172 0.1887279776114114 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8035356494412604 0.8820874528375483 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 7 0)
"cameras/drone/drone0" SET Transform localScale (1.3246298593861237 1.3246298593861237 1.3246298593861237)
"cameras/drone/drone1" SET Transform localEulerAngles (12 13 -6)
"cameras/drone/drone1" SET Transform localScale (1.479245526141279 1.479245526141279 1.479245526141279)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.656956368455076 0)
"cameras" SET Transform eulerAngles (2.3411504909034697 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9904142217605318
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0086360290015046
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31314641730591
"cameras/drone/drone0" SET Transform localPosition (0.5518887318765346 0.37806303026002147 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1290864152820241 0.9592796647844677 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 4 16)
"cameras/drone/drone0" SET Transform localScale (1.1020802827026568 1.1020802827026568 1.1020802827026568)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -11 10)
"cameras/drone/drone1" SET Transform localScale (1.4510911211579511 1.4510911211579511 1.4510911211579511)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.087629343912483 0)
"cameras" SET Transform eulerAngles (11.917221269536658 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5570677130505712
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1604150992190434
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02868842787092767
"cameras/drone/drone0" SET Transform localPosition (0.97714671986578 0.426259233451772 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8975365045880028 1.180687987668506 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 4 2)
"cameras/drone/drone0" SET Transform localScale (0.9653511442890013 0.9653511442890013 0.9653511442890013)
"cameras/drone/drone1" SET Transform localEulerAngles (3 7 15)
"cameras/drone/drone1" SET Transform localScale (1.287320716257128 1.287320716257128 1.287320716257128)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8673389059423737 0)
"cameras" SET Transform eulerAngles (-1.6785162088151182 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5945394017834765
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1665560737934046
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2403931236950097
"cameras/drone/drone0" SET Transform localPosition (-0.6949841153312446 0.6871673492333867 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9938645768250887 1.1282328930427736 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 13 -16)
"cameras/drone/drone0" SET Transform localScale (0.9906328602404736 0.9906328602404736 0.9906328602404736)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 1 -8)
"cameras/drone/drone1" SET Transform localScale (1.3768555035194914 1.3768555035194914 1.3768555035194914)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.713174174924806 0)
"cameras" SET Transform eulerAngles (9.168458277873977 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4663700150619627
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4068282912590218
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2178121939481805
"cameras/drone/drone0" SET Transform localPosition (0.9672795224388293 0.4575859053969172 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1175013500748439 0.8772833998104399 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -18 16)
"cameras/drone/drone0" SET Transform localScale (1.175413598515074 1.175413598515074 1.175413598515074)
"cameras/drone/drone1" SET Transform localEulerAngles (11 14 -7)
"cameras/drone/drone1" SET Transform localScale (0.7797174816658348 0.7797174816658348 0.7797174816658348)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.4232792570122665 0)
"cameras" SET Transform eulerAngles (10.198758992876655 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3804632519421447
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6202878365096698
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2046939111840158
"cameras/drone/drone0" SET Transform localPosition (0.5254978905714112 0.3668971781498788 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.28795233485836846 1.150344006588091 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 17 -12)
"cameras/drone/drone0" SET Transform localScale (0.9031687763218262 0.9031687763218262 0.9031687763218262)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 18 19)
"cameras/drone/drone1" SET Transform localScale (0.6445515831069251 0.6445515831069251 0.6445515831069251)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.483488625636645 0)
"cameras" SET Transform eulerAngles (-16.432156723384725 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0136086355787661
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8662132856728126
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1699600078328788
"cameras/drone/drone0" SET Transform localPosition (1.0394713533302713 -0.2785828510191957 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6699144439080447 0.8515075280414143 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 20 18)
"cameras/drone/drone0" SET Transform localScale (1.4335526974458959 1.4335526974458959 1.4335526974458959)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -1 4)
"cameras/drone/drone1" SET Transform localScale (0.7071674296194526 0.7071674296194526 0.7071674296194526)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.843496952204453 0)
"cameras" SET Transform eulerAngles (-5.27359707152681 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3129378440067772
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9675258287352181
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0005222296056638154
"cameras/drone/drone0" SET Transform localPosition (0.7837393896124238 0.18500403526084236 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.273820397664289 1.0612926928100415 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 2 -11)
"cameras/drone/drone0" SET Transform localScale (1.0041449218901495 1.0041449218901495 1.0041449218901495)
"cameras/drone/drone1" SET Transform localEulerAngles (1 9 11)
"cameras/drone/drone1" SET Transform localScale (0.9501776403980009 0.9501776403980009 0.9501776403980009)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.723182452953183 0)
"cameras" SET Transform eulerAngles (-7.190849554105432 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.657462791021229
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3870341468259832
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1056804700994387
"cameras/drone/drone0" SET Transform localPosition (-0.23516153925600236 0.5698483902152538 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.48563885110486127 0.9248316191713724 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -4 16)
"cameras/drone/drone0" SET Transform localScale (0.7320654769466618 0.7320654769466618 0.7320654769466618)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -6 3)
"cameras/drone/drone1" SET Transform localScale (1.471671583667765 1.471671583667765 1.471671583667765)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.136439712633536 0)
"cameras" SET Transform eulerAngles (-11.466567715933342 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0724800039818414
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.590618733006965
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08437481927552337
"cameras/drone/drone0" SET Transform localPosition (0.14063471132238448 0.11195099383107227 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.14770190479235845 0.8635873517350225 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 14 14)
"cameras/drone/drone0" SET Transform localScale (1.176456541321578 1.176456541321578 1.176456541321578)
"cameras/drone/drone1" SET Transform localEulerAngles (11 0 9)
"cameras/drone/drone1" SET Transform localScale (1.3207075694153743 1.3207075694153743 1.3207075694153743)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.646535633441831 0)
"cameras" SET Transform eulerAngles (-0.8803986323284292 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.605705928803357
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8583079555942446
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1573582269623593
"cameras/drone/drone0" SET Transform localPosition (-0.022395223322891455 0.6652690857920338 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.965091416725413 1.0674152827507977 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -18 8)
"cameras/drone/drone0" SET Transform localScale (1.2459575927517024 1.2459575927517024 1.2459575927517024)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 12 17)
"cameras/drone/drone1" SET Transform localScale (1.2929735877844637 1.2929735877844637 1.2929735877844637)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.445491194122036 0)
"cameras" SET Transform eulerAngles (-6.217350535550743 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4297460473029378
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9776085571323345
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3899086997485177
"cameras/drone/drone0" SET Transform localPosition (1.1962398474021272 -0.022604226457047905 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.898936648397591 1.0438803766590745 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 10 8)
"cameras/drone/drone0" SET Transform localScale (1.4606973205510279 1.4606973205510279 1.4606973205510279)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 9 -9)
"cameras/drone/drone1" SET Transform localScale (1.275406779369889 1.275406779369889 1.275406779369889)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.455672169601603 0)
"cameras" SET Transform eulerAngles (17.46689191423603 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5313561359042112
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8010676400403987
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17716552705238425
"cameras/drone/drone0" SET Transform localPosition (-0.06517125366320764 0.5308325917173733 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7357470277356826 0.9558932215381489 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -2 18)
"cameras/drone/drone0" SET Transform localScale (0.8872935622895188 0.8872935622895188 0.8872935622895188)
"cameras/drone/drone1" SET Transform localEulerAngles (2 14 4)
"cameras/drone/drone1" SET Transform localScale (0.9950861182667938 0.9950861182667938 0.9950861182667938)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.509505582426769 0)
"cameras" SET Transform eulerAngles (-12.039814025275227 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2645202183536046
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.622951930101048
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2388412798807833
"cameras/drone/drone0" SET Transform localPosition (0.23749430258432302 -0.03318713845144311 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5568634002762095 1.191981370238215 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -8 13)
"cameras/drone/drone0" SET Transform localScale (0.8189125245976355 0.8189125245976355 0.8189125245976355)
"cameras/drone/drone1" SET Transform localEulerAngles (9 15 -20)
"cameras/drone/drone1" SET Transform localScale (0.881909061751708 0.881909061751708 0.881909061751708)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.876134442493955 0)
"cameras" SET Transform eulerAngles (-11.3253307034537 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.43142720717569283
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0491503579720893
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2908279529236134
"cameras/drone/drone0" SET Transform localPosition (0.4486776448028085 -0.2899561104464308 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.08698569559413549 0.9463953454256345 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -14 7)
"cameras/drone/drone0" SET Transform localScale (1.41839164430324 1.41839164430324 1.41839164430324)
"cameras/drone/drone1" SET Transform localEulerAngles (8 17 -12)
"cameras/drone/drone1" SET Transform localScale (0.865228128552215 0.865228128552215 0.865228128552215)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.928581864404391 0)
"cameras" SET Transform eulerAngles (2.97331134842182 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0360830347787244
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2292877930706458
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36350415257333846
"cameras/drone/drone0" SET Transform localPosition (1.083439554603067 0.4630074754088958 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3753914470040236 1.0876064368544505 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 -2 8)
"cameras/drone/drone0" SET Transform localScale (1.271074804403662 1.271074804403662 1.271074804403662)
"cameras/drone/drone1" SET Transform localEulerAngles (8 10 16)
"cameras/drone/drone1" SET Transform localScale (1.2260637686434277 1.2260637686434277 1.2260637686434277)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0079788892629544 0)
"cameras" SET Transform eulerAngles (2.763696450719184 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.481555433275179
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9061946107064243
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15302764130328206
"cameras/drone/drone0" SET Transform localPosition (0.3259750548728304 0.44505936851419176 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.158755978354822 1.094963736350167 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -17 9)
"cameras/drone/drone0" SET Transform localScale (0.6783371819196697 0.6783371819196697 0.6783371819196697)
"cameras/drone/drone1" SET Transform localEulerAngles (9 11 12)
"cameras/drone/drone1" SET Transform localScale (0.8438822766264393 0.8438822766264393 0.8438822766264393)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.240321576286978 0)
"cameras" SET Transform eulerAngles (13.402264397424432 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.49903807932017036
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7425072813048783
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3812654278449048
"cameras/drone/drone0" SET Transform localPosition (-0.5536512268748751 -0.2308337373378812 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0506932992012803 0.9572075833618536 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 0 17)
"cameras/drone/drone0" SET Transform localScale (1.4091123323025405 1.4091123323025405 1.4091123323025405)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -17 12)
"cameras/drone/drone1" SET Transform localScale (0.7832771905257845 0.7832771905257845 0.7832771905257845)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7811905024209302 0)
"cameras" SET Transform eulerAngles (3.5082176405386356 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5473798237888743
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5710309511228084
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.038203397624838736
"cameras/drone/drone0" SET Transform localPosition (0.8171743321797631 0.6008731079048868 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0993470236482994 0.9283180574649509 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 18 17)
"cameras/drone/drone0" SET Transform localScale (0.7165814879317148 0.7165814879317148 0.7165814879317148)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 6 2)
"cameras/drone/drone1" SET Transform localScale (1.0799424650946046 1.0799424650946046 1.0799424650946046)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.35602863083823 0)
"cameras" SET Transform eulerAngles (-17.589600021575677 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2515355167149091
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0294337416415595
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2567555002687247
"cameras/drone/drone0" SET Transform localPosition (-0.8872863712938617 -0.14526358656752664 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1305628731443955 1.2881529664423383 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 13 -14)
"cameras/drone/drone0" SET Transform localScale (1.4376956837715558 1.4376956837715558 1.4376956837715558)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -17 -15)
"cameras/drone/drone1" SET Transform localScale (0.659047835675434 0.659047835675434 0.659047835675434)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8031829011328036 0)
"cameras" SET Transform eulerAngles (-15.113651712271935 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8786644450059959
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2062560556320017
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.020827984059182115
"cameras/drone/drone0" SET Transform localPosition (-0.8187008801695271 -0.026299364628311894 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0416393715501318 0.9632277079675732 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 2 -5)
"cameras/drone/drone0" SET Transform localScale (1.0233830531777213 1.0233830531777213 1.0233830531777213)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 11 -7)
"cameras/drone/drone1" SET Transform localScale (1.3504362691685174 1.3504362691685174 1.3504362691685174)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0781817670072256 0)
"cameras" SET Transform eulerAngles (-10.787111747037358 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5078224929043779
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8794651086063292
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21107548869649362
"cameras/drone/drone0" SET Transform localPosition (0.4572911554621113 0.5334849857372341 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7461282977418981 1.2277650669858624 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -9 -4)
"cameras/drone/drone0" SET Transform localScale (1.0108799326899958 1.0108799326899958 1.0108799326899958)
"cameras/drone/drone1" SET Transform localEulerAngles (3 3 11)
"cameras/drone/drone1" SET Transform localScale (1.2205807825749106 1.2205807825749106 1.2205807825749106)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.257475495999442 0)
"cameras" SET Transform eulerAngles (8.431041184978856 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4305954952985824
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2471942146490171
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2988410737062701
"cameras/drone/drone0" SET Transform localPosition (0.23913848670442528 0.403330921566659 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7322400080479998 1.2142929985283177 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 4 -8)
"cameras/drone/drone0" SET Transform localScale (0.9712026905740649 0.9712026905740649 0.9712026905740649)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -10 18)
"cameras/drone/drone1" SET Transform localScale (1.0175406733611574 1.0175406733611574 1.0175406733611574)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2390750977354346 0)
"cameras" SET Transform eulerAngles (-15.642181525079092 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.097273246945852
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7115537589174648
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3343781927515012
"cameras/drone/drone0" SET Transform localPosition (-0.2910470470078247 -0.03355949519058671 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.40318927406238625 0.827889102567132 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 20 -7)
"cameras/drone/drone0" SET Transform localScale (0.6797005473379543 0.6797005473379543 0.6797005473379543)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -17 13)
"cameras/drone/drone1" SET Transform localScale (0.8411919368427803 0.8411919368427803 0.8411919368427803)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.149465025243128 0)
"cameras" SET Transform eulerAngles (18.573721569006793 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8641450406104956
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8594350478327897
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2266048649243677
"cameras/drone/drone0" SET Transform localPosition (-1.0870702169634086 0.15853292415732473 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9045056981316992 1.122738324894188 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -18 -18)
"cameras/drone/drone0" SET Transform localScale (1.3236220342703633 1.3236220342703633 1.3236220342703633)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -17 9)
"cameras/drone/drone1" SET Transform localScale (1.417919747579878 1.417919747579878 1.417919747579878)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.405816082660378 0)
"cameras" SET Transform eulerAngles (18.59990820574687 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4079006585202247
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4760793021837184
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39715186733640295
"cameras/drone/drone0" SET Transform localPosition (-0.5639474081894494 0.4912511948893406 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.06460343279717184 1.2782256252843367 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -7 -5)
"cameras/drone/drone0" SET Transform localScale (0.6952878957963448 0.6952878957963448 0.6952878957963448)
"cameras/drone/drone1" SET Transform localEulerAngles (15 -7 2)
"cameras/drone/drone1" SET Transform localScale (0.7277447346488644 0.7277447346488644 0.7277447346488644)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.624947706397876 0)
"cameras" SET Transform eulerAngles (3.963974685399293 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.587265277360597
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9976527297527755
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14164966688476072
"cameras/drone/drone0" SET Transform localPosition (0.9938351991010854 0.13026603982407542 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.018648308375041278 1.0620353415659427 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 15 8)
"cameras/drone/drone0" SET Transform localScale (0.7110472834920468 0.7110472834920468 0.7110472834920468)
"cameras/drone/drone1" SET Transform localEulerAngles (18 9 -12)
"cameras/drone/drone1" SET Transform localScale (0.6725034942148118 0.6725034942148118 0.6725034942148118)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 32
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 3.955841236785526 0)
"cameras" SET Transform eulerAngles (14.746592111673372 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5413839013895291
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.680736603613969
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2702123646431439
"cameras/drone/drone0" SET Transform localPosition (-0.38563306124217045 -0.09145108665989948 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4456932010278313 1.2455026826713664 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -9 -13)
"cameras/drone/drone0" SET Transform localScale (0.6498140006608389 0.6498140006608389 0.6498140006608389)
"cameras/drone/drone1" SET Transform localEulerAngles (11 5 10)
"cameras/drone/drone1" SET Transform localScale (1.013872953344413 1.013872953344413 1.013872953344413)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0021211783806026 0)
"cameras" SET Transform eulerAngles (-9.528560996473395 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.920862324142799
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.510586240331655
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2678983626485167
"cameras/drone/drone0" SET Transform localPosition (-0.9893855690938206 0.3779908860867009 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1180650291531429 1.0674949716593138 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 3 15)
"cameras/drone/drone0" SET Transform localScale (1.254720959235473 1.254720959235473 1.254720959235473)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -10 11)
"cameras/drone/drone1" SET Transform localScale (1.4676862395499033 1.4676862395499033 1.4676862395499033)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9557723455846268 0)
"cameras" SET Transform eulerAngles (-11.15861758315254 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2776796507283557
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7271774522066847
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29812930321626324
"cameras/drone/drone0" SET Transform localPosition (0.4999269076935644 -0.23625762386258436 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.14351804207595587 1.0111706120782467 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 1 3)
"cameras/drone/drone0" SET Transform localScale (1.1961476844641767 1.1961476844641767 1.1961476844641767)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -9 -6)
"cameras/drone/drone1" SET Transform localScale (0.7337091505333477 0.7337091505333477 0.7337091505333477)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.15617675762415 0)
"cameras" SET Transform eulerAngles (-17.952973593018392 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2451172193060391
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2090230465233345
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.382549251884335
"cameras/drone/drone0" SET Transform localPosition (-0.4435752163960375 0.17724760655945654 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.23465839883939954 1.074238346768392 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -3 11)
"cameras/drone/drone0" SET Transform localScale (1.0211829460061925 1.0211829460061925 1.0211829460061925)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -10 8)
"cameras/drone/drone1" SET Transform localScale (1.009528814622286 1.009528814622286 1.009528814622286)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.735611347379591 0)
"cameras" SET Transform eulerAngles (10.904288306604354 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5875008570885614
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2095171181457243
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32546871556899326
"cameras/drone/drone0" SET Transform localPosition (0.7698569579116574 0.3607582881619726 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9070775994637865 1.1434286067197674 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 3 7)
"cameras/drone/drone0" SET Transform localScale (0.9095618556020898 0.9095618556020898 0.9095618556020898)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -19 -1)
"cameras/drone/drone1" SET Transform localScale (0.6991116834816976 0.6991116834816976 0.6991116834816976)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.274542033346137 0)
"cameras" SET Transform eulerAngles (-15.992644315725212 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0019851705369387
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.907110772951227
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3000865520321586
"cameras/drone/drone0" SET Transform localPosition (1.0431415044866912 0.3416332203039741 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.502313911858564 1.0132231376189043 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 8 13)
"cameras/drone/drone0" SET Transform localScale (1.4264381107806603 1.4264381107806603 1.4264381107806603)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -20 -19)
"cameras/drone/drone1" SET Transform localScale (1.1156424888697414 1.1156424888697414 1.1156424888697414)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.972035567927065 0)
"cameras" SET Transform eulerAngles (18.34033773807682 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7185012398762669
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7432581625994725
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2906721604240955
"cameras/drone/drone0" SET Transform localPosition (-0.5338622300853353 0.06331799491797713 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1994832511863962 1.0466087349454154 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -9 12)
"cameras/drone/drone0" SET Transform localScale (0.8145413183101763 0.8145413183101763 0.8145413183101763)
"cameras/drone/drone1" SET Transform localEulerAngles (13 7 4)
"cameras/drone/drone1" SET Transform localScale (0.9597589738304048 0.9597589738304048 0.9597589738304048)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.432025005834017 0)
"cameras" SET Transform eulerAngles (-0.5798332601811751 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6213435099356611
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0683413239145025
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1692779444700736
"cameras/drone/drone0" SET Transform localPosition (-1.0375974759836126 -0.2697547451357772 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.759182612510487 0.9992694989893507 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -16 20)
"cameras/drone/drone0" SET Transform localScale (1.133919271543887 1.133919271543887 1.133919271543887)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -15 -14)
"cameras/drone/drone1" SET Transform localScale (1.2327656927422606 1.2327656927422606 1.2327656927422606)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.94283698920584 0)
"cameras" SET Transform eulerAngles (-8.532689334157432 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3050927749418504
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5784990476592358
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23631181142853597
"cameras/drone/drone0" SET Transform localPosition (-1.0187792632233375 0.4193353341262935 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1234923018745111 0.9336768991563138 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -15 -8)
"cameras/drone/drone0" SET Transform localScale (0.935745700437741 0.935745700437741 0.935745700437741)
"cameras/drone/drone1" SET Transform localEulerAngles (3 20 10)
"cameras/drone/drone1" SET Transform localScale (0.7574944869631409 0.7574944869631409 0.7574944869631409)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.835105347084943 0)
"cameras" SET Transform eulerAngles (12.32171201813135 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.008770756718937
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7709871095914202
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1165092279671435
"cameras/drone/drone0" SET Transform localPosition (0.14689658452465748 -0.20322977448065477 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8369642821593131 1.2190778882352258 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 15 16)
"cameras/drone/drone0" SET Transform localScale (1.3618466019902407 1.3618466019902407 1.3618466019902407)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -20 -16)
"cameras/drone/drone1" SET Transform localScale (1.0417393727321422 1.0417393727321422 1.0417393727321422)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.920824030966973 0)
"cameras" SET Transform eulerAngles (14.414868512936742 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4697768223270509
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8847025246050066
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.313814514402708
"cameras/drone/drone0" SET Transform localPosition (-0.09794631987413949 -0.2029377911731997 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1284165678985938 0.9219034352931892 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 15 -8)
"cameras/drone/drone0" SET Transform localScale (1.2576120125128176 1.2576120125128176 1.2576120125128176)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 2 -17)
"cameras/drone/drone1" SET Transform localScale (0.7093417406021004 0.7093417406021004 0.7093417406021004)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.729889715327096 0)
"cameras" SET Transform eulerAngles (14.176055575101138 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5578882075793477
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1887980654572297
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17922612525000933
"cameras/drone/drone0" SET Transform localPosition (-0.0948591812592603 0.5879521046393175 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9537481539057282 0.9502887103048667 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -14 9)
"cameras/drone/drone0" SET Transform localScale (0.8562329904619344 0.8562329904619344 0.8562329904619344)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -20 16)
"cameras/drone/drone1" SET Transform localScale (1.2110164959121188 1.2110164959121188 1.2110164959121188)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.401912307863775 0)
"cameras" SET Transform eulerAngles (16.04923553829012 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.180052182707342
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1893141064087354
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12420762808026012
"cameras/drone/drone0" SET Transform localPosition (0.5342755781519377 -0.19270806137139512 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6167872190751575 0.9660476370677455 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -3 1)
"cameras/drone/drone0" SET Transform localScale (1.266932130420955 1.266932130420955 1.266932130420955)
"cameras/drone/drone1" SET Transform localEulerAngles (16 15 -8)
"cameras/drone/drone1" SET Transform localScale (0.6881461266244051 0.6881461266244051 0.6881461266244051)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7647531696802625 0)
"cameras" SET Transform eulerAngles (3.3572596698017207 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.48343349585467554
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2029179625883784
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13511646610496625
"cameras/drone/drone0" SET Transform localPosition (-1.1384945096037866 0.4049742066926714 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.140688943721459 0.88146307403101 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 11 17)
"cameras/drone/drone0" SET Transform localScale (1.3827620177235382 1.3827620177235382 1.3827620177235382)
"cameras/drone/drone1" SET Transform localEulerAngles (3 15 -10)
"cameras/drone/drone1" SET Transform localScale (1.3293762322946931 1.3293762322946931 1.3293762322946931)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.514780997856242 0)
"cameras" SET Transform eulerAngles (0.07823804037526116 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6249458262847153
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9526599863080022
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10933121717803972
"cameras/drone/drone0" SET Transform localPosition (0.22924402507524788 0.6484849180254593 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2209028636436774 1.1526815495289806 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -13 -17)
"cameras/drone/drone0" SET Transform localScale (1.214196420537895 1.214196420537895 1.214196420537895)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 -17 -10)
"cameras/drone/drone1" SET Transform localScale (1.3710374757875339 1.3710374757875339 1.3710374757875339)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4234888193185995 0)
"cameras" SET Transform eulerAngles (-10.847921678916151 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5337439642068015
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6465889898402977
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11225764618546141
"cameras/drone/drone0" SET Transform localPosition (-0.9052814614781161 -0.1278717826175298 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7815816674600902 1.293153696926051 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 0 15)
"cameras/drone/drone0" SET Transform localScale (0.6567468282925514 0.6567468282925514 0.6567468282925514)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 11 -11)
"cameras/drone/drone1" SET Transform localScale (1.126388179657258 1.126388179657258 1.126388179657258)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.70415500827832 0)
"cameras" SET Transform eulerAngles (-14.429910397520654 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1777857927122193
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7617232610510976
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.00043439914329157503
"cameras/drone/drone0" SET Transform localPosition (0.3875053566872253 0.6400666570924831 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.005920829962165364 0.8442860364893651 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 5 -11)
"cameras/drone/drone0" SET Transform localScale (0.8242599030941336 0.8242599030941336 0.8242599030941336)
"cameras/drone/drone1" SET Transform localEulerAngles (18 9 13)
"cameras/drone/drone1" SET Transform localScale (1.3508081498551654 1.3508081498551654 1.3508081498551654)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.694640004075782 0)
"cameras" SET Transform eulerAngles (19.517733658765145 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1859812157879537
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6106013922992015
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08351224385098797
"cameras/drone/drone0" SET Transform localPosition (0.0662605388087476 0.5890007614938548 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0359927822395922 1.2030050196928572 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 12 -5)
"cameras/drone/drone0" SET Transform localScale (1.4111284787357299 1.4111284787357299 1.4111284787357299)
"cameras/drone/drone1" SET Transform localEulerAngles (1 5 -14)
"cameras/drone/drone1" SET Transform localScale (1.099095830101795 1.099095830101795 1.099095830101795)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3542290770883674 0)
"cameras" SET Transform eulerAngles (-19.10344992478164 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.063304508953554
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4742642119055427
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1666238641384546
"cameras/drone/drone0" SET Transform localPosition (0.7786146613003551 -0.1046102793493871 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2081204642562854 0.9739350870330779 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -8 -15)
"cameras/drone/drone0" SET Transform localScale (1.1944259481510828 1.1944259481510828 1.1944259481510828)
"cameras/drone/drone1" SET Transform localEulerAngles (0 15 19)
"cameras/drone/drone1" SET Transform localScale (0.6871936230662622 0.6871936230662622 0.6871936230662622)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.040368639727818 0)
"cameras" SET Transform eulerAngles (-11.181550726397269 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5908525876445865
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0865738428987703
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2740346402265998
"cameras/drone/drone0" SET Transform localPosition (-0.9519007762181863 0.5028857623298071 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5036400818244404 1.12278738989354 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 18 13)
"cameras/drone/drone0" SET Transform localScale (0.7640048410895445 0.7640048410895445 0.7640048410895445)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -17 4)
"cameras/drone/drone1" SET Transform localScale (0.8936078732437209 0.8936078732437209 0.8936078732437209)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5186595988702045 0)
"cameras" SET Transform eulerAngles (11.17940371247597 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2107773321106883
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5987240300092338
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0407632640065136
"cameras/drone/drone0" SET Transform localPosition (0.3153946834410286 0.45640692524720167 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7812081353638163 1.143615578171576 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -10 4)
"cameras/drone/drone0" SET Transform localScale (1.008824637445195 1.008824637445195 1.008824637445195)
"cameras/drone/drone1" SET Transform localEulerAngles (0 5 -13)
"cameras/drone/drone1" SET Transform localScale (1.1142160969088175 1.1142160969088175 1.1142160969088175)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.73818904362099 0)
"cameras" SET Transform eulerAngles (-16.154171573294626 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3302663213122794
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8288472407687704
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08029083727565092
"cameras/drone/drone0" SET Transform localPosition (0.5451290965893281 0.690869074598375 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6786415712485337 1.232191866242345 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 19 -17)
"cameras/drone/drone0" SET Transform localScale (1.1438483452603943 1.1438483452603943 1.1438483452603943)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -5 -6)
"cameras/drone/drone1" SET Transform localScale (1.0922430467752 1.0922430467752 1.0922430467752)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.95512868197096 0)
"cameras" SET Transform eulerAngles (-18.96898119614552 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0948199946457726
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.790967318083128
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17935758586638195
"cameras/drone/drone0" SET Transform localPosition (0.7534322412573318 -0.05842632140016285 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.07907244108065248 1.2277481192731345 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -18 -10)
"cameras/drone/drone0" SET Transform localScale (0.6494230531507542 0.6494230531507542 0.6494230531507542)
"cameras/drone/drone1" SET Transform localEulerAngles (1 11 19)
"cameras/drone/drone1" SET Transform localScale (1.2013881812814637 1.2013881812814637 1.2013881812814637)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9835472479608427 0)
"cameras" SET Transform eulerAngles (11.65014796519062 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0470003019854612
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6491875599634571
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.28083876805337127
"cameras/drone/drone0" SET Transform localPosition (-0.6850259293553892 0.2474601107644418 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5677077836760474 0.9298870432893347 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 7 14)
"cameras/drone/drone0" SET Transform localScale (1.4688196333188803 1.4688196333188803 1.4688196333188803)
"cameras/drone/drone1" SET Transform localEulerAngles (-14 -12 15)
"cameras/drone/drone1" SET Transform localScale (1.2331153137594364 1.2331153137594364 1.2331153137594364)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.659602085670552 0)
"cameras" SET Transform eulerAngles (-8.687863981728663 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8998194497758734
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4012461717705014
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3987353443662336
"cameras/drone/drone0" SET Transform localPosition (-0.645852860322161 0.006942231445143665 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2908147993664474 0.8979902201251326 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 11 -17)
"cameras/drone/drone0" SET Transform localScale (1.020246522896461 1.020246522896461 1.020246522896461)
"cameras/drone/drone1" SET Transform localEulerAngles (3 3 3)
"cameras/drone/drone1" SET Transform localScale (0.8262270206976174 0.8262270206976174 0.8262270206976174)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0517535560225815 0)
"cameras" SET Transform eulerAngles (18.061836496617573 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0647869927226417
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.876968555522191
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1717045509340938
"cameras/drone/drone0" SET Transform localPosition (0.1287738342982756 0.6918953297434307 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3186769853899326 0.9029104453760777 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 7 -4)
"cameras/drone/drone0" SET Transform localScale (0.7681695225267191 0.7681695225267191 0.7681695225267191)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -14 -12)
"cameras/drone/drone1" SET Transform localScale (0.6337689733933026 0.6337689733933026 0.6337689733933026)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.965771727616633 0)
"cameras" SET Transform eulerAngles (-14.693929090561717 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.178852423936341
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1976167567902918
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09963885919157747
"cameras/drone/drone0" SET Transform localPosition (0.9863435495290507 0.23194434573556572 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9431704223946549 0.9267398631117092 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -5 18)
"cameras/drone/drone0" SET Transform localScale (1.1193963891280092 1.1193963891280092 1.1193963891280092)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -10 -15)
"cameras/drone/drone1" SET Transform localScale (1.4055990852228375 1.4055990852228375 1.4055990852228375)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.84026842138244 0)
"cameras" SET Transform eulerAngles (10.123054781886182 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6011452770347651
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1603039971870515
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1707150830855929
"cameras/drone/drone0" SET Transform localPosition (0.42488070335778083 0.07012465409396379 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6777759263856278 1.1352965143337306 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 13 -5)
"cameras/drone/drone0" SET Transform localScale (1.1793926969665416 1.1793926969665416 1.1793926969665416)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -9 -4)
"cameras/drone/drone1" SET Transform localScale (0.9969748869179741 0.9969748869179741 0.9969748869179741)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6376910916676835 0)
"cameras" SET Transform eulerAngles (-12.379627686032176 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6841385228542121
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2657806677506787
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17049914258547383
"cameras/drone/drone0" SET Transform localPosition (0.20457147177063906 -0.16477821657335207 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9544159594464052 1.0289963574101562 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-8 10 0)
"cameras/drone/drone0" SET Transform localScale (1.1826482902514015 1.1826482902514015 1.1826482902514015)
"cameras/drone/drone1" SET Transform localEulerAngles (1 8 4)
"cameras/drone/drone1" SET Transform localScale (1.1228066519332338 1.1228066519332338 1.1228066519332338)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.3966224239198075 0)
"cameras" SET Transform eulerAngles (-7.221959774459478 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.444870154193942
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5566764023065391
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2258890184774785
"cameras/drone/drone0" SET Transform localPosition (1.040941571188173 0.34069794406526105 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2702050674861005 1.0646009218060835 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -13 -7)
"cameras/drone/drone0" SET Transform localScale (0.6076851125110188 0.6076851125110188 0.6076851125110188)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -7 13)
"cameras/drone/drone1" SET Transform localScale (0.6916165960402358 0.6916165960402358 0.6916165960402358)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.005433952118338 0)
"cameras" SET Transform eulerAngles (7.9388135473140835 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1430722153945587
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3592104781052368
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11964386424807177
"cameras/drone/drone0" SET Transform localPosition (1.1536102022618209 0.6542658683113522 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3141183679317032 0.9361701466036242 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 5 -3)
"cameras/drone/drone0" SET Transform localScale (0.8259795260689013 0.8259795260689013 0.8259795260689013)
"cameras/drone/drone1" SET Transform localEulerAngles (3 6 9)
"cameras/drone/drone1" SET Transform localScale (0.6200292255964446 0.6200292255964446 0.6200292255964446)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.867104804382728 0)
"cameras" SET Transform eulerAngles (11.052934137195809 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.141657248244051
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0877308659735496
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10883519746101902
"cameras/drone/drone0" SET Transform localPosition (1.119127355624358 0.3238997055701807 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.20745919074517039 1.1688761229078486 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 15 -19)
"cameras/drone/drone0" SET Transform localScale (1.1294156557898656 1.1294156557898656 1.1294156557898656)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 15 14)
"cameras/drone/drone1" SET Transform localScale (0.8656566412254856 0.8656566412254856 0.8656566412254856)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.24452164692488 0)
"cameras" SET Transform eulerAngles (-3.755357852148265 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1344036403099103
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2097258456772428
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07063887770223136
"cameras/drone/drone0" SET Transform localPosition (1.0634298284441008 0.023802656386156695 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.36477093992435183 1.115142194257408 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 13 5)
"cameras/drone/drone0" SET Transform localScale (1.2802762899327702 1.2802762899327702 1.2802762899327702)
"cameras/drone/drone1" SET Transform localEulerAngles (13 10 -17)
"cameras/drone/drone1" SET Transform localScale (0.6448628972167805 0.6448628972167805 0.6448628972167805)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.800768538855333 0)
"cameras" SET Transform eulerAngles (-6.988755670966924 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8825411186874326
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.504502206344905
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27397289660001867
"cameras/drone/drone0" SET Transform localPosition (-0.20176327440957054 0.4129435693300491 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9175708086238885 1.2918976064260372 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 14 19)
"cameras/drone/drone0" SET Transform localScale (1.1723692079499337 1.1723692079499337 1.1723692079499337)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 18 -16)
"cameras/drone/drone1" SET Transform localScale (1.3721267740057361 1.3721267740057361 1.3721267740057361)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.4097200521797 0)
"cameras" SET Transform eulerAngles (-11.035936606126494 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4173593879042157
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4326478805500815
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.29571579154637345
"cameras/drone/drone0" SET Transform localPosition (-0.7475405381635762 0.06717860496842226 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3090529675087178 0.8097328973834508 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -7 5)
"cameras/drone/drone0" SET Transform localScale (0.9442150897566279 0.9442150897566279 0.9442150897566279)
"cameras/drone/drone1" SET Transform localEulerAngles (14 13 -9)
"cameras/drone/drone1" SET Transform localScale (1.3774393100362268 1.3774393100362268 1.3774393100362268)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.073880688383399 0)
"cameras" SET Transform eulerAngles (3.145438725446361 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3084166909658639
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9113635865535167
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20728389782262427
"cameras/drone/drone0" SET Transform localPosition (-1.1897176195084005 0.09907001534701082 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.23170775293585488 1.287207593857824 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 17 9)
"cameras/drone/drone0" SET Transform localScale (1.238072040522393 1.238072040522393 1.238072040522393)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -2 5)
"cameras/drone/drone1" SET Transform localScale (0.7988690475799175 0.7988690475799175 0.7988690475799175)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3779347457380293 0)
"cameras" SET Transform eulerAngles (19.376590901211436 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3598283531430386
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0115582495044766
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07935479823204444
"cameras/drone/drone0" SET Transform localPosition (0.30690168568402365 0.4352083668375088 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4583125161400199 1.1279614288218143 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 15 16)
"cameras/drone/drone0" SET Transform localScale (0.7448340865765493 0.7448340865765493 0.7448340865765493)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -18 -18)
"cameras/drone/drone1" SET Transform localScale (1.4058254169421982 1.4058254169421982 1.4058254169421982)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7227177450188904 0)
"cameras" SET Transform eulerAngles (16.352548454051004 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.469031352796308
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8919551317895869
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16172007699469845
"cameras/drone/drone0" SET Transform localPosition (-0.7795767590250549 0.6096298619730254 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0708284505315315 1.1888535563775795 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -11 -13)
"cameras/drone/drone0" SET Transform localScale (0.7542300832645309 0.7542300832645309 0.7542300832645309)
"cameras/drone/drone1" SET Transform localEulerAngles (1 1 -12)
"cameras/drone/drone1" SET Transform localScale (0.843431886345033 0.843431886345033 0.843431886345033)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.961219763434158 0)
"cameras" SET Transform eulerAngles (-2.3938052372038356 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9863757021946679
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6841739419888044
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.061376679913998804
"cameras/drone/drone0" SET Transform localPosition (-0.25392601761717737 -0.2620653368689128 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4398089271626785 1.238074383811651 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 -6 -17)
"cameras/drone/drone0" SET Transform localScale (0.9224126961660228 0.9224126961660228 0.9224126961660228)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -6 9)
"cameras/drone/drone1" SET Transform localScale (0.8066517073168388 0.8066517073168388 0.8066517073168388)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.30795517294574 0)
"cameras" SET Transform eulerAngles (-4.002859797501328 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1174682196881403
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6276037377804982
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16059397666026595
"cameras/drone/drone0" SET Transform localPosition (0.6286306383562033 0.003629709586726426 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.637982131722511 1.128072170708538 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -19 3)
"cameras/drone/drone0" SET Transform localScale (0.9475298553097242 0.9475298553097242 0.9475298553097242)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -2 16)
"cameras/drone/drone1" SET Transform localScale (0.8372870313410772 0.8372870313410772 0.8372870313410772)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5935509914732595 0)
"cameras" SET Transform eulerAngles (13.131839507334803 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6747758458236282
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8717953963353129
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34507577359436503
"cameras/drone/drone0" SET Transform localPosition (-0.5604394160049437 -0.12608402975454275 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.2514871093758353 0.8627618288162274 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 2 -15)
"cameras/drone/drone0" SET Transform localScale (0.9903704496893414 0.9903704496893414 0.9903704496893414)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -8 -17)
"cameras/drone/drone1" SET Transform localScale (1.0351849621340727 1.0351849621340727 1.0351849621340727)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.60234605270933 0)
"cameras" SET Transform eulerAngles (-14.97571045602423 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7897485383700491
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.088519021697742
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.028088351731788832
"cameras/drone/drone0" SET Transform localPosition (-0.6401866639454746 -0.26324715447124675 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.25786957440834746 0.9934065834618292 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 8 18)
"cameras/drone/drone0" SET Transform localScale (0.8621712617413388 0.8621712617413388 0.8621712617413388)
"cameras/drone/drone1" SET Transform localEulerAngles (8 -9 0)
"cameras/drone/drone1" SET Transform localScale (0.7319673762157297 0.7319673762157297 0.7319673762157297)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2680262294865328 0)
"cameras" SET Transform eulerAngles (-7.8660872891041365 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.164938936031985
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1719594124854789
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04824757217431008
"cameras/drone/drone0" SET Transform localPosition (-0.11003011117233275 0.32460768377291244 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8124451121912915 1.0927307344371364 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 7 0)
"cameras/drone/drone0" SET Transform localScale (1.0285742208891564 1.0285742208891564 1.0285742208891564)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 13 -6)
"cameras/drone/drone1" SET Transform localScale (0.7795764218335436 0.7795764218335436 0.7795764218335436)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.223219421277173 0)
"cameras" SET Transform eulerAngles (-8.342837687378587 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8370575572502861
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.854660897424819
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18133284431086408
"cameras/drone/drone0" SET Transform localPosition (0.4288769640738215 0.5734421955145224 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0966046057788812 1.0408204961787644 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 0 9)
"cameras/drone/drone0" SET Transform localScale (1.1461003365157283 1.1461003365157283 1.1461003365157283)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -1 -2)
"cameras/drone/drone1" SET Transform localScale (0.951470299175784 0.951470299175784 0.951470299175784)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1166985318366462 0)
"cameras" SET Transform eulerAngles (4.047276279497055 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8248190354477171
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3802593836673394
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2946055289748634
"cameras/drone/drone0" SET Transform localPosition (1.0543250505721742 0.058581560908632924 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6279235024534077 0.9351996757226375 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -1 0)
"cameras/drone/drone0" SET Transform localScale (0.6846633832913595 0.6846633832913595 0.6846633832913595)
"cameras/drone/drone1" SET Transform localEulerAngles (0 10 2)
"cameras/drone/drone1" SET Transform localScale (0.7422772939478819 0.7422772939478819 0.7422772939478819)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.212609288053227 0)
"cameras" SET Transform eulerAngles (-9.47740559745219 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.47356161176655215
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9877392646263299
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.031427613858734695
"cameras/drone/drone0" SET Transform localPosition (1.0141071999789613 -0.29759908544539476 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.12038651129709099 1.2102821321773407 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 -18 -2)
"cameras/drone/drone0" SET Transform localScale (1.150675763616401 1.150675763616401 1.150675763616401)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -3 19)
"cameras/drone/drone1" SET Transform localScale (1.1147534446943475 1.1147534446943475 1.1147534446943475)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.281972624067041 0)
"cameras" SET Transform eulerAngles (18.41215578122862 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1349641620732616
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.582988268036734
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03300535387531816
"cameras/drone/drone0" SET Transform localPosition (-0.7953922189109204 0.6330794051177351 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.12252395850058706 0.9317164213899729 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 9 0)
"cameras/drone/drone0" SET Transform localScale (1.0204295127236862 1.0204295127236862 1.0204295127236862)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -20 -16)
"cameras/drone/drone1" SET Transform localScale (0.8928535180349326 0.8928535180349326 0.8928535180349326)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9654066198101687 0)
"cameras" SET Transform eulerAngles (6.200996997212481 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.572178790723688
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8154658012535454
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18185294449471825
"cameras/drone/drone0" SET Transform localPosition (0.545202827897443 -0.2928325188005592 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1443374459325317 0.861392639990479 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -20 20)
"cameras/drone/drone0" SET Transform localScale (1.0538259308979652 1.0538259308979652 1.0538259308979652)
"cameras/drone/drone1" SET Transform localEulerAngles (12 -14 0)
"cameras/drone/drone1" SET Transform localScale (1.0099669777568874 1.0099669777568874 1.0099669777568874)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.785146935676416 0)
"cameras" SET Transform eulerAngles (-19.793564182035976 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4926494244709358
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4273394737727667
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17825499814458556
"cameras/drone/drone0" SET Transform localPosition (0.7386505828177705 0.3791811320716047 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9790966174662377 1.2982899774296268 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 15 -14)
"cameras/drone/drone0" SET Transform localScale (0.8554971945394754 0.8554971945394754 0.8554971945394754)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 12 13)
"cameras/drone/drone1" SET Transform localScale (1.0804476206809959 1.0804476206809959 1.0804476206809959)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.530470781732025 0)
"cameras" SET Transform eulerAngles (-6.641353142865469 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3411391643202986
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9642793349763167
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39615845849188047
"cameras/drone/drone0" SET Transform localPosition (1.0404786482628257 0.46828410662301984 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.054894444095759 0.9199658139178118 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 13 -6)
"cameras/drone/drone0" SET Transform localScale (1.0830232986473303 1.0830232986473303 1.0830232986473303)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -13 -16)
"cameras/drone/drone1" SET Transform localScale (0.7663652004072969 0.7663652004072969 0.7663652004072969)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4825117933455174 0)
"cameras" SET Transform eulerAngles (-8.947029936907022 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0334681886827162
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7879305959457237
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1894912958156578
"cameras/drone/drone0" SET Transform localPosition (-0.8057306587637174 0.40409090630817973 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.05398918368150207 1.24757067351923 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -18 3)
"cameras/drone/drone0" SET Transform localScale (1.0499427536303414 1.0499427536303414 1.0499427536303414)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -2 -15)
"cameras/drone/drone1" SET Transform localScale (0.9706327174801586 0.9706327174801586 0.9706327174801586)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.403361947435524 0)
"cameras" SET Transform eulerAngles (-12.524726519655779 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1521389328827611
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4315221787441277
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.32238263076908136
"cameras/drone/drone0" SET Transform localPosition (-0.81483808106077 0.4970204399083675 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0782914177362295 1.0889655547453603 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -9 -6)
"cameras/drone/drone0" SET Transform localScale (0.8221049367911951 0.8221049367911951 0.8221049367911951)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -7 13)
"cameras/drone/drone1" SET Transform localScale (1.285508728941469 1.285508728941469 1.285508728941469)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.333536563858414 0)
"cameras" SET Transform eulerAngles (-13.735824157161014 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3895467348149646
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7470232843603664
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3387012841972524
"cameras/drone/drone0" SET Transform localPosition (0.5114736481034672 0.6200092247052238 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5037606293245545 0.8348553089982393 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -5 14)
"cameras/drone/drone0" SET Transform localScale (0.6148777250468207 0.6148777250468207 0.6148777250468207)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 16 18)
"cameras/drone/drone1" SET Transform localScale (0.899806858521954 0.899806858521954 0.899806858521954)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.704549881170056 0)
"cameras" SET Transform eulerAngles (-0.29771835832388405 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0116885134846394
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.342669166423131
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3592248965960916
"cameras/drone/drone0" SET Transform localPosition (0.6650652035116524 0.19765059752951514 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.19728078257156745 1.0210387291801213 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -7 -3)
"cameras/drone/drone0" SET Transform localScale (1.4341409309931321 1.4341409309931321 1.4341409309931321)
"cameras/drone/drone1" SET Transform localEulerAngles (-11 0 -3)
"cameras/drone/drone1" SET Transform localScale (1.149031805972339 1.149031805972339 1.149031805972339)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6617067608602305 0)
"cameras" SET Transform eulerAngles (17.858163517477912 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4272641275724147
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8138028368018082
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39002887441713185
"cameras/drone/drone0" SET Transform localPosition (0.22170513804264513 0.5626035152522499 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8138982755143538 0.807838861979228 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -14 -16)
"cameras/drone/drone0" SET Transform localScale (0.8995290561461942 0.8995290561461942 0.8995290561461942)
"cameras/drone/drone1" SET Transform localEulerAngles (20 -9 6)
"cameras/drone/drone1" SET Transform localScale (1.0291872235225035 1.0291872235225035 1.0291872235225035)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7584071521303617 0)
"cameras" SET Transform eulerAngles (-0.5671154468952508 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.314452189344633
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9122107059355479
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3702497020288982
"cameras/drone/drone0" SET Transform localPosition (0.1475524878789165 -0.1970609799778668 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1135975682669417 1.2487499562761928 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 14 12)
"cameras/drone/drone0" SET Transform localScale (1.2432864936949455 1.2432864936949455 1.2432864936949455)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -18 14)
"cameras/drone/drone1" SET Transform localScale (1.1290965259915464 1.1290965259915464 1.1290965259915464)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.153916531951244 0)
"cameras" SET Transform eulerAngles (-18.637329322003332 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7231170254093235
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5671839000251622
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16948396451012335
"cameras/drone/drone0" SET Transform localPosition (0.8468475104289215 0.5198152787746628 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.34748425917967596 0.931496935257552 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 10 18)
"cameras/drone/drone0" SET Transform localScale (0.9780804432087626 0.9780804432087626 0.9780804432087626)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -7 -7)
"cameras/drone/drone1" SET Transform localScale (1.3384634976305883 1.3384634976305883 1.3384634976305883)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.344404430971993 0)
"cameras" SET Transform eulerAngles (-11.303297370046263 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7924619567064219
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9316492604883573
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12897692097010421
"cameras/drone/drone0" SET Transform localPosition (-0.24774613559794523 0.5185971039221762 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9370584822762031 1.2090282979561524 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -8 -11)
"cameras/drone/drone0" SET Transform localScale (1.2994349183699443 1.2994349183699443 1.2994349183699443)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -5 11)
"cameras/drone/drone1" SET Transform localScale (1.1444416563367779 1.1444416563367779 1.1444416563367779)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8475850495271677 0)
"cameras" SET Transform eulerAngles (-13.542341691571496 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8130701335292069
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.671117202381024
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.055279136614186264
"cameras/drone/drone0" SET Transform localPosition (0.7540336903845855 -0.1585478103487727 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7743570217850189 1.0987912539064992 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -13 17)
"cameras/drone/drone0" SET Transform localScale (0.9495513118086893 0.9495513118086893 0.9495513118086893)
"cameras/drone/drone1" SET Transform localEulerAngles (8 14 -13)
"cameras/drone/drone1" SET Transform localScale (1.1691046484955108 1.1691046484955108 1.1691046484955108)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.39031209163639 0)
"cameras" SET Transform eulerAngles (3.691557573199816 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0460152060693226
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3205907276832123
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2228159731675258
"cameras/drone/drone0" SET Transform localPosition (-0.7127626599601442 0.4724731839080007 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0274741622947003 1.2113028030209758 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 20 -4)
"cameras/drone/drone0" SET Transform localScale (0.8435876114641545 0.8435876114641545 0.8435876114641545)
"cameras/drone/drone1" SET Transform localEulerAngles (0 6 4)
"cameras/drone/drone1" SET Transform localScale (1.0442399141385597 1.0442399141385597 1.0442399141385597)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.9382948058378147 0)
"cameras" SET Transform eulerAngles (17.48666716822855 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0059021904439036
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9447898159967486
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34631141380276026
"cameras/drone/drone0" SET Transform localPosition (-0.1597500374626608 -0.07629932931497957 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0840503233810832 1.2625630515307766 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -15 10)
"cameras/drone/drone0" SET Transform localScale (1.3687397205948737 1.3687397205948737 1.3687397205948737)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -5 -16)
"cameras/drone/drone1" SET Transform localScale (1.0897984486334626 1.0897984486334626 1.0897984486334626)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3389250060755993 0)
"cameras" SET Transform eulerAngles (5.202574208246951 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9521937764505917
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.562611928356393
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19286101832643132
"cameras/drone/drone0" SET Transform localPosition (1.0185410952522973 0.11737026334947093 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.857409713993776 1.2995080141443838 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (17 -14 3)
"cameras/drone/drone0" SET Transform localScale (1.3263817796114075 1.3263817796114075 1.3263817796114075)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -7 2)
"cameras/drone/drone1" SET Transform localScale (0.8467682863559413 0.8467682863559413 0.8467682863559413)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.630655238034377 0)
"cameras" SET Transform eulerAngles (-4.579114535277116 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1743603979396577
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2004004511250508
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.36254117771756983
"cameras/drone/drone0" SET Transform localPosition (1.151869420837606 -0.1185525137942996 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7048781230640053 1.0321294951272253 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 7 8)
"cameras/drone/drone0" SET Transform localScale (1.3144128775652733 1.3144128775652733 1.3144128775652733)
"cameras/drone/drone1" SET Transform localEulerAngles (17 4 8)
"cameras/drone/drone1" SET Transform localScale (0.9424645675387233 0.9424645675387233 0.9424645675387233)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.962532082802804 0)
"cameras" SET Transform eulerAngles (6.111457148915747 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0180763498553067
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8344985777811484
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3857226336737365
"cameras/drone/drone0" SET Transform localPosition (-0.14224062702175289 0.4200893128524181 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1291234504088956 1.1755732565807755 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 20 4)
"cameras/drone/drone0" SET Transform localScale (0.8462325793756476 0.8462325793756476 0.8462325793756476)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -18 -1)
"cameras/drone/drone1" SET Transform localScale (0.6602838264598511 0.6602838264598511 0.6602838264598511)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.541572353275529 0)
"cameras" SET Transform eulerAngles (-12.838899569821528 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6420482242218136
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2135279224198718
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13258277084610387
"cameras/drone/drone0" SET Transform localPosition (-0.47962936044657944 0.12626144096065312 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6705464065031534 0.982951184525211 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 5 18)
"cameras/drone/drone0" SET Transform localScale (1.1402294420098413 1.1402294420098413 1.1402294420098413)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -15 -4)
"cameras/drone/drone1" SET Transform localScale (0.8254430236228208 0.8254430236228208 0.8254430236228208)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.639047503970453 0)
"cameras" SET Transform eulerAngles (-5.928972507055805 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5932453040301033
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.751760325790365
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12999991390193344
"cameras/drone/drone0" SET Transform localPosition (0.3767154278479732 0.6457427911275933 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6658997697079589 1.0668762708514397 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 8 -16)
"cameras/drone/drone0" SET Transform localScale (0.6322692644721035 0.6322692644721035 0.6322692644721035)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -3 15)
"cameras/drone/drone1" SET Transform localScale (0.7477837968003058 0.7477837968003058 0.7477837968003058)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.085449644588448 0)
"cameras" SET Transform eulerAngles (-2.33991854004892 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.418486767005165
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9723399049191501
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1800112808863001
"cameras/drone/drone0" SET Transform localPosition (-0.34113105958887535 -0.20335822126848463 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8091826436548437 0.8444036549013161 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 11 -12)
"cameras/drone/drone0" SET Transform localScale (1.3872561196286672 1.3872561196286672 1.3872561196286672)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -6 -2)
"cameras/drone/drone1" SET Transform localScale (1.0818587723516222 1.0818587723516222 1.0818587723516222)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5627764454722186 0)
"cameras" SET Transform eulerAngles (5.358092328083998 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6056414138377185
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0500118097991977
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08555879309900938
"cameras/drone/drone0" SET Transform localPosition (-0.8646962836768156 -0.16548467158665753 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5147868331788334 1.2817084239518337 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 4 1)
"cameras/drone/drone0" SET Transform localScale (1.4274346169890693 1.4274346169890693 1.4274346169890693)
"cameras/drone/drone1" SET Transform localEulerAngles (12 20 -10)
"cameras/drone/drone1" SET Transform localScale (0.9381767927596187 0.9381767927596187 0.9381767927596187)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.62036741429084 0)
"cameras" SET Transform eulerAngles (-2.1433458409287276 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5899219049392227
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3308939417288304
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14100679955199857
"cameras/drone/drone0" SET Transform localPosition (0.39185236571799953 0.6459520851089373 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5746991293813228 1.2871290806375266 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -17 -10)
"cameras/drone/drone0" SET Transform localScale (1.2591068354511101 1.2591068354511101 1.2591068354511101)
"cameras/drone/drone1" SET Transform localEulerAngles (15 6 9)
"cameras/drone/drone1" SET Transform localScale (0.7997260856408204 0.7997260856408204 0.7997260856408204)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1546353835349876 0)
"cameras" SET Transform eulerAngles (12.71292295622321 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1496119076663245
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.025467639662379
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.022237358096305872
"cameras/drone/drone0" SET Transform localPosition (0.9334812875546448 0.24678029840975485 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7187291582597186 1.1905421898340907 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -2 18)
"cameras/drone/drone0" SET Transform localScale (1.3506727351465777 1.3506727351465777 1.3506727351465777)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -15 -16)
"cameras/drone/drone1" SET Transform localScale (1.1533822270606118 1.1533822270606118 1.1533822270606118)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1822123664774926 0)
"cameras" SET Transform eulerAngles (-7.047924132124352 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.231440257960084
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5490634635834897
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2819205319190881
"cameras/drone/drone0" SET Transform localPosition (0.16099602206767294 0.6458216436517223 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7836512257931896 1.1209127090746862 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 11 7)
"cameras/drone/drone0" SET Transform localScale (1.123545158902077 1.123545158902077 1.123545158902077)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -7 -17)
"cameras/drone/drone1" SET Transform localScale (1.2175731917190695 1.2175731917190695 1.2175731917190695)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.485450136062015 0)
"cameras" SET Transform eulerAngles (12.75671440809623 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9074396339321862
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6488202386900868
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11308599599762954
"cameras/drone/drone0" SET Transform localPosition (1.0991486810954372 0.10877224083706555 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3347071108858062 0.8329477816485578 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 20 6)
"cameras/drone/drone0" SET Transform localScale (1.0528690896848167 1.0528690896848167 1.0528690896848167)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -12 14)
"cameras/drone/drone1" SET Transform localScale (1.0081616803557585 1.0081616803557585 1.0081616803557585)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0556837691305043 0)
"cameras" SET Transform eulerAngles (-10.5148596429629 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1557971614339273
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4735917360382649
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07607053297332614
"cameras/drone/drone0" SET Transform localPosition (-0.6654272738305081 0.35576867508677396 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6770206903352417 1.077836345380121 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 0 16)
"cameras/drone/drone0" SET Transform localScale (0.6566683013793108 0.6566683013793108 0.6566683013793108)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 1 13)
"cameras/drone/drone1" SET Transform localScale (0.9125544858936796 0.9125544858936796 0.9125544858936796)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.91214604578593 0)
"cameras" SET Transform eulerAngles (15.177919930930713 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6367799252047455
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9901956069970096
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13374837124961333
"cameras/drone/drone0" SET Transform localPosition (0.27287968515271266 0.4077689125393124 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.192045513979895 1.0569507608808617 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -16 -14)
"cameras/drone/drone0" SET Transform localScale (1.2686913343177793 1.2686913343177793 1.2686913343177793)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -19 5)
"cameras/drone/drone1" SET Transform localScale (0.9243878977804106 0.9243878977804106 0.9243878977804106)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6377518556440327 0)
"cameras" SET Transform eulerAngles (-1.0662639877135476 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5784402687099908
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7187375095929331
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15037202223588017
"cameras/drone/drone0" SET Transform localPosition (0.9179716385392014 0.5178920382282657 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.865590618550695 0.890471973775093 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -11 -11)
"cameras/drone/drone0" SET Transform localScale (0.9468052162878555 0.9468052162878555 0.9468052162878555)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 13 17)
"cameras/drone/drone1" SET Transform localScale (0.7116268986594232 0.7116268986594232 0.7116268986594232)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.834253916267118 0)
"cameras" SET Transform eulerAngles (16.016478717678446 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.801110608753022
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6583551825836116
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2254693727211767
"cameras/drone/drone0" SET Transform localPosition (-1.093083288193094 0.3928181351344145 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4306274269239885 1.158129522180252 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -5 19)
"cameras/drone/drone0" SET Transform localScale (1.1232676857019745 1.1232676857019745 1.1232676857019745)
"cameras/drone/drone1" SET Transform localEulerAngles (20 2 -5)
"cameras/drone/drone1" SET Transform localScale (1.3127643395770823 1.3127643395770823 1.3127643395770823)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1545041753006533 0)
"cameras" SET Transform eulerAngles (-14.488178949012958 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7338798916063414
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3834176470255704
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.31566734219459325
"cameras/drone/drone0" SET Transform localPosition (0.9817476179687878 0.4074792207100469 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.19437823874057192 0.9551062855821733 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -2 -4)
"cameras/drone/drone0" SET Transform localScale (0.8383182605914248 0.8383182605914248 0.8383182605914248)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -16 -1)
"cameras/drone/drone1" SET Transform localScale (1.2901284138571207 1.2901284138571207 1.2901284138571207)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.847194409073682 0)
"cameras" SET Transform eulerAngles (-11.37289729744175 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.410391046092069
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1007903821647838
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3551519352020445
"cameras/drone/drone0" SET Transform localPosition (-0.7833075823207554 0.25269196679518563 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.149954149681477 0.8539520023529882 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 8 -12)
"cameras/drone/drone0" SET Transform localScale (1.0266033182730148 1.0266033182730148 1.0266033182730148)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -11 -9)
"cameras/drone/drone1" SET Transform localScale (0.6921949565942662 0.6921949565942662 0.6921949565942662)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.406688449483121 0)
"cameras" SET Transform eulerAngles (-6.389683921230539 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2011490927845054
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.146844412563646
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02026719703754787
"cameras/drone/drone0" SET Transform localPosition (-0.3081031517364098 -0.21053713933224666 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9385222093032144 0.9482660319242551 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 16 -8)
"cameras/drone/drone0" SET Transform localScale (0.6339541643219356 0.6339541643219356 0.6339541643219356)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -4 2)
"cameras/drone/drone1" SET Transform localScale (1.2558113342881092 1.2558113342881092 1.2558113342881092)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.423751281161858 0)
"cameras" SET Transform eulerAngles (-7.508485198202299 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.302990045902982
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5557081250841058
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.005166792621422989
"cameras/drone/drone0" SET Transform localPosition (-0.7456943982534283 -0.25936260015825313 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.643697592046441 1.1785519148021726 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 -16 -17)
"cameras/drone/drone0" SET Transform localScale (0.7968266826122973 0.7968266826122973 0.7968266826122973)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -6 -6)
"cameras/drone/drone1" SET Transform localScale (1.2475881146063976 1.2475881146063976 1.2475881146063976)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8936876753326635 0)
"cameras" SET Transform eulerAngles (4.279820607696557 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1655518134064013
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0163100820090272
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04633268986505375
"cameras/drone/drone0" SET Transform localPosition (-0.8515072481351551 0.13933615035074637 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1732609185643657 1.2372654114124986 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 10 8)
"cameras/drone/drone0" SET Transform localScale (1.249020795531564 1.249020795531564 1.249020795531564)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -10 -6)
"cameras/drone/drone1" SET Transform localScale (1.260173891204341 1.260173891204341 1.260173891204341)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4933658469190183 0)
"cameras" SET Transform eulerAngles (-0.6846343057606106 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8518717944040343
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0309888331038901
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38092302193375827
"cameras/drone/drone0" SET Transform localPosition (0.873684312749728 0.6870683853813742 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.17149956753098206 0.8831659490899954 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -19 -11)
"cameras/drone/drone0" SET Transform localScale (0.9832024718606829 0.9832024718606829 0.9832024718606829)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -15 -15)
"cameras/drone/drone1" SET Transform localScale (1.3950462423882186 1.3950462423882186 1.3950462423882186)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7055710917385123 0)
"cameras" SET Transform eulerAngles (-9.27580126475933 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9401120296512858
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5414065877055196
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10267833602533122
"cameras/drone/drone0" SET Transform localPosition (-0.19065877150227606 -0.07359589906265701 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7637340027433848 1.0574982974120397 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -5 -7)
"cameras/drone/drone0" SET Transform localScale (1.3556966845065275 1.3556966845065275 1.3556966845065275)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -12 -18)
"cameras/drone/drone1" SET Transform localScale (0.7611352372844754 0.7611352372844754 0.7611352372844754)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2307270182848646 0)
"cameras" SET Transform eulerAngles (0.4758209057668523 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2681971670684884
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9962700231111907
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.160217806306438
"cameras/drone/drone0" SET Transform localPosition (-0.7248944963967252 0.11472005970122762 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8003197775506661 1.005323618559186 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 8 17)
"cameras/drone/drone0" SET Transform localScale (0.7080039994683271 0.7080039994683271 0.7080039994683271)
"cameras/drone/drone1" SET Transform localEulerAngles (0 9 20)
"cameras/drone/drone1" SET Transform localScale (1.3998021866789274 1.3998021866789274 1.3998021866789274)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.3895536729764935 0)
"cameras" SET Transform eulerAngles (5.386557924089651 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1555694667703134
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.68752205247168
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.02632550222423631
"cameras/drone/drone0" SET Transform localPosition (-0.17976263520432645 0.2916395527462166 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.45295672709551726 1.2231770822315757 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -15 -16)
"cameras/drone/drone0" SET Transform localScale (1.327122664718257 1.327122664718257 1.327122664718257)
"cameras/drone/drone1" SET Transform localEulerAngles (7 -14 4)
"cameras/drone/drone1" SET Transform localScale (0.9140980357950161 0.9140980357950161 0.9140980357950161)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.028528960114969 0)
"cameras" SET Transform eulerAngles (16.209187220251415 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9961428747354052
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.61363589545382
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22194238855917342
"cameras/drone/drone0" SET Transform localPosition (0.8890108534854224 0.6524395411039243 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4658123634097844 1.2039763761005893 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -1 -5)
"cameras/drone/drone0" SET Transform localScale (0.8547988815506435 0.8547988815506435 0.8547988815506435)
"cameras/drone/drone1" SET Transform localEulerAngles (8 14 -13)
"cameras/drone/drone1" SET Transform localScale (0.9907271693583978 0.9907271693583978 0.9907271693583978)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4222071996624646 0)
"cameras" SET Transform eulerAngles (-0.5921767339609083 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4013477730892219
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.968694384304947
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30749026136094293
"cameras/drone/drone0" SET Transform localPosition (-0.9647858921136385 0.019552506048313434 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4660221607353423 1.200087135609777 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 3 -4)
"cameras/drone/drone0" SET Transform localScale (0.9869899659516026 0.9869899659516026 0.9869899659516026)
"cameras/drone/drone1" SET Transform localEulerAngles (11 5 14)
"cameras/drone/drone1" SET Transform localScale (1.2510134357491625 1.2510134357491625 1.2510134357491625)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5229039950630243 0)
"cameras" SET Transform eulerAngles (-18.099045048537484 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5812515941097984
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.963754823994877
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2931968496567679
"cameras/drone/drone0" SET Transform localPosition (0.8044462752945643 0.28948846955814506 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9533198449013948 1.1495609566429443 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 -10 -20)
"cameras/drone/drone0" SET Transform localScale (1.4751937852286028 1.4751937852286028 1.4751937852286028)
"cameras/drone/drone1" SET Transform localEulerAngles (4 0 14)
"cameras/drone/drone1" SET Transform localScale (1.3154808598249508 1.3154808598249508 1.3154808598249508)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.679819757251806 0)
"cameras" SET Transform eulerAngles (-8.765371213507823 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.530672788707463
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7613257781685658
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38263730617663294
"cameras/drone/drone0" SET Transform localPosition (1.1068837648083758 -0.04671908697128385 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5872255478444606 1.2422632262336184 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 -10 9)
"cameras/drone/drone0" SET Transform localScale (1.1573810933038784 1.1573810933038784 1.1573810933038784)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -5 9)
"cameras/drone/drone1" SET Transform localScale (1.1334671227206221 1.1334671227206221 1.1334671227206221)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.241146005710696 0)
"cameras" SET Transform eulerAngles (-5.069826950240998 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5643770667110172
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.00458712598361
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09904675651857486
"cameras/drone/drone0" SET Transform localPosition (-0.12242593462041063 0.12901378064361063 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.32738315854326194 1.031760947187197 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 16 8)
"cameras/drone/drone0" SET Transform localScale (1.42899646644467 1.42899646644467 1.42899646644467)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -15 -18)
"cameras/drone/drone1" SET Transform localScale (1.196793832417354 1.196793832417354 1.196793832417354)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.850147049628435 0)
"cameras" SET Transform eulerAngles (14.352915067670608 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8749793305772008
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3541017806156619
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38542695499243784
"cameras/drone/drone0" SET Transform localPosition (-0.921670701443662 -0.28897313366584015 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6181121941928779 1.256342417622231 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 0 9)
"cameras/drone/drone0" SET Transform localScale (1.1680956140356864 1.1680956140356864 1.1680956140356864)
"cameras/drone/drone1" SET Transform localEulerAngles (20 11 -7)
"cameras/drone/drone1" SET Transform localScale (1.1897969800251702 1.1897969800251702 1.1897969800251702)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.084617833864572 0)
"cameras" SET Transform eulerAngles (-19.226824079075584 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0178960644315218
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2885976131506331
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2995510441356623
"cameras/drone/drone0" SET Transform localPosition (-0.1342027002407531 0.029003622313666877 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.13695808562404843 0.8884531761155614 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -12 11)
"cameras/drone/drone0" SET Transform localScale (0.9942953918187779 0.9942953918187779 0.9942953918187779)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -2 -3)
"cameras/drone/drone1" SET Transform localScale (0.9070944127075655 0.9070944127075655 0.9070944127075655)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.647630302039524 0)
"cameras" SET Transform eulerAngles (-7.226249925382149 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0585531067609963
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9364044841610331
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10805427235106535
"cameras/drone/drone0" SET Transform localPosition (0.4127349371261415 0.00331639811909773 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5676785986116172 1.271434145948346 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -2 14)
"cameras/drone/drone0" SET Transform localScale (0.6050189398424608 0.6050189398424608 0.6050189398424608)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 15 20)
"cameras/drone/drone1" SET Transform localScale (1.0225403112777356 1.0225403112777356 1.0225403112777356)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.167485816722317 0)
"cameras" SET Transform eulerAngles (-7.4771734412255775 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4520481752983183
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9397553777301328
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.18192372329617476
"cameras/drone/drone0" SET Transform localPosition (-0.5860408374107423 0.2866979189542373 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4951469942016602 0.8589612646757621 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -4 13)
"cameras/drone/drone0" SET Transform localScale (0.9156411469272748 0.9156411469272748 0.9156411469272748)
"cameras/drone/drone1" SET Transform localEulerAngles (12 4 14)
"cameras/drone/drone1" SET Transform localScale (1.1056315549377569 1.1056315549377569 1.1056315549377569)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.042053770905309 0)
"cameras" SET Transform eulerAngles (-15.716386726856864 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7169804000268538
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.946711254656747
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3696661378997913
"cameras/drone/drone0" SET Transform localPosition (0.16913436572624962 -0.22418864891957374 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.05225498658240846 1.1381196073738233 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 20 1)
"cameras/drone/drone0" SET Transform localScale (1.1285805419317034 1.1285805419317034 1.1285805419317034)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -7 -11)
"cameras/drone/drone1" SET Transform localScale (1.2935443746633308 1.2935443746633308 1.2935443746633308)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.804680252959054 0)
"cameras" SET Transform eulerAngles (8.036848300975443 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1893644919739716
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9713594027988245
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3252805889437129
"cameras/drone/drone0" SET Transform localPosition (0.7287493240804876 0.6975088176112871 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.1117769319945614 1.0375491633650757 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 -14 11)
"cameras/drone/drone0" SET Transform localScale (1.274941282010899 1.274941282010899 1.274941282010899)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 1 -3)
"cameras/drone/drone1" SET Transform localScale (1.0506384191517268 1.0506384191517268 1.0506384191517268)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2523476092082357 0)
"cameras" SET Transform eulerAngles (5.982397955656488 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8297274257892155
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.620155965310595
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3666382835781644
"cameras/drone/drone0" SET Transform localPosition (-0.44464722605497997 0.37714044264871033 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8952685014205903 1.173464717678503 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 -7 14)
"cameras/drone/drone0" SET Transform localScale (1.0388361984489867 1.0388361984489867 1.0388361984489867)
"cameras/drone/drone1" SET Transform localEulerAngles (11 -1 -16)
"cameras/drone/drone1" SET Transform localScale (1.3424612981856738 1.3424612981856738 1.3424612981856738)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.900866233602789 0)
"cameras" SET Transform eulerAngles (5.729594176498086 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4630323794152778
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2643426167231309
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12905523265827742
"cameras/drone/drone0" SET Transform localPosition (-0.4920891779148211 0.6417524449041301 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5553931823239364 0.9304451646523471 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (18 -10 20)
"cameras/drone/drone0" SET Transform localScale (1.2134353038380397 1.2134353038380397 1.2134353038380397)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -18 15)
"cameras/drone/drone1" SET Transform localScale (1.1509249716805434 1.1509249716805434 1.1509249716805434)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.814668945041044 0)
"cameras" SET Transform eulerAngles (-10.683818226807723 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3342100175929068
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9098357423971826
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2921209116268256
"cameras/drone/drone0" SET Transform localPosition (0.8742322380776681 0.5455187631349956 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.01696217427638036 1.215277620487564 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 7 15)
"cameras/drone/drone0" SET Transform localScale (1.4154338286182004 1.4154338286182004 1.4154338286182004)
"cameras/drone/drone1" SET Transform localEulerAngles (20 0 -10)
"cameras/drone/drone1" SET Transform localScale (1.4954337196943583 1.4954337196943583 1.4954337196943583)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.022614282654317 0)
"cameras" SET Transform eulerAngles (-15.574727334916645 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0067204832029941
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0506915519967868
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0035368317042892895
"cameras/drone/drone0" SET Transform localPosition (-1.1057093914601352 -0.15937428341334653 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1058320502990702 1.235836070036673 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 20 -20)
"cameras/drone/drone0" SET Transform localScale (0.7704069551148346 0.7704069551148346 0.7704069551148346)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 3 -20)
"cameras/drone/drone1" SET Transform localScale (0.6016747246135419 0.6016747246135419 0.6016747246135419)
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
"spawner/city/buildings" SET RandomProps.Torus innerRadius 86
"spawner/city/buildings" SET active false
"spawner/roadsigns" SET active false
"spawner/roadsigns" SET RandomProps.PropArea 0
"spawner/roadsigns" SET active false
"spawner/humans_0" SET active false
"spawner/humans_0" SET RandomProps.PropArea 0
"spawner/humans_0" SET active false
"cameras" SET Transform position (0 3.993889491909134 0)
"cameras" SET Transform eulerAngles (10.234819641020355 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8777491728160332
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2363991088083628
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11702675595844313
"cameras/drone/drone0" SET Transform localPosition (0.23608891195827875 -0.13981750929105102 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5830065847840222 1.0056398118731955 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 19 -10)
"cameras/drone/drone0" SET Transform localScale (1.1376615719883723 1.1376615719883723 1.1376615719883723)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -7 -16)
"cameras/drone/drone1" SET Transform localScale (0.7724702560834102 0.7724702560834102 0.7724702560834102)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6824078792758783 0)
"cameras" SET Transform eulerAngles (11.197739423793855 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5425277826126312
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9743835614784229
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39575479891653065
"cameras/drone/drone0" SET Transform localPosition (-0.9586871711175541 -0.19025244725310292 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0050292179540907 0.8459543686043179 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -6 -16)
"cameras/drone/drone0" SET Transform localScale (1.3075398820083668 1.3075398820083668 1.3075398820083668)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 -17 -15)
"cameras/drone/drone1" SET Transform localScale (0.6339261271079016 0.6339261271079016 0.6339261271079016)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.920330195545537 0)
"cameras" SET Transform eulerAngles (19.966247137475833 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1524694465185321
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0033327351141603
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27108398139232937
"cameras/drone/drone0" SET Transform localPosition (-0.7592414786999868 0.004116316288558297 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.13027343355432075 1.0122195073875826 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -6 -11)
"cameras/drone/drone0" SET Transform localScale (1.0125776970547138 1.0125776970547138 1.0125776970547138)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -8 8)
"cameras/drone/drone1" SET Transform localScale (1.1019458094703345 1.1019458094703345 1.1019458094703345)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7999572911402004 0)
"cameras" SET Transform eulerAngles (17.94659379858888 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5419001949362978
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.949848171805686
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39190185601862315
"cameras/drone/drone0" SET Transform localPosition (-0.5565765179749483 0.05513073985406264 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4262768863577189 0.9880225739894455 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-3 -13 15)
"cameras/drone/drone0" SET Transform localScale (0.8485346393613329 0.8485346393613329 0.8485346393613329)
"cameras/drone/drone1" SET Transform localEulerAngles (1 1 -20)
"cameras/drone/drone1" SET Transform localScale (1.1247975261225616 1.1247975261225616 1.1247975261225616)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.805615797155465 0)
"cameras" SET Transform eulerAngles (3.1113822904599253 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8306428012056937
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2496219465933063
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17345726573152964
"cameras/drone/drone0" SET Transform localPosition (-1.0012888976874814 -0.0036565050638432406 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9961894274524237 1.167340053661131 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 16 0)
"cameras/drone/drone0" SET Transform localScale (0.9980034923897927 0.9980034923897927 0.9980034923897927)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -12 8)
"cameras/drone/drone1" SET Transform localScale (0.9162364973564424 0.9162364973564424 0.9162364973564424)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8386100796731384 0)
"cameras" SET Transform eulerAngles (-1.2251869052300322 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6937484088087853
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7891338922075186
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3592749567880373
"cameras/drone/drone0" SET Transform localPosition (1.1679019661254715 0.025794300001783677 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.49012245045485914 1.1488846220806992 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 10 3)
"cameras/drone/drone0" SET Transform localScale (1.1023190460781476 1.1023190460781476 1.1023190460781476)
"cameras/drone/drone1" SET Transform localEulerAngles (-18 -2 -16)
"cameras/drone/drone1" SET Transform localScale (1.4907579109843474 1.4907579109843474 1.4907579109843474)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3847473041821714 0)
"cameras" SET Transform eulerAngles (0.1838468718254127 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5508215695778111
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9378819322464746
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2030410863868149
"cameras/drone/drone0" SET Transform localPosition (-0.6948539048228256 0.561610435928797 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5794176582153692 0.83971617859719 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 15 15)
"cameras/drone/drone0" SET Transform localScale (0.8927512786568943 0.8927512786568943 0.8927512786568943)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -5 -7)
"cameras/drone/drone1" SET Transform localScale (0.6679164478702102 0.6679164478702102 0.6679164478702102)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.669552965567316 0)
"cameras" SET Transform eulerAngles (1.6438176363156387 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8795035167534587
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0798821232603946
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.14222984941340022
"cameras/drone/drone0" SET Transform localPosition (-0.7288288111889489 0.3182592689753572 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.33995423046431006 0.9980397011032046 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -17 16)
"cameras/drone/drone0" SET Transform localScale (0.698445024719927 0.698445024719927 0.698445024719927)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 9 5)
"cameras/drone/drone1" SET Transform localScale (1.083606319328254 1.083606319328254 1.083606319328254)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.953155657307496 0)
"cameras" SET Transform eulerAngles (2.0532836697483035 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.370928326257049
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9453027411812043
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2975551497667032
"cameras/drone/drone0" SET Transform localPosition (0.39598957790674105 -0.03295967255711579 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.037363065885771096 0.8364293437732453 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 19 -11)
"cameras/drone/drone0" SET Transform localScale (0.8157042637804162 0.8157042637804162 0.8157042637804162)
"cameras/drone/drone1" SET Transform localEulerAngles (10 4 10)
"cameras/drone/drone1" SET Transform localScale (1.0842231640114888 1.0842231640114888 1.0842231640114888)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.931326499928508 0)
"cameras" SET Transform eulerAngles (7.291875425789986 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8741509953807112
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.959399273458443
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23349613963424407
"cameras/drone/drone0" SET Transform localPosition (0.4337478631987337 0.5473171811361897 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9622650620806692 1.1379475500308793 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 13 -14)
"cameras/drone/drone0" SET Transform localScale (1.1496545273125822 1.1496545273125822 1.1496545273125822)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -8 -5)
"cameras/drone/drone1" SET Transform localScale (1.2004347656399053 1.2004347656399053 1.2004347656399053)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3991189615872726 0)
"cameras" SET Transform eulerAngles (14.379256953106292 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9661979427015887
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7903578853625812
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16420074500929124
"cameras/drone/drone0" SET Transform localPosition (0.07732642154081892 0.20234175104754554 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7106945261449804 1.2656713300414326 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 3 15)
"cameras/drone/drone0" SET Transform localScale (1.188555750980098 1.188555750980098 1.188555750980098)
"cameras/drone/drone1" SET Transform localEulerAngles (8 17 9)
"cameras/drone/drone1" SET Transform localScale (0.7149023250348628 0.7149023250348628 0.7149023250348628)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.046742865385293 0)
"cameras" SET Transform eulerAngles (12.898705396497583 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0310748788303117
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.120386243013284
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19368976798894844
"cameras/drone/drone0" SET Transform localPosition (-0.4416421578881856 0.6951724610258248 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.11508114252708967 0.9910006048938425 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -1 18)
"cameras/drone/drone0" SET Transform localScale (1.2109163600310233 1.2109163600310233 1.2109163600310233)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 17 -19)
"cameras/drone/drone1" SET Transform localScale (0.7475914713497518 0.7475914713497518 0.7475914713497518)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.018971873457619 0)
"cameras" SET Transform eulerAngles (19.234776240655698 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1330232163843967
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4352875124985833
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3363617230537541
"cameras/drone/drone0" SET Transform localPosition (0.25207771479253105 0.28512649125270323 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2200021407761601 1.040514869543332 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 2 14)
"cameras/drone/drone0" SET Transform localScale (1.475261703814145 1.475261703814145 1.475261703814145)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -5 -7)
"cameras/drone/drone1" SET Transform localScale (1.070503358057422 1.070503358057422 1.070503358057422)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.873950275270968 0)
"cameras" SET Transform eulerAngles (10.599539426965599 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9962254758138575
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.801548559830933
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.015542049023862515
"cameras/drone/drone0" SET Transform localPosition (0.541194193250182 0.03983329477261782 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.40689661820709067 0.8208722494738396 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 -9 -9)
"cameras/drone/drone0" SET Transform localScale (0.9384038003793924 0.9384038003793924 0.9384038003793924)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -20 -9)
"cameras/drone/drone1" SET Transform localScale (0.9023062177882535 0.9023062177882535 0.9023062177882535)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5380301833190675 0)
"cameras" SET Transform eulerAngles (0.48437356701032996 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9301221163290051
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4851853300696227
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.005198771324782525
"cameras/drone/drone0" SET Transform localPosition (-1.0479099355811088 0.0339236164969387 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5947907518231901 1.0559689916041186 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 7 -17)
"cameras/drone/drone0" SET Transform localScale (0.6371763265779037 0.6371763265779037 0.6371763265779037)
"cameras/drone/drone1" SET Transform localEulerAngles (1 -5 14)
"cameras/drone/drone1" SET Transform localScale (0.6467131449206596 0.6467131449206596 0.6467131449206596)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.147164225939643 0)
"cameras" SET Transform eulerAngles (1.7616571682174111 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2138982386936785
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.817370764942424
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3462604538328882
"cameras/drone/drone0" SET Transform localPosition (1.1445241756165292 0.683334276831592 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6948993650009072 0.9138711578328429 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-9 -10 -8)
"cameras/drone/drone0" SET Transform localScale (0.8654338539761366 0.8654338539761366 0.8654338539761366)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 0 7)
"cameras/drone/drone1" SET Transform localScale (1.4705326869075694 1.4705326869075694 1.4705326869075694)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.682040699258312 0)
"cameras" SET Transform eulerAngles (-4.877452867811289 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6131189140403837
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9300299496408186
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.110222384657673
"cameras/drone/drone0" SET Transform localPosition (-0.13080463331376713 0.060514557418935244 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7602975096175779 0.8721226509190763 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 17 5)
"cameras/drone/drone0" SET Transform localScale (0.9316393996133865 0.9316393996133865 0.9316393996133865)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 18 -17)
"cameras/drone/drone1" SET Transform localScale (0.8010946387566992 0.8010946387566992 0.8010946387566992)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.01817426344281 0)
"cameras" SET Transform eulerAngles (-0.4802040815018387 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6800216349323549
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4809305920174702
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2980822768129076
"cameras/drone/drone0" SET Transform localPosition (-0.24781392287571835 -0.21344583030612402 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6431133048334046 1.1715386275321427 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -19 16)
"cameras/drone/drone0" SET Transform localScale (1.0067563324810234 1.0067563324810234 1.0067563324810234)
"cameras/drone/drone1" SET Transform localEulerAngles (8 6 18)
"cameras/drone/drone1" SET Transform localScale (0.8595652987298086 0.8595652987298086 0.8595652987298086)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.956276323195179 0)
"cameras" SET Transform eulerAngles (10.754118211447945 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7349825689329237
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1183660140239364
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.26462339052049205
"cameras/drone/drone0" SET Transform localPosition (0.3934101710265998 0.6609795836716827 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.141708419257842 0.8478160450646022 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -2 -6)
"cameras/drone/drone0" SET Transform localScale (0.8285526282974616 0.8285526282974616 0.8285526282974616)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -6 -17)
"cameras/drone/drone1" SET Transform localScale (1.0713049741652607 1.0713049741652607 1.0713049741652607)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.981178295391987 0)
"cameras" SET Transform eulerAngles (15.228818201018008 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4324253155411006
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0567194261999693
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.17329474858007635
"cameras/drone/drone0" SET Transform localPosition (0.508874515644645 0.019261402876051992 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7989084570818006 1.0296100753082407 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 12 -3)
"cameras/drone/drone0" SET Transform localScale (1.0597989524402285 1.0597989524402285 1.0597989524402285)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -10 -10)
"cameras/drone/drone1" SET Transform localScale (0.7392393403529113 0.7392393403529113 0.7392393403529113)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4964514074156083 0)
"cameras" SET Transform eulerAngles (14.67075605212979 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.895444703219826
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.940040857402638
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.15347707512780034
"cameras/drone/drone0" SET Transform localPosition (0.8231336914376441 0.5927452636699804 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0630362655309493 0.8636932060102736 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 16 20)
"cameras/drone/drone0" SET Transform localScale (0.8512373218639662 0.8512373218639662 0.8512373218639662)
"cameras/drone/drone1" SET Transform localEulerAngles (0 -15 6)
"cameras/drone/drone1" SET Transform localScale (1.459122733631827 1.459122733631827 1.459122733631827)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0942264772492845 0)
"cameras" SET Transform eulerAngles (13.833192132749083 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1733255482537084
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7315531579405556
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23578028686062186
"cameras/drone/drone0" SET Transform localPosition (0.6317580709770805 0.5643363506884136 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.35447731697645923 1.200410913083553 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 14 -2)
"cameras/drone/drone0" SET Transform localScale (1.3035748412025125 1.3035748412025125 1.3035748412025125)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -3 -7)
"cameras/drone/drone1" SET Transform localScale (0.9740282900636323 0.9740282900636323 0.9740282900636323)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.365813773124772 0)
"cameras" SET Transform eulerAngles (1.7775272558550057 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.412313628960677
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1266973714935546
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.029681456074220593
"cameras/drone/drone0" SET Transform localPosition (-0.09321942398853178 0.13187924757179553 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0421131116908124 1.2940332289131307 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 -11 -14)
"cameras/drone/drone0" SET Transform localScale (0.744122481421649 0.744122481421649 0.744122481421649)
"cameras/drone/drone1" SET Transform localEulerAngles (6 12 6)
"cameras/drone/drone1" SET Transform localScale (0.8330273912721152 0.8330273912721152 0.8330273912721152)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.221091722170653 0)
"cameras" SET Transform eulerAngles (-13.370397416501234 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7962078241555343
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7818111241222685
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.013654233906281378
"cameras/drone/drone0" SET Transform localPosition (0.7197790747333026 0.5353783761941422 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.09084061923448905 1.075769129128597 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 18 -6)
"cameras/drone/drone0" SET Transform localScale (1.030457279729764 1.030457279729764 1.030457279729764)
"cameras/drone/drone1" SET Transform localEulerAngles (14 13 -7)
"cameras/drone/drone1" SET Transform localScale (1.2070571616791688 1.2070571616791688 1.2070571616791688)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.355183713771536 0)
"cameras" SET Transform eulerAngles (7.0630429609966825 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0444973283044034
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8234242659524877
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37907634373838794
"cameras/drone/drone0" SET Transform localPosition (-0.6082521972122782 0.4480287578614311 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7946497104302652 1.2219198998364038 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 6 -2)
"cameras/drone/drone0" SET Transform localScale (1.1270568425274887 1.1270568425274887 1.1270568425274887)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -19 20)
"cameras/drone/drone1" SET Transform localScale (0.7254962255735942 0.7254962255735942 0.7254962255735942)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4916696900289534 0)
"cameras" SET Transform eulerAngles (-0.8711086699846575 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5610106511124547
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1882229658568406
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34077201610914654
"cameras/drone/drone0" SET Transform localPosition (-0.965994805165066 -0.1990691435549648 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.18339958982251203 0.90704079022275 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (2 14 15)
"cameras/drone/drone0" SET Transform localScale (0.6897631747031567 0.6897631747031567 0.6897631747031567)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 13 16)
"cameras/drone/drone1" SET Transform localScale (1.2693953333429047 1.2693953333429047 1.2693953333429047)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1242826744131857 0)
"cameras" SET Transform eulerAngles (11.821987238975119 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4463980979847402
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6328755686968701
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2686540729682587
"cameras/drone/drone0" SET Transform localPosition (0.37087218142262235 0.3483686111894297 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.49783733015031306 1.1570385637418499 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -9 3)
"cameras/drone/drone0" SET Transform localScale (1.008376519636673 1.008376519636673 1.008376519636673)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -5 -17)
"cameras/drone/drone1" SET Transform localScale (0.6859351794126918 0.6859351794126918 0.6859351794126918)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.114496902405416 0)
"cameras" SET Transform eulerAngles (15.83015765238941 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4719177604490545
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.860937690102908
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.27242194972158296
"cameras/drone/drone0" SET Transform localPosition (-0.6557317625605794 0.4702405852395077 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8812620341605177 0.9624233986398147 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 2 -12)
"cameras/drone/drone0" SET Transform localScale (1.3710145618092957 1.3710145618092957 1.3710145618092957)
"cameras/drone/drone1" SET Transform localEulerAngles (18 13 17)
"cameras/drone/drone1" SET Transform localScale (1.4707036914467093 1.4707036914467093 1.4707036914467093)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.569640029475958 0)
"cameras" SET Transform eulerAngles (7.514221015064141 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7921137498505864
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3343590680540096
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3320743525571401
"cameras/drone/drone0" SET Transform localPosition (0.36566077479339043 -0.08495024429326897 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.04396593990046482 0.850818320870673 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 3 -16)
"cameras/drone/drone0" SET Transform localScale (1.351879416725092 1.351879416725092 1.351879416725092)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -12 -18)
"cameras/drone/drone1" SET Transform localScale (1.431618352791181 1.431618352791181 1.431618352791181)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5244032410248822 0)
"cameras" SET Transform eulerAngles (2.5777914527177046 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4115575973258583
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1158786912818746
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.021320754882701822
"cameras/drone/drone0" SET Transform localPosition (-0.2549835931736437 0.04919085416732388 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.44286617266802375 0.9934973733067289 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 -9 -12)
"cameras/drone/drone0" SET Transform localScale (0.7914500656810156 0.7914500656810156 0.7914500656810156)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -4 -6)
"cameras/drone/drone1" SET Transform localScale (1.1544807209189365 1.1544807209189365 1.1544807209189365)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.1873774017325225 0)
"cameras" SET Transform eulerAngles (-9.710808235940398 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4429064801673368
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4649591818782706
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37722768788259003
"cameras/drone/drone0" SET Transform localPosition (0.40044959115457357 0.48670354931206045 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.81759081206153 1.1575055122965068 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 3 2)
"cameras/drone/drone0" SET Transform localScale (0.818011119833714 0.818011119833714 0.818011119833714)
"cameras/drone/drone1" SET Transform localEulerAngles (14 6 8)
"cameras/drone/drone1" SET Transform localScale (1.1606317159708486 1.1606317159708486 1.1606317159708486)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6593799497553463 0)
"cameras" SET Transform eulerAngles (11.413693445527361 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4571686088433171
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9600280022209392
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.35082110433217234
"cameras/drone/drone0" SET Transform localPosition (0.06968685812969122 0.3263153929381239 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7146589876180542 1.2917774949261167 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 11 17)
"cameras/drone/drone0" SET Transform localScale (1.2912361404189099 1.2912361404189099 1.2912361404189099)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 10 15)
"cameras/drone/drone1" SET Transform localScale (1.4159235505718666 1.4159235505718666 1.4159235505718666)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.870125113589084 0)
"cameras" SET Transform eulerAngles (-7.441259990045168 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.847912046926649
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0028038165119215
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21676625379468084
"cameras/drone/drone0" SET Transform localPosition (-0.6092006275531913 0.29999999435344854 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.12249777400056239 1.0813795960051658 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (10 17 -2)
"cameras/drone/drone0" SET Transform localScale (1.1562625882705346 1.1562625882705346 1.1562625882705346)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 13 -18)
"cameras/drone/drone1" SET Transform localScale (1.435378644136169 1.435378644136169 1.435378644136169)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5707656226521034 0)
"cameras" SET Transform eulerAngles (-16.704396267656215 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6530209041477804
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.230096333091827
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3721959527034954
"cameras/drone/drone0" SET Transform localPosition (0.2890542445280988 0.33555746354966504 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8823123848237227 1.1349748951317415 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -16 -16)
"cameras/drone/drone0" SET Transform localScale (0.9709877059079303 0.9709877059079303 0.9709877059079303)
"cameras/drone/drone1" SET Transform localEulerAngles (5 8 -4)
"cameras/drone/drone1" SET Transform localScale (1.474652290286853 1.474652290286853 1.474652290286853)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.909234633962045 0)
"cameras" SET Transform eulerAngles (-12.758541354811822 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8260365195928853
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9232456776249
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.21513719216221114
"cameras/drone/drone0" SET Transform localPosition (1.0197204320143853 0.12834621599800117 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.446306812051372 1.1599599029667824 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -7 18)
"cameras/drone/drone0" SET Transform localScale (0.7916475627808937 0.7916475627808937 0.7916475627808937)
"cameras/drone/drone1" SET Transform localEulerAngles (-2 -18 -16)
"cameras/drone/drone1" SET Transform localScale (0.9076136566826554 0.9076136566826554 0.9076136566826554)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.085274129218702 0)
"cameras" SET Transform eulerAngles (-19.802961230216773 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5812493460864196
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3216054669774953
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.009075242555553543
"cameras/drone/drone0" SET Transform localPosition (0.23447611035433757 -0.21091096879618415 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.8381466082253186 1.113177262256372 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 3 -15)
"cameras/drone/drone0" SET Transform localScale (1.1582041283325122 1.1582041283325122 1.1582041283325122)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -3 12)
"cameras/drone/drone1" SET Transform localScale (1.3899655934498512 1.3899655934498512 1.3899655934498512)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.540439907998852 0)
"cameras" SET Transform eulerAngles (14.931587154455386 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.914719184114442
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3614569431891246
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3743073323716218
"cameras/drone/drone0" SET Transform localPosition (0.8074687758778236 0.029524913384069762 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.007135243551888326 0.8072774282793411 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -7 -15)
"cameras/drone/drone0" SET Transform localScale (1.4913936485314703 1.4913936485314703 1.4913936485314703)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 9 -11)
"cameras/drone/drone1" SET Transform localScale (0.836344567072972 0.836344567072972 0.836344567072972)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7331399558178178 0)
"cameras" SET Transform eulerAngles (-5.455778000978167 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.35954423407639
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.690242087222455
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3285339493813746
"cameras/drone/drone0" SET Transform localPosition (0.6811446019845866 0.40480078971189454 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1756235814840557 1.1337996819063205 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 15 -18)
"cameras/drone/drone0" SET Transform localScale (1.1926507310496812 1.1926507310496812 1.1926507310496812)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -4 -8)
"cameras/drone/drone1" SET Transform localScale (0.8602857169554697 0.8602857169554697 0.8602857169554697)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7201704618933364 0)
"cameras" SET Transform eulerAngles (-1.5374436311375987 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.49252063432672555
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7276870369079669
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.0998290799662093
"cameras/drone/drone0" SET Transform localPosition (0.8933775293195232 0.5047205170981683 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.11028727830413487 0.963275196351145 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -14 4)
"cameras/drone/drone0" SET Transform localScale (1.365560093504217 1.365560093504217 1.365560093504217)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -18 -6)
"cameras/drone/drone1" SET Transform localScale (0.7158105218580695 0.7158105218580695 0.7158105218580695)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.8316768256203995 0)
"cameras" SET Transform eulerAngles (14.402916115864087 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8629660961681598
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9733061800954674
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3793164835859291
"cameras/drone/drone0" SET Transform localPosition (0.47117890967940057 0.18911642687973812 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7731939653760114 1.1544880490412737 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -16 9)
"cameras/drone/drone0" SET Transform localScale (1.1934560067386097 1.1934560067386097 1.1934560067386097)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 15 -11)
"cameras/drone/drone1" SET Transform localScale (0.9286343515546935 0.9286343515546935 0.9286343515546935)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.460103497738451 0)
"cameras" SET Transform eulerAngles (-8.84818572965484 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5807463372685042
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9273087792092438
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19378067003978577
"cameras/drone/drone0" SET Transform localPosition (0.7063452007772613 0.43942833157469013 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.30424188116309603 1.290141478513703 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 2 4)
"cameras/drone/drone0" SET Transform localScale (0.7934009734239498 0.7934009734239498 0.7934009734239498)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -2 -5)
"cameras/drone/drone1" SET Transform localScale (0.7185969493150162 0.7185969493150162 0.7185969493150162)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.4626628259823473 0)
"cameras" SET Transform eulerAngles (1.3871431532722909 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1851570247805305
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1692957410711973
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3620594890682184
"cameras/drone/drone0" SET Transform localPosition (0.2729049159339705 -0.07050313934289115 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0242932761634338 1.2429367058469234 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 6 3)
"cameras/drone/drone0" SET Transform localScale (1.0437368423124627 1.0437368423124627 1.0437368423124627)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 15 -20)
"cameras/drone/drone1" SET Transform localScale (1.3037636240261934 1.3037636240261934 1.3037636240261934)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.55518359463495 0)
"cameras" SET Transform eulerAngles (7.978835949760075 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6012529791982311
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.074539270971163
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09701788460400262
"cameras/drone/drone0" SET Transform localPosition (0.013442498230828548 0.3338146497201829 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6353660758719257 1.125726219453812 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -11 -7)
"cameras/drone/drone0" SET Transform localScale (1.3266381297350218 1.3266381297350218 1.3266381297350218)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -16 -16)
"cameras/drone/drone1" SET Transform localScale (0.6579061090845504 0.6579061090845504 0.6579061090845504)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.678487197438283 0)
"cameras" SET Transform eulerAngles (-17.059362700659673 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4955577789483074
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0630216971629607
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11054258149098467
"cameras/drone/drone0" SET Transform localPosition (0.6060921946648183 0.6473965271697915 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.976927466636778 1.0919125068388487 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 3 -3)
"cameras/drone/drone0" SET Transform localScale (1.17973141170491 1.17973141170491 1.17973141170491)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -12 -13)
"cameras/drone/drone1" SET Transform localScale (0.8457307895116714 0.8457307895116714 0.8457307895116714)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.808574153883484 0)
"cameras" SET Transform eulerAngles (-7.492429639591872 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4606266672310917
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.205443955987175
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1849255208875861
"cameras/drone/drone0" SET Transform localPosition (0.27694122400266163 0.16387161809401035 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4499858115313272 0.8306810641213347 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 10 -12)
"cameras/drone/drone0" SET Transform localScale (1.4328167844088044 1.4328167844088044 1.4328167844088044)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -16 -14)
"cameras/drone/drone1" SET Transform localScale (1.0656083254881725 1.0656083254881725 1.0656083254881725)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.435573110278632 0)
"cameras" SET Transform eulerAngles (13.427071508491075 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.901648958266519
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.455147939585688
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.05971236779457128
"cameras/drone/drone0" SET Transform localPosition (0.5873829697827269 0.6848920405086978 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5781572253797552 1.244531555144949 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 12 8)
"cameras/drone/drone0" SET Transform localScale (1.3077748517881438 1.3077748517881438 1.3077748517881438)
"cameras/drone/drone1" SET Transform localEulerAngles (2 20 10)
"cameras/drone/drone1" SET Transform localScale (1.295031152258448 1.295031152258448 1.295031152258448)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.0008195599220455 0)
"cameras" SET Transform eulerAngles (11.967673865833799 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1806370229610852
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3439283118182799
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.12180853712180745
"cameras/drone/drone0" SET Transform localPosition (-0.2864856011416992 0.5451778134928154 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4127667705047362 1.0477667973333344 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 5 -8)
"cameras/drone/drone0" SET Transform localScale (1.4168184996058841 1.4168184996058841 1.4168184996058841)
"cameras/drone/drone1" SET Transform localEulerAngles (10 4 16)
"cameras/drone/drone1" SET Transform localScale (0.6125461880801552 0.6125461880801552 0.6125461880801552)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.7063424712231505 0)
"cameras" SET Transform eulerAngles (-2.6420833725048176 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.46136853862118593
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2580928693119757
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.027918973396740078
"cameras/drone/drone0" SET Transform localPosition (-0.10554993464754592 -0.10538473495205053 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7788551319471697 0.9588601989183299 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (8 -8 12)
"cameras/drone/drone0" SET Transform localScale (1.4125865292880417 1.4125865292880417 1.4125865292880417)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 -15 8)
"cameras/drone/drone1" SET Transform localScale (1.2529803106060022 1.2529803106060022 1.2529803106060022)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.798021993706268 0)
"cameras" SET Transform eulerAngles (-1.4444344881262658 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.46546186953827234
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6111026242680992
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19390801458667234
"cameras/drone/drone0" SET Transform localPosition (-0.7517760850544863 0.10223864630490936 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.1510210654994537 1.133514589683279 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-5 20 4)
"cameras/drone/drone0" SET Transform localScale (1.464384067133932 1.464384067133932 1.464384067133932)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 16 8)
"cameras/drone/drone1" SET Transform localScale (1.3358858629004942 1.3358858629004942 1.3358858629004942)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.0878132369982625 0)
"cameras" SET Transform eulerAngles (-4.2058971640555765 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1182823390152445
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.080161134342493
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37783853596183725
"cameras/drone/drone0" SET Transform localPosition (-0.1049121540923692 0.2825681440474333 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.1917919691111794 1.1402462220133054 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 -19 17)
"cameras/drone/drone0" SET Transform localScale (1.428564634302941 1.428564634302941 1.428564634302941)
"cameras/drone/drone1" SET Transform localEulerAngles (18 8 20)
"cameras/drone/drone1" SET Transform localScale (1.065319849438394 1.065319849438394 1.065319849438394)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2662172983655733 0)
"cameras" SET Transform eulerAngles (15.03408435233495 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2510827725378815
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8848486896527643
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3835573755591546
"cameras/drone/drone0" SET Transform localPosition (-0.904397653034644 0.6673796585549274 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.40792058995090796 1.0547625782575252 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 20 -9)
"cameras/drone/drone0" SET Transform localScale (1.0493104382082035 1.0493104382082035 1.0493104382082035)
"cameras/drone/drone1" SET Transform localEulerAngles (2 -4 -5)
"cameras/drone/drone1" SET Transform localScale (1.2304598344239657 1.2304598344239657 1.2304598344239657)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5169324742655226 0)
"cameras" SET Transform eulerAngles (-18.43529184043628 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2823593922150316
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4323745124153073
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1515871867467154
"cameras/drone/drone0" SET Transform localPosition (0.8517316298113708 0.4059055338203426 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.19061736685770825 1.1819914102832676 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (16 -19 -14)
"cameras/drone/drone0" SET Transform localScale (0.7027537560492012 0.7027537560492012 0.7027537560492012)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 0 -17)
"cameras/drone/drone1" SET Transform localScale (0.6244545985680806 0.6244545985680806 0.6244545985680806)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.843595734341433 0)
"cameras" SET Transform eulerAngles (-7.953119231248756 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5398878550890276
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.746679042756948
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04492413607365591
"cameras/drone/drone0" SET Transform localPosition (0.49445027344436077 0.4928044946927687 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.24673672628522403 1.007444192682972 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -5 -12)
"cameras/drone/drone0" SET Transform localScale (1.4545914855363988 1.4545914855363988 1.4545914855363988)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 -4 -14)
"cameras/drone/drone1" SET Transform localScale (1.2758424825982742 1.2758424825982742 1.2758424825982742)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.171304339027117 0)
"cameras" SET Transform eulerAngles (-0.08425150507861545 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4698072315131545
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0604779389004613
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1453787107958119
"cameras/drone/drone0" SET Transform localPosition (0.1510393038725355 0.3034352774213614 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.37391212994415357 0.8343802507618959 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 9 7)
"cameras/drone/drone0" SET Transform localScale (1.1835472850807622 1.1835472850807622 1.1835472850807622)
"cameras/drone/drone1" SET Transform localEulerAngles (-3 12 11)
"cameras/drone/drone1" SET Transform localScale (1.2562435858966685 1.2562435858966685 1.2562435858966685)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.043766298942705 0)
"cameras" SET Transform eulerAngles (-5.192322902867188 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0537254791553452
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0135029175712007
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2965188328276873
"cameras/drone/drone0" SET Transform localPosition (0.022634438824944425 0.37486472409683774 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7229083757582726 1.1199709920846759 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 8 10)
"cameras/drone/drone0" SET Transform localScale (0.7500521143796829 0.7500521143796829 0.7500521143796829)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 11 -6)
"cameras/drone/drone1" SET Transform localScale (1.2722466126201923 1.2722466126201923 1.2722466126201923)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.865855535798229 0)
"cameras" SET Transform eulerAngles (-4.477501474586063 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9894727000459098
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4379443338748426
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11878236114009177
"cameras/drone/drone0" SET Transform localPosition (-0.6267170817613271 0.49142401694465815 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9971395950422821 0.9336976981969176 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (14 -12 2)
"cameras/drone/drone0" SET Transform localScale (1.3144210509138767 1.3144210509138767 1.3144210509138767)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -12 -18)
"cameras/drone/drone1" SET Transform localScale (0.617630348234213 0.617630348234213 0.617630348234213)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.6441466346144358 0)
"cameras" SET Transform eulerAngles (-10.370086775150398 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.333756729292555
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2665196468110838
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13545467899784677
"cameras/drone/drone0" SET Transform localPosition (-1.1354597989117046 0.5857339604996745 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.4509734548881852 0.9645728162691105 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -16 5)
"cameras/drone/drone0" SET Transform localScale (1.3049283974209338 1.3049283974209338 1.3049283974209338)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 18 -7)
"cameras/drone/drone1" SET Transform localScale (1.1564041898214532 1.1564041898214532 1.1564041898214532)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.363396597600001 0)
"cameras" SET Transform eulerAngles (10.890917483421525 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7298326365056791
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3708680293098199
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.07118293319847657
"cameras/drone/drone0" SET Transform localPosition (0.6131030859303894 0.2535998365376441 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.4077720159762016 0.9505041118301341 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (9 19 -18)
"cameras/drone/drone0" SET Transform localScale (0.7881419667843126 0.7881419667843126 0.7881419667843126)
"cameras/drone/drone1" SET Transform localEulerAngles (15 1 -17)
"cameras/drone/drone1" SET Transform localScale (1.3325204001486322 1.3325204001486322 1.3325204001486322)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.983945630201886 0)
"cameras" SET Transform eulerAngles (15.777965313952798 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5243035436933967
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4202740261492544
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08759161233730338
"cameras/drone/drone0" SET Transform localPosition (-0.9074746735041348 0.03821407711619623 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9999195888839717 0.9816035215502958 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -16 19)
"cameras/drone/drone0" SET Transform localScale (1.117497613436067 1.117497613436067 1.117497613436067)
"cameras/drone/drone1" SET Transform localEulerAngles (-16 -15 -10)
"cameras/drone/drone1" SET Transform localScale (1.4688916051842917 1.4688916051842917 1.4688916051842917)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.942727648380287 0)
"cameras" SET Transform eulerAngles (-8.265543477764442 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1093137006827232
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9186184769292476
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.04354784455827901
"cameras/drone/drone0" SET Transform localPosition (-1.0121133303693741 -0.032908565295384606 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5726231254118026 1.1258177932707103 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 2 -3)
"cameras/drone/drone0" SET Transform localScale (1.0381569344844102 1.0381569344844102 1.0381569344844102)
"cameras/drone/drone1" SET Transform localEulerAngles (5 -12 7)
"cameras/drone/drone1" SET Transform localScale (1.223777402693422 1.223777402693422 1.223777402693422)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5817931459926804 0)
"cameras" SET Transform eulerAngles (-15.12907154586943 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4928669636661903
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4188524352992276
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11739960480662535
"cameras/drone/drone0" SET Transform localPosition (-0.3877617522598308 0.0658548002484381 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.0130368236906522 0.8334833469948495 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 16 -17)
"cameras/drone/drone0" SET Transform localScale (0.7799801761888167 0.7799801761888167 0.7799801761888167)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -18 -17)
"cameras/drone/drone1" SET Transform localScale (0.6545118855486481 0.6545118855486481 0.6545118855486481)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.618622196238765 0)
"cameras" SET Transform eulerAngles (-9.9897467053747 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8731527698220878
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9491106914445179
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3171902773657638
"cameras/drone/drone0" SET Transform localPosition (-0.12100116286484819 0.6433072886590072 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.857588377093595 0.8979134851219668 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (11 18 -3)
"cameras/drone/drone0" SET Transform localScale (1.485406682349021 1.485406682349021 1.485406682349021)
"cameras/drone/drone1" SET Transform localEulerAngles (6 -3 -6)
"cameras/drone/drone1" SET Transform localScale (1.4276040318199603 1.4276040318199603 1.4276040318199603)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3356692584733336 0)
"cameras" SET Transform eulerAngles (-9.766843670068015 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3692580080997994
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8302705300712498
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.23615842413390353
"cameras/drone/drone0" SET Transform localPosition (1.0565590116861612 0.49061384948428505 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0462356227793748 0.9377018453149466 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-4 -19 20)
"cameras/drone/drone0" SET Transform localScale (0.7506152986482223 0.7506152986482223 0.7506152986482223)
"cameras/drone/drone1" SET Transform localEulerAngles (-12 -6 -6)
"cameras/drone/drone1" SET Transform localScale (1.3783909500694513 1.3783909500694513 1.3783909500694513)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.755530427889555 0)
"cameras" SET Transform eulerAngles (-16.493490512667552 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8930643921180795
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1837204135420922
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3404670143073847
"cameras/drone/drone0" SET Transform localPosition (-0.621263993811203 0.05759115918436747 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.19600034720648707 1.0519136341741802 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -6 -7)
"cameras/drone/drone0" SET Transform localScale (0.8584916198067668 0.8584916198067668 0.8584916198067668)
"cameras/drone/drone1" SET Transform localEulerAngles (17 12 6)
"cameras/drone/drone1" SET Transform localScale (1.3722961210925742 1.3722961210925742 1.3722961210925742)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.254110676020899 0)
"cameras" SET Transform eulerAngles (-0.3541388944287327 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5112343916121009
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9213014418196471
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1494622314149741
"cameras/drone/drone0" SET Transform localPosition (0.5471620258928398 0.16911211749919036 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.24456398195294393 0.899911144619026 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 1 -10)
"cameras/drone/drone0" SET Transform localScale (1.0317033652618661 1.0317033652618661 1.0317033652618661)
"cameras/drone/drone1" SET Transform localEulerAngles (20 8 -9)
"cameras/drone/drone1" SET Transform localScale (1.0118564389548992 1.0118564389548992 1.0118564389548992)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.488529535870413 0)
"cameras" SET Transform eulerAngles (-11.40007511164776 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5523139676503827
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9899046360798818
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.39499293753469217
"cameras/drone/drone0" SET Transform localPosition (-0.8153541658901495 -0.18268157857777562 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.04213063671322481 0.9475539002605863 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-15 -8 15)
"cameras/drone/drone0" SET Transform localScale (1.2071203321504003 1.2071203321504003 1.2071203321504003)
"cameras/drone/drone1" SET Transform localEulerAngles (4 -14 5)
"cameras/drone/drone1" SET Transform localScale (1.1793847073140276 1.1793847073140276 1.1793847073140276)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.908638388402239 0)
"cameras" SET Transform eulerAngles (5.532374099689509 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7855597773631064
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.5586600246933893
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20108063852706215
"cameras/drone/drone0" SET Transform localPosition (0.9721828635874854 0.397522549448129 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.17318336245847066 0.9289466129930963 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -7 2)
"cameras/drone/drone0" SET Transform localScale (0.9243406658381705 0.9243406658381705 0.9243406658381705)
"cameras/drone/drone1" SET Transform localEulerAngles (14 -10 -10)
"cameras/drone/drone1" SET Transform localScale (1.3537036695854459 1.3537036695854459 1.3537036695854459)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.421269630675578 0)
"cameras" SET Transform eulerAngles (-13.767049575749407 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.3789009669679113
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4228356613201472
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19544608049241718
"cameras/drone/drone0" SET Transform localPosition (0.19530602918775797 0.4138046307487894 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.2492901283849136 1.0230557331653058 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-1 2 -11)
"cameras/drone/drone0" SET Transform localScale (1.2079559220772733 1.2079559220772733 1.2079559220772733)
"cameras/drone/drone1" SET Transform localEulerAngles (19 -14 16)
"cameras/drone/drone1" SET Transform localScale (1.4009107268989236 1.4009107268989236 1.4009107268989236)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.788367731385576 0)
"cameras" SET Transform eulerAngles (-12.820003361832262 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.146900619236817
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0236962780820518
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.37959831902052266
"cameras/drone/drone0" SET Transform localPosition (0.44140694556980886 0.42348984716016463 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6975943268080889 1.258554118638838 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (0 -13 -20)
"cameras/drone/drone0" SET Transform localScale (0.7683019698496799 0.7683019698496799 0.7683019698496799)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -12 -16)
"cameras/drone/drone1" SET Transform localScale (0.8138506010295873 0.8138506010295873 0.8138506010295873)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.3059687233829855 0)
"cameras" SET Transform eulerAngles (-1.3352621786002743 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2157864907170628
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.942684877850383
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11697604381009424
"cameras/drone/drone0" SET Transform localPosition (1.1004854803422572 -0.10367592636526918 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.24331280785598053 1.2209226331713614 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (13 16 4)
"cameras/drone/drone0" SET Transform localScale (0.9120769487954759 0.9120769487954759 0.9120769487954759)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 18 4)
"cameras/drone/drone1" SET Transform localScale (0.9271697132290035 0.9271697132290035 0.9271697132290035)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.907740808699695 0)
"cameras" SET Transform eulerAngles (6.439707074771029 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5115613514774626
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7690141190174757
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2518524532117274
"cameras/drone/drone0" SET Transform localPosition (0.07118143294834023 0.5528283392296651 2.3)
"cameras/drone/drone1" SET Transform localPosition (1.0531448959162792 1.2040816062628712 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -13 -6)
"cameras/drone/drone0" SET Transform localScale (0.6829808890443197 0.6829808890443197 0.6829808890443197)
"cameras/drone/drone1" SET Transform localEulerAngles (-5 -8 16)
"cameras/drone/drone1" SET Transform localScale (0.9727646004339768 0.9727646004339768 0.9727646004339768)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.87144073670926 0)
"cameras" SET Transform eulerAngles (-14.516875387930082 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7855822900120145
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1787992018820095
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.09485158675021062
"cameras/drone/drone0" SET Transform localPosition (-0.6452222521033504 0.15195087739600494 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.3449872945062963 1.24679422479887 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -6 8)
"cameras/drone/drone0" SET Transform localScale (0.7616042252618209 0.7616042252618209 0.7616042252618209)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 5 -11)
"cameras/drone/drone1" SET Transform localScale (0.8426363004988534 0.8426363004988534 0.8426363004988534)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8950167659644057 0)
"cameras" SET Transform eulerAngles (12.039565601271896 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5790045311484804
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9244705737608965
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.10814206710275083
"cameras/drone/drone0" SET Transform localPosition (0.8442325472146701 0.07699945162296035 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.10549246978073445 1.2273845240227423 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-18 -14 15)
"cameras/drone/drone0" SET Transform localScale (1.2196779120792955 1.2196779120792955 1.2196779120792955)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 -14 13)
"cameras/drone/drone1" SET Transform localScale (1.3582312882802503 1.3582312882802503 1.3582312882802503)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.858449168075262 0)
"cameras" SET Transform eulerAngles (-8.85789154378854 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7248051451204673
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.074350081484908
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3272950558933901
"cameras/drone/drone0" SET Transform localPosition (-0.1337758280720447 0.4705978370821173 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.014592719407732435 1.1164302483823247 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-6 11 -16)
"cameras/drone/drone0" SET Transform localScale (1.4765895056221194 1.4765895056221194 1.4765895056221194)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -15 -18)
"cameras/drone/drone1" SET Transform localScale (1.4136807859972937 1.4136807859972937 1.4136807859972937)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.163348896352106 0)
"cameras" SET Transform eulerAngles (6.8695423822453705 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.1591342647913074
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0953656924925042
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.20328986032024168
"cameras/drone/drone0" SET Transform localPosition (0.8698173536009748 0.3588189907139148 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.21496200940424703 1.2528262352886064 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 -4 4)
"cameras/drone/drone0" SET Transform localScale (1.0384674760038293 1.0384674760038293 1.0384674760038293)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -14 6)
"cameras/drone/drone1" SET Transform localScale (0.669164947800807 0.669164947800807 0.669164947800807)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.023733695839935 0)
"cameras" SET Transform eulerAngles (-1.2238758785195323 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.8382010422337862
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.926788759443343
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2550061360265791
"cameras/drone/drone0" SET Transform localPosition (0.061830875647489236 0.4084267365671343 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.950691438120042 1.1184695007236651 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -13 16)
"cameras/drone/drone0" SET Transform localScale (0.6698907376728553 0.6698907376728553 0.6698907376728553)
"cameras/drone/drone1" SET Transform localEulerAngles (-4 -17 6)
"cameras/drone/drone1" SET Transform localScale (1.0737520241125171 1.0737520241125171 1.0737520241125171)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.626246514465554 0)
"cameras" SET Transform eulerAngles (-2.6500464393082943 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2053445394021556
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.804623246468759
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.19056984741143018
"cameras/drone/drone0" SET Transform localPosition (-1.1226534115112778 0.4387057283886708 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.8498057049449079 1.2936682086192415 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (12 10 13)
"cameras/drone/drone0" SET Transform localScale (1.1121811953479293 1.1121811953479293 1.1121811953479293)
"cameras/drone/drone1" SET Transform localEulerAngles (10 -17 -12)
"cameras/drone/drone1" SET Transform localScale (0.6855450225813989 0.6855450225813989 0.6855450225813989)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.5247355164173015 0)
"cameras" SET Transform eulerAngles (-14.182797841948265 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5473170173569
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1907503740114351
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.295896193038464
"cameras/drone/drone0" SET Transform localPosition (-0.06684828215384364 -0.018331500247703747 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6340566248022574 0.8448696888440879 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -9 -9)
"cameras/drone/drone0" SET Transform localScale (1.3977859456748265 1.3977859456748265 1.3977859456748265)
"cameras/drone/drone1" SET Transform localEulerAngles (16 -7 12)
"cameras/drone/drone1" SET Transform localScale (1.1057168351615527 1.1057168351615527 1.1057168351615527)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1695999135121915 0)
"cameras" SET Transform eulerAngles (15.079953367691672 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4535304494377033
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9966346467851483
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.2599264937574921
"cameras/drone/drone0" SET Transform localPosition (0.2685346920887839 0.2057632928652861 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.5242954353120088 1.1383740881107114 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-20 8 -8)
"cameras/drone/drone0" SET Transform localScale (0.650618270071821 0.650618270071821 0.650618270071821)
"cameras/drone/drone1" SET Transform localEulerAngles (-15 -14 -14)
"cameras/drone/drone1" SET Transform localScale (1.3586064054895433 1.3586064054895433 1.3586064054895433)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.322512782876064 0)
"cameras" SET Transform eulerAngles (9.387302537816101 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9752114563616686
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6813848585392042
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13521421723129903
"cameras/drone/drone0" SET Transform localPosition (-0.06851780527447304 0.5064660823890912 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.3933793601348501 1.1726394814251029 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-13 -7 1)
"cameras/drone/drone0" SET Transform localScale (1.0161555810668963 1.0161555810668963 1.0161555810668963)
"cameras/drone/drone1" SET Transform localEulerAngles (-9 -18 7)
"cameras/drone/drone1" SET Transform localScale (0.7550148564274498 0.7550148564274498 0.7550148564274498)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.2646598621085854 0)
"cameras" SET Transform eulerAngles (14.390690282619232 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9512067819514891
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.6272615343242016
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.03702743599598435
"cameras/drone/drone0" SET Transform localPosition (-1.1314300284190277 0.09976615412006068 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.32190222835676474 0.9840117903540189 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (6 -17 -14)
"cameras/drone/drone0" SET Transform localScale (1.3505750194665425 1.3505750194665425 1.3505750194665425)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -11 -15)
"cameras/drone/drone1" SET Transform localScale (1.2441464186467264 1.2441464186467264 1.2441464186467264)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.1367249743181644 0)
"cameras" SET Transform eulerAngles (-12.893243288710035 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6951781484191777
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9478289976609563
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1980625183632291
"cameras/drone/drone0" SET Transform localPosition (-0.030086995326271015 0.4872106356167712 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.19084043387876792 1.2791882391259846 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-14 -8 -13)
"cameras/drone/drone0" SET Transform localScale (1.3278782214773024 1.3278782214773024 1.3278782214773024)
"cameras/drone/drone1" SET Transform localEulerAngles (17 -17 -12)
"cameras/drone/drone1" SET Transform localScale (1.4968654552091651 1.4968654552091651 1.4968654552091651)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.7033937992917982 0)
"cameras" SET Transform eulerAngles (-12.89650722726018 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.9142820861672832
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.9758801677744096
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3793858806716617
"cameras/drone/drone0" SET Transform localPosition (-0.967969872041218 0.5055559961714613 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.6114698780346998 1.0408300179545598 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (4 -16 18)
"cameras/drone/drone0" SET Transform localScale (1.2993183916199194 1.2993183916199194 1.2993183916199194)
"cameras/drone/drone1" SET Transform localEulerAngles (-1 13 7)
"cameras/drone/drone1" SET Transform localScale (0.7996147526322419 0.7996147526322419 0.7996147526322419)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.879474055162749 0)
"cameras" SET Transform eulerAngles (-4.724347850420871 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5485404238006015
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7210893324534449
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38380652751026945
"cameras/drone/drone0" SET Transform localPosition (-0.21650378659220193 0.12090314858854029 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.9971010346028375 0.8912989225476569 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (15 0 -9)
"cameras/drone/drone0" SET Transform localScale (1.2432887778175412 1.2432887778175412 1.2432887778175412)
"cameras/drone/drone1" SET Transform localEulerAngles (5 5 -9)
"cameras/drone/drone1" SET Transform localScale (0.7629235695318745 0.7629235695318745 0.7629235695318745)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.654574447081824 0)
"cameras" SET Transform eulerAngles (-19.11484827953612 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2955115364755057
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.859084465796427
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.1307436534518825
"cameras/drone/drone0" SET Transform localPosition (-0.5384745572759534 -0.05810284982498087 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.32170797717144617 0.8366881411551632 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (1 -11 0)
"cameras/drone/drone0" SET Transform localScale (0.9662990385646761 0.9662990385646761 0.9662990385646761)
"cameras/drone/drone1" SET Transform localEulerAngles (13 -2 13)
"cameras/drone/drone1" SET Transform localScale (1.393229680240415 1.393229680240415 1.393229680240415)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.589114161215587 0)
"cameras" SET Transform eulerAngles (-1.43134437910566 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 18
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5236115302436362
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.68504787278619
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.16299007373317342
"cameras/drone/drone0" SET Transform localPosition (-0.867302333865585 0.25383190286287655 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.82057650915543 0.9950695496078029 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-16 -11 -6)
"cameras/drone/drone0" SET Transform localScale (0.8305154228887448 0.8305154228887448 0.8305154228887448)
"cameras/drone/drone1" SET Transform localEulerAngles (9 -16 20)
"cameras/drone/drone1" SET Transform localScale (1.4398434050401439 1.4398434050401439 1.4398434050401439)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.267994930094586 0)
"cameras" SET Transform eulerAngles (-5.741309539053322 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6820972383012577
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.8165148179142596
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.38278548572362
"cameras/drone/drone0" SET Transform localPosition (1.197992449872581 0.4742819594674123 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.9875579840341281 1.0452027809041249 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-11 -8 12)
"cameras/drone/drone0" SET Transform localScale (0.7735847968805396 0.7735847968805396 0.7735847968805396)
"cameras/drone/drone1" SET Transform localEulerAngles (-20 -5 12)
"cameras/drone/drone1" SET Transform localScale (1.4311675549645364 1.4311675549645364 1.4311675549645364)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.846073097584898 0)
"cameras" SET Transform eulerAngles (-13.713196237473886 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5457195434103168
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.4211778919562659
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.11114127018754552
"cameras/drone/drone0" SET Transform localPosition (0.6688769290996075 0.11860817697569587 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7212156322078345 0.84762373147915 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-10 -10 11)
"cameras/drone/drone0" SET Transform localScale (0.9723928879267396 0.9723928879267396 0.9723928879267396)
"cameras/drone/drone1" SET Transform localEulerAngles (5 3 -13)
"cameras/drone/drone1" SET Transform localScale (0.8762524114812533 0.8762524114812533 0.8762524114812533)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.164159760805875 0)
"cameras" SET Transform eulerAngles (-10.960418244203755 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 16
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4652622219716752
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2197790258460144
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22491177818186775
"cameras/drone/drone0" SET Transform localPosition (0.8244778088529021 0.5581504160408586 2.3)
"cameras/drone/drone1" SET Transform localPosition (-1.1880916881480654 1.2352792642039452 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 5 -18)
"cameras/drone/drone0" SET Transform localScale (1.3436148361681362 1.3436148361681362 1.3436148361681362)
"cameras/drone/drone1" SET Transform localEulerAngles (-7 6 1)
"cameras/drone/drone1" SET Transform localScale (1.446234154668432 1.446234154668432 1.446234154668432)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.454405008992512 0)
"cameras" SET Transform eulerAngles (8.166530977457178 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 15
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.6521183047859409
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1066373924104171
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.24451232539516168
"cameras/drone/drone0" SET Transform localPosition (0.6616367969370585 0.6927578951526763 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.7696184385962024 1.0346706352885566 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-7 9 12)
"cameras/drone/drone0" SET Transform localScale (1.1831952947123119 1.1831952947123119 1.1831952947123119)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -20 19)
"cameras/drone/drone1" SET Transform localScale (1.0146571578059191 1.0146571578059191 1.0146571578059191)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.5095316361855713 0)
"cameras" SET Transform eulerAngles (-16.941759763847557 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4502323848000804
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3425943647168586
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.25038857898903366
"cameras/drone/drone0" SET Transform localPosition (1.176115981459447 0.4340291066101151 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.39047438944002544 1.119483376481586 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (7 3 -8)
"cameras/drone/drone0" SET Transform localScale (0.905093994212832 0.905093994212832 0.905093994212832)
"cameras/drone/drone1" SET Transform localEulerAngles (-17 -5 -1)
"cameras/drone/drone1" SET Transform localScale (1.2622173352572212 1.2622173352572212 1.2622173352572212)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.3893669958088495 0)
"cameras" SET Transform eulerAngles (-18.473393842406956 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.227174618086103
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9139524073084656
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.34208988831041925
"cameras/drone/drone0" SET Transform localPosition (0.3516740323465877 0.28882992853718453 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.23728218352357255 1.0682355219958861 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 0 -1)
"cameras/drone/drone0" SET Transform localScale (0.975514369965248 0.975514369965248 0.975514369965248)
"cameras/drone/drone1" SET Transform localEulerAngles (-19 6 -14)
"cameras/drone/drone1" SET Transform localScale (1.2181288081530495 1.2181288081530495 1.2181288081530495)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.8185484291209413 0)
"cameras" SET Transform eulerAngles (-12.084843774576207 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.4889558005899098
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 0.9366570586387953
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08146978963300495
"cameras/drone/drone0" SET Transform localPosition (0.11227170821622301 -0.18138410657848142 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.5222840777133948 0.9856450657924298 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (3 15 -12)
"cameras/drone/drone0" SET Transform localScale (0.6044510938632419 0.6044510938632419 0.6044510938632419)
"cameras/drone/drone1" SET Transform localEulerAngles (18 -13 -2)
"cameras/drone/drone1" SET Transform localScale (0.7442388151952486 0.7442388151952486 0.7442388151952486)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.503441038946928 0)
"cameras" SET Transform eulerAngles (8.392819131705814 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 11
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.2305798408622781
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7228013811552243
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.13583323070039444
"cameras/drone/drone0" SET Transform localPosition (0.05889923329209745 0.3803075210496451 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.29139101704419557 0.8882002236074946 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-2 -3 -18)
"cameras/drone/drone0" SET Transform localScale (0.784832861654152 0.784832861654152 0.784832861654152)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 6 -19)
"cameras/drone/drone1" SET Transform localScale (1.3137254724349297 1.3137254724349297 1.3137254724349297)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.135889974696055 0)
"cameras" SET Transform eulerAngles (-3.217245932027403 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 13
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.5829683676522173
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2658489921785052
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3059189053803173
"cameras/drone/drone0" SET Transform localPosition (-0.8650763568416409 0.016116174102350167 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.030258283887731885 1.0697777063551852 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-19 -5 -4)
"cameras/drone/drone0" SET Transform localScale (1.4821992625566713 1.4821992625566713 1.4821992625566713)
"cameras/drone/drone1" SET Transform localEulerAngles (-13 1 8)
"cameras/drone/drone1" SET Transform localScale (1.378136486378422 1.378136486378422 1.378136486378422)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.715473310318118 0)
"cameras" SET Transform eulerAngles (-13.260099876369482 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 14
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.7069413186929824
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.2099357175074696
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.30492816928438904
"cameras/drone/drone0" SET Transform localPosition (-0.12603178867345788 0.4193895467308066 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.6852925203405924 0.8307513653324314 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (20 -17 5)
"cameras/drone/drone0" SET Transform localScale (1.3002962125610198 1.3002962125610198 1.3002962125610198)
"cameras/drone/drone1" SET Transform localEulerAngles (10 19 10)
"cameras/drone/drone1" SET Transform localScale (0.7951545853235544 0.7951545853235544 0.7951545853235544)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.3989726971602043 0)
"cameras" SET Transform eulerAngles (13.89310576393487 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 9
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.0543483150113546
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.3523812843497023
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3986822004813064
"cameras/drone/drone0" SET Transform localPosition (0.05513997295398365 0.23927522719722633 2.3)
"cameras/drone/drone1" SET Transform localPosition (-0.024329836724047205 1.1496227100009642 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (5 -4 -20)
"cameras/drone/drone0" SET Transform localScale (0.670916430970554 0.670916430970554 0.670916430970554)
"cameras/drone/drone1" SET Transform localEulerAngles (-10 -14 -20)
"cameras/drone/drone1" SET Transform localScale (1.461857706659289 1.461857706659289 1.461857706659289)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 3.985607744515673 0)
"cameras" SET Transform eulerAngles (14.37773209434458 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 12
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 0.5080582533881366
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.1056522156865178
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.3811261508985318
"cameras/drone/drone0" SET Transform localPosition (0.8380730661605995 -0.2742157059013464 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.7163147659323406 0.8438703485258428 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (19 18 -8)
"cameras/drone/drone0" SET Transform localScale (1.1453312764496817 1.1453312764496817 1.1453312764496817)
"cameras/drone/drone1" SET Transform localEulerAngles (-8 -3 3)
"cameras/drone/drone1" SET Transform localScale (1.2166992622751702 1.2166992622751702 1.2166992622751702)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.604031491071652 0)
"cameras" SET Transform eulerAngles (7.681582659933493 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 10
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4363172568862344
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.0855821441824314
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.08642738693394292
"cameras/drone/drone0" SET Transform localPosition (-0.4844135445776794 -0.008244200306419314 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.22216464017545645 0.9361854268113927 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-12 -2 -4)
"cameras/drone/drone0" SET Transform localScale (1.1515696854258395 1.1515696854258395 1.1515696854258395)
"cameras/drone/drone1" SET Transform localEulerAngles (-6 14 16)
"cameras/drone/drone1" SET Transform localScale (0.9010165852835594 0.9010165852835594 0.9010165852835594)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"spawner/city/ground" EXECUTE RandomProps.PropArea Shuffle
"spawner/cars" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/nature/trees" EXECUTE RandomProps.PropArea Shuffle
"spawner/city/buildings" EXECUTE RandomProps.PropArea Shuffle
"spawner/roadsigns" EXECUTE RandomProps.PropArea Shuffle
"spawner/humans_0" EXECUTE RandomProps.PropArea Shuffle
"cameras" SET Transform position (0 4.472447612159465 0)
"cameras" SET Transform eulerAngles (1.3774121529947472 0 0)
"EnviroSky" SET EnviroSky GameTime.Hours 17
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.saturation 1.4358047725030714
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.colorGrading.settings.basic.contrast 1.7254528747666893
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.chromaticAberration.settings.intensity 0.22823896871658916
"cameras/drone/drone0" SET Transform localPosition (0.3112501796210081 0.16850196152513147 2.3)
"cameras/drone/drone1" SET Transform localPosition (0.03772031525606945 1.2638890635922546 2.3)
"cameras/drone/drone0" SET Transform localEulerAngles (-17 11 6)
"cameras/drone/drone0" SET Transform localScale (0.9742753895125327 0.9742753895125327 0.9742753895125327)
"cameras/drone/drone1" SET Transform localEulerAngles (3 -16 13)
"cameras/drone/drone1" SET Transform localScale (0.6701756803299053 0.6701756803299053 0.6701756803299053)
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
