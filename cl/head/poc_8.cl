CREATE "cameras"
"cameras" SET active false
"cameras" SET Transform position (-6 1 -50)
"cameras" SET Transform eulerAngles (0 0 0)
"cameras" ADD Orbit
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
"cameras/segmentation" PUSH Segmentation.Segmentation boundingBoxesFilter "Car"
"cameras/segmentation" ADD Segmentation.LookUpTable
"cameras/segmentation" PUSH Segmentation.LookUpTable classes "Void"
"cameras/segmentation" PUSH Segmentation.LookUpTable colors "black"
"cameras/segmentation" EXECUTE Segmentation.Segmentation DefineClass "Car"
"cameras/segmentation" PUSH Segmentation.LookUpTable classes "Car"
"cameras/segmentation" PUSH Segmentation.LookUpTable colors "blue"
"cameras/segmentation" EXECUTE Segmentation.LookUpTable MarkTextureDirty
"cameras/segmentation" SET active true
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
"disk1" SET active true
CREATE "spawner/city/nature/trees/container"
"spawner/city/nature/trees/container" SET active false
"spawner/city/nature/trees/container" ADD RandomProps.Torus
"spawner/city/nature/trees/container" ADD RandomProps.PropArea
"spawner/city/nature/trees/container" SET RandomProps.PropArea tags "tree"
"spawner/city/nature/trees/container" SET RandomProps.PropArea async false numberOfProps 100~350 collisionCheck false stickToGround false 
"spawner/city/nature/trees/container" SET RandomProps.Torus innerRadius 30~50
"spawner/city/nature/trees/container" SET RandomProps.Torus radius 80
"spawner/city/nature/trees/container" SET Transform position (0 10 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/city/nature/trees/container" SET active true
"spawner/city/nature/trees" SET active true
CREATE "spawner/city/signs/container"
"spawner/city/signs/container" SET active false
"spawner/city/signs/container" ADD RandomProps.Torus
"spawner/city/signs/container" ADD RandomProps.PropArea
"spawner/city/signs/container" SET RandomProps.PropArea tags "sign"
"spawner/city/signs/container" SET RandomProps.PropArea async false numberOfProps 80~250 collisionCheck true stickToGround false 
"spawner/city/signs/container" SET RandomProps.Torus innerRadius 0
"spawner/city/signs/container" SET RandomProps.Torus radius 15~40
"spawner/city/signs/container" SET Transform position (0 10 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/city/signs/container" SET active true
"spawner/city/signs" SET active true
CREATE "spawner/animals/container"
"spawner/animals/container" SET active false
"spawner/animals/container" ADD RandomProps.Torus
"spawner/animals/container" ADD RandomProps.PropArea
"spawner/animals/container" SET RandomProps.PropArea tags "animal"
"spawner/animals/container" SET RandomProps.PropArea async false numberOfProps 150~250 collisionCheck true stickToGround false 
"spawner/animals/container" SET RandomProps.Torus innerRadius 0
"spawner/animals/container" SET RandomProps.Torus radius 40~80
"spawner/animals/container" SET Transform position (0 10 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/animals/container" SET active true
"spawner/animals" SET active true
CREATE "spawner/city/buildings/container"
"spawner/city/buildings/container" SET active false
"spawner/city/buildings/container" ADD RandomProps.Torus
"spawner/city/buildings/container" ADD RandomProps.PropArea
"spawner/city/buildings/container" SET RandomProps.PropArea tags "building"
"spawner/city/buildings/container" SET RandomProps.PropArea async false numberOfProps 50~150 collisionCheck true stickToGround false 
"spawner/city/buildings/container" SET RandomProps.Torus innerRadius 80~100
"spawner/city/buildings/container" SET RandomProps.Torus radius 335
"spawner/city/buildings/container" SET Transform position (0 10 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/city/buildings/container" SET active true
"spawner/city/buildings" SET active true
CREATE "spawner/cars/container"
"spawner/cars/container" SET active false
"spawner/cars/container" ADD RandomProps.Torus
"spawner/cars/container" ADD RandomProps.PropArea
"spawner/cars/container" SET RandomProps.PropArea tags "car"
"spawner/cars/container" SET RandomProps.PropArea async false numberOfProps 50~150 collisionCheck true stickToGround false 
"spawner/cars/container" SET RandomProps.Torus innerRadius 0
"spawner/cars/container" SET RandomProps.Torus radius 50
"spawner/cars/container" SET Transform position (0 10 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/cars/container" ADD Segmentation.ClassGroup
"spawner/cars/container" SET Segmentation.ClassGroup itemsClassName "Car"
"cameras" SET Orbit target "spawner/cars/container"
"spawner/cars/container" SET active true
"spawner/cars" SET active true
CREATE "spawner/city/ground_0/container"
"spawner/city/ground_0/container" SET active false
"spawner/city/ground_0/container" ADD RandomProps.Torus
"spawner/city/ground_0/container" ADD RandomProps.PropArea
"spawner/city/ground_0/container" SET RandomProps.PropArea tags "ground"
"spawner/city/ground_0/container" SET RandomProps.PropArea async false numberOfProps 3 collisionCheck false stickToGround false 
"spawner/city/ground_0/container" SET RandomProps.Torus innerRadius 0
"spawner/city/ground_0/container" SET RandomProps.Torus radius 75
"spawner/city/ground_0/container" SET Transform position (0 0 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/city/ground_0/container" SET active true
"spawner/city/ground_0" SET active true
