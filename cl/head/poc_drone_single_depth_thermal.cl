CREATE "cameras"
"cameras" SET active false
"cameras" SET Transform position (-6 1 -50)
"cameras" SET Transform eulerAngles (0 0 0)
"Canvas/Cameras/Viewport/Content" SET UI.GridLayoutGroup cellSize (1024 768)
"Canvas" SET active true
CREATE "cameras/cameraRGB"
"cameras/cameraRGB" SET active false
"cameras/cameraRGB" ADD Camera
"cameras/cameraRGB" SET Camera near 0.3 far 1000 fieldOfView 60
"cameras/cameraRGB" ADD Sensors.RenderCamera
"cameras/cameraRGB" SET Sensors.RenderCamera format "ARGB32" resolution (2048 1536)
"cameras/cameraRGB" SET Camera renderingPath "UsePlayerSettings"
"cameras/cameraRGB" ADD AudioListener
CREATE "EnviroSky" AS "EnviroSky"
"EnviroSky" SET EnviroSky Player "cameras" PlayerCamera "cameras/cameraRGB" GameTime.ProgressTime "None" weatherSettings.cloudTransitionSpeed 100 weatherSettings.effectTransitionSpeed 100 weatherSettings.fogTransitionSpeed 100 
"EnviroSky" EXECUTE EnviroSky AssignAndStart "cameras/cameraRGB" "cameras/cameraRGB"
"EnviroSky" SET active true
"cameras/cameraRGB" SET active true
"cameras" SET active true
"cameras/cameraRGB" ADD UnityEngine.PostProcessing.PostProcessingBehaviour
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "EnviroFX"
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled false
CREATE "cameras/depth"
"cameras/depth" SET active false
"cameras/depth" ADD Camera
"cameras/depth" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "DeferredShading"
"cameras/depth" ADD Sensors.RenderCamera
"cameras/depth" SET Sensors.RenderCamera format "RFloat" resolution (2048 1536)
"cameras/depth" ADD Cameras.RenderDepthBufferSimple
"cameras/depth" SET Cameras.RenderDepthBufferSimple outputMode "Linear01Depth" transparencyCutout 0
"cameras/depth" SET active true
"cameras/cameraRGB" ADD LCP
"cameras/cameraRGB" SET LCP enabled false redParam1 0.1 redParam2 0.1 redParam3 -1 enabled true
CREATE "cameras/segmentation"
"cameras/segmentation" SET active false
"cameras/segmentation" ADD Camera
"cameras/segmentation" SET Camera near 0.3 far 1000 fieldOfView 60
"cameras/segmentation" ADD Sensors.RenderCamera
"cameras/segmentation" SET Sensors.RenderCamera format "ARGB32" resolution (1024 768)
"cameras/segmentation" SET Camera renderingPath "UsePlayerSettings" targetTexture.filterMode "Point"
"cameras/segmentation" ADD Segmentation.Segmentation
"cameras/segmentation" SET Segmentation.Segmentation minimumObjectVisibility 0 outputType "Auto" boundingBoxesExtensionAmount 0 transparencyCutout 0 
"cameras/segmentation" EXECUTE Segmentation.Segmentation DefineClass "Void"
"cameras/segmentation" PUSH Segmentation.Segmentation boundingBoxesFilter "drone0"
"cameras/segmentation" PUSH Segmentation.Segmentation boundingBoxesFilter "drone1"
"cameras/segmentation" PUSH Segmentation.Segmentation boundingBoxesFilter "drone2"
"cameras/segmentation" ADD Segmentation.LookUpTable
"cameras/segmentation" PUSH Segmentation.LookUpTable classes "Void"
"cameras/segmentation" PUSH Segmentation.LookUpTable colors "black"
"cameras/segmentation" EXECUTE Segmentation.Segmentation DefineClass "drone0"
"cameras/segmentation" PUSH Segmentation.LookUpTable classes "drone0"
"cameras/segmentation" PUSH Segmentation.LookUpTable colors "red"
"cameras/segmentation" EXECUTE Segmentation.Segmentation DefineClass "drone1"
"cameras/segmentation" PUSH Segmentation.LookUpTable classes "drone1"
"cameras/segmentation" PUSH Segmentation.LookUpTable colors "blue"
"cameras/segmentation" EXECUTE Segmentation.Segmentation DefineClass "drone2"
"cameras/segmentation" PUSH Segmentation.LookUpTable classes "drone2"
"cameras/segmentation" PUSH Segmentation.LookUpTable colors "green"
"cameras/segmentation" EXECUTE Segmentation.LookUpTable MarkTextureDirty
"cameras/segmentation" SET active true
CREATE "cameras/thermal"
"cameras/thermal" SET active false
"cameras/thermal" ADD Camera
"cameras/thermal" SET Camera near 0.3 far 1000 fieldOfView 60
"cameras/thermal" ADD Sensors.RenderCamera
"cameras/thermal" SET Sensors.RenderCamera format "ARGB32" resolution (2048 1536)
"cameras/thermal" SET Camera renderingPath "UsePlayerSettings"
"cameras/thermal" ADD Thermal.ThermalCamera
"cameras/thermal" SET Thermal.ThermalCamera enabled false
"cameras/thermal" ADD CameraFilterPack_Pixelisation_DeepOilPaintHQ
"cameras/thermal" SET CameraFilterPack_Pixelisation_DeepOilPaintHQ enabled false
"cameras/thermal" SET CameraFilterPack_Pixelisation_DeepOilPaintHQ _FixDistance 10.6 _Distance 0.06 _Size 0.481 Intensity 0.6 enabled true
"cameras/thermal" ADD CameraFilterPack_Blur_Noise
"cameras/thermal" SET CameraFilterPack_Blur_Noise Distance (2 1) enabled true
"cameras/thermal" ADD Thermal.GlobalTreeSettings
"cameras/thermal" SET Thermal.GlobalTreeSettings temperature 8 temperatureBandwidth 50 temperatureMedian 0 treeLeafsHeatVariance 10 enabled true
"cameras/thermal" ADD UnityEngine.PostProcessing.PostProcessingBehaviour
"cameras/thermal" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "Thermal"
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 15 temperatureRange (9 35) maxDistanceForProbeUpdate 100 useAGC true enabled true
"cameras/thermal" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.enabled false
"cameras/thermal" SET active true
CREATE "disk1"
"disk1" SET active false
"disk1" ADD Sensors.Disk
"disk1" SET Sensors.Disk path "/tmp/"
"disk1" SET active true
"disk1" SET active false
CREATE "disk1/Cameras/camerargb"
"disk1/Cameras/camerargb" ADD Sensors.RenderCameraLink
"disk1/Cameras/camerargb" SET Sensors.RenderCameraLink target "cameras/cameraRGB"
"disk1/Cameras/camerargb" SET active true
CREATE "disk1/Cameras/segmentation"
"disk1/Cameras/segmentation" ADD Sensors.RenderCameraLink
"disk1/Cameras/segmentation" SET Sensors.RenderCameraLink target "cameras/segmentation"
"disk1/Cameras/segmentation" SET active true
CREATE "disk1/Cameras/depth"
"disk1/Cameras/depth" ADD Sensors.RenderCameraLink
"disk1/Cameras/depth" SET Sensors.RenderCameraLink target "cameras/depth"
"disk1/Cameras/depth" SET Sensors.RenderCameraLink outputType "DEPTH"
"disk1/Cameras/depth" SET active true
CREATE "disk1/Cameras/thermal"
"disk1/Cameras/thermal" ADD Sensors.RenderCameraLink
"disk1/Cameras/thermal" SET Sensors.RenderCameraLink target "cameras/thermal"
"disk1/Cameras/thermal" SET active true
"disk1" SET active true
CREATE "spawner/city/ground/container"
"spawner/city/ground/container" SET active false
"spawner/city/ground/container" ADD RandomProps.Torus
"spawner/city/ground/container" ADD RandomProps.PropArea
"spawner/city/ground" ADD Thermal.ThermalObjectBehaviour
"spawner/city/ground" SET Thermal.ThermalObjectBehaviour profile "DefaultThermalProfile"
"spawner/city/ground/container" ADD Thermal.ThermalObjectOverride
"RandomProps.Random.instance" SET seed 666
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
"spawner/humans_0" ADD Thermal.ThermalObjectBehaviour
"spawner/humans_0" SET Thermal.ThermalObjectBehaviour profile "DefaultThermalProfile"
"spawner/humans_0/container" ADD Thermal.ThermalObjectOverride
"RandomProps.Random.instance" SET seed 666
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
"spawner/city/nature/trees" ADD Thermal.ThermalObjectBehaviour
"spawner/city/nature/trees" SET Thermal.ThermalObjectBehaviour profile "DefaultThermalProfile"
"spawner/city/nature/trees/container" ADD Thermal.ThermalObjectOverride
"RandomProps.Random.instance" SET seed 666
"spawner/city/nature/trees/container" SET RandomProps.PropArea tags "tree"
"spawner/city/nature/trees/container" SET RandomProps.PropArea async false numberOfProps 313 collisionCheck false stickToGround false 
"spawner/city/nature/trees/container" SET RandomProps.Torus innerRadius 30
"spawner/city/nature/trees/container" SET RandomProps.Torus radius 50
"spawner/city/nature/trees/container" SET Transform position (0 0 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/city/nature/trees/container" SET active true
"spawner/city/nature/trees" SET active true
CREATE "spawner/city/buildings/container"
"spawner/city/buildings/container" SET active false
"spawner/city/buildings/container" ADD RandomProps.Torus
"spawner/city/buildings/container" ADD RandomProps.PropArea
"spawner/city/buildings" ADD Thermal.ThermalObjectBehaviour
"spawner/city/buildings" SET Thermal.ThermalObjectBehaviour profile "DefaultThermalProfile"
"spawner/city/buildings/container" ADD Thermal.ThermalObjectOverride
"RandomProps.Random.instance" SET seed 666
"spawner/city/buildings/container" SET RandomProps.PropArea tags "building"
"spawner/city/buildings/container" SET RandomProps.PropArea async false numberOfProps 51 collisionCheck false stickToGround false 
"spawner/city/buildings/container" SET RandomProps.Torus innerRadius 300
"spawner/city/buildings/container" SET RandomProps.Torus radius 400
"spawner/city/buildings/container" SET Transform position (0 0 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/city/buildings/container" SET active true
"spawner/city/buildings" SET active true
CREATE "spawner/animals/birds/container"
"spawner/animals/birds/container" SET active false
"spawner/animals/birds/container" ADD RandomProps.Torus
"spawner/animals/birds/container" ADD RandomProps.PropArea
"spawner/animals/birds" ADD Thermal.ThermalObjectBehaviour
"spawner/animals/birds" SET Thermal.ThermalObjectBehaviour profile "DefaultThermalProfile"
"spawner/animals/birds/container" ADD Thermal.ThermalObjectOverride
"RandomProps.Random.instance" SET seed 666
"spawner/animals/birds/container" SET RandomProps.PropArea tags "bird"
"spawner/animals/birds/container" SET RandomProps.PropArea async false numberOfProps 61 collisionCheck true stickToGround false 
"spawner/animals/birds/container" SET RandomProps.Torus innerRadius 0
"spawner/animals/birds/container" SET RandomProps.Torus radius 120
"spawner/animals/birds/container" SET Transform position (0 93 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/animals/birds/container" SET active true
"spawner/animals/birds" SET active true
CREATE "spawner/cars/container"
"spawner/cars/container" SET active false
"spawner/cars/container" ADD RandomProps.Torus
"spawner/cars/container" ADD RandomProps.PropArea
"spawner/cars" ADD Thermal.ThermalObjectBehaviour
"spawner/cars" SET Thermal.ThermalObjectBehaviour profile "DefaultThermalProfile"
"RandomProps.Random.instance" SET seed 666
"spawner/cars/container" SET RandomProps.PropArea tags "car, +thermal"
"spawner/cars/container" SET RandomProps.PropArea async false numberOfProps 75 collisionCheck false stickToGround false 
"spawner/cars/container" SET RandomProps.Torus innerRadius 5
"spawner/cars/container" SET RandomProps.Torus radius 50
"spawner/cars/container" SET Transform position (0 0 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/cars/container" ADD RandomProps.SpawnerRandomizers.RandomColor
"spawner/cars/container" SET RandomProps.SpawnerRandomizers.RandomColor randomMethod "FromList"
"spawner/cars/container" PUSH RandomProps.SpawnerRandomizers.RandomColor availableColors "#AEEF2CFF" "#12DCBAFF" "#6B713BFF" "#653813FF" "#B6208FFF" "#7DA73FFF" "#00D6D8FF" "#2E0D7BFF" "#08DE3AFF" "#78EDB3FF" "#DD9DD1FF" "#29CA96FF" "#FE719DFF" "#4BA282FF" "#4AEA4EFF" "#66E9E3FF"
"spawner/cars/container" PUSH RandomProps.SpawnerRandomizers.RandomColor colorsWeights 14
"spawner/cars/container" SET active true
"spawner/cars" SET active true
CREATE "spawner/roadsigns/container"
"spawner/roadsigns/container" SET active false
"spawner/roadsigns/container" ADD RandomProps.Torus
"spawner/roadsigns/container" ADD RandomProps.PropArea
"spawner/roadsigns" ADD Thermal.ThermalObjectBehaviour
"spawner/roadsigns" SET Thermal.ThermalObjectBehaviour profile "DefaultThermalProfile"
"spawner/roadsigns/container" ADD Thermal.ThermalObjectOverride
"RandomProps.Random.instance" SET seed 666
"spawner/roadsigns/container" SET RandomProps.PropArea tags "roadsign"
"spawner/roadsigns/container" SET RandomProps.PropArea async false numberOfProps 250 collisionCheck false stickToGround false 
"spawner/roadsigns/container" SET RandomProps.Torus innerRadius 15
"spawner/roadsigns/container" SET RandomProps.Torus radius 80
"spawner/roadsigns/container" SET Transform position (0 0 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/roadsigns/container" SET active true
"spawner/roadsigns" SET active true
CREATE "Drones/DJI_Phantom_4_Pro/DJI_Phantom_4_Pron" FROM "drones" AS "drone/drone0/drone0"
"drone/drone0" ADD Segmentation.ClassGroup
"drone/drone0" SET active false
"drone/drone0" ADD Thermal.ThermalObjectBehaviour
"drone/drone0" SET Thermal.ThermalObjectBehaviour profile "DefaultThermalProfile"
"drone/drone0/drone0/bottom" ADD Thermal.ThermalObjectOverride
"drone/drone0/drone0/motors" ADD Thermal.ThermalObjectOverride
"drone/drone0/drone0" ADD Thermal.ThermalObjectOverride
"drone/drone0" SET Segmentation.ClassGroup itemsClassName "drone0"
"drone/drone0/drone0" SET Transform position (0 1 0)
CREATE "Drones/DJI Spreading Wings S1000 Professional Octocopter/Spreading_Wings_S1000" FROM "drones" AS "drone/drone1/drone1"
"drone/drone1" ADD Segmentation.ClassGroup
"drone/drone1" SET active false
"drone/drone1" ADD Thermal.ThermalObjectBehaviour
"drone/drone1" SET Thermal.ThermalObjectBehaviour profile "DefaultThermalProfile"
"drone/drone1/drone1/Motor_01" ADD Thermal.ThermalObjectOverride
"drone/drone1/drone1/Motor_02" ADD Thermal.ThermalObjectOverride
"drone/drone1/drone1/Motor_03" ADD Thermal.ThermalObjectOverride
"drone/drone1/drone1/Motor_04" ADD Thermal.ThermalObjectOverride
"drone/drone1/drone1/Motor_05" ADD Thermal.ThermalObjectOverride
"drone/drone1/drone1/Motor_06" ADD Thermal.ThermalObjectOverride
"drone/drone1/drone1/Motor_07" ADD Thermal.ThermalObjectOverride
"drone/drone1/drone1/Motor_08" ADD Thermal.ThermalObjectOverride
"drone/drone1/drone1" ADD Thermal.ThermalObjectOverride
"drone/drone1" SET Segmentation.ClassGroup itemsClassName "drone1"
"drone/drone1/drone1" SET Transform position (0 2 0)
CREATE "Drones/Parrot Disco Drone/Parrot_Disco" FROM "drones" AS "drone/drone2/drone2"
"drone/drone2" ADD Segmentation.ClassGroup
"drone/drone2" SET active false
"drone/drone2/drone2" ADD Thermal.ThermalObjectBehaviour
"drone/drone2/drone2" SET Thermal.ThermalObjectBehaviour profile "DefaultThermalProfile"
"drone/drone2/drone2/Engine" ADD Thermal.ThermalObjectOverride
"drone/drone2/drone2/Engine_Element" ADD Thermal.ThermalObjectOverride
"drone/drone2/drone2" ADD Thermal.ThermalObjectOverride
"drone/drone2" SET Segmentation.ClassGroup itemsClassName "drone2"
"drone/drone2/drone2" SET Transform position (0 3 0)
"drone/drone0/drone0" ADD RandomProps.RandomColor
"drone/drone0/drone0" SET RandomProps.RandomColor randomMethod "FromList"
"drone/drone0/drone0" PUSH RandomProps.RandomColor availableColors "#18A7EEFF" "#4E20D9FF" "#7AF9D7FF" "#E53DF8FF" "#8C7AC8FF" "#08F725FF" "#8B52EAFF" "#E184A4FF" "#31EB4FFF" "#2031CAFF" "#4B427EFF" "#2C00CCFF" "#A25DFEFF" "#DD496AFF" "#075DFBFF" "#8464BCFF"
"drone/drone0/drone0" PUSH RandomProps.RandomColor colorsWeights 14
"drone/drone1/drone1" ADD RandomProps.RandomColor
"drone/drone1/drone1" SET RandomProps.RandomColor randomMethod "FromList"
"drone/drone1/drone1" PUSH RandomProps.RandomColor availableColors "#5A74AFFF" "#8085BDFF" "#418DF0FF" "#AF89D2FF" "#48FACDFF" "#DAF1B5FF" "#E3A080FF" "#0F37C7FF" "#22B0A1FF" "#E3E19CFF" "#19CDEFFF" "#ED9354FF" "#10E99AFF" "#D9790CFF" "#98FD5AFF" "#E0EAC7FF"
"drone/drone1/drone1" PUSH RandomProps.RandomColor colorsWeights 14
"drone/drone2/drone2" ADD RandomProps.RandomColor
"drone/drone2/drone2" SET RandomProps.RandomColor randomMethod "FromList"
"drone/drone2/drone2" PUSH RandomProps.RandomColor availableColors "#520FA9FF" "#1B37E2FF" "#F9DFAAFF" "#13AC1AFF" "#94656FFF" "#00626CFF" "#976F16FF" "#D69F84FF" "#7AC748FF" "#447E08FF" "#165658FF" "#73C7E8FF" "#E7913CFF" "#A85702FF" "#7FEF3DFF" "#F2F79CFF"
"drone/drone2/drone2" PUSH RandomProps.RandomColor colorsWeights 14
"drone/drone0" SET active true
"drone/drone0/drone0" SET active true
"drone/drone1" SET active true
"drone/drone1/drone1" SET active true
"drone/drone2" SET active true
"drone/drone2/drone2" SET active true
