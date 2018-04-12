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
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "Savannah"
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
"cameras/segmentation" PUSH Segmentation.Segmentation boundingBoxesFilter "Drone"
"cameras/segmentation" ADD Segmentation.LookUpTable
"cameras/segmentation" PUSH Segmentation.LookUpTable classes "Void"
"cameras/segmentation" PUSH Segmentation.LookUpTable colors "black"
"cameras/segmentation" EXECUTE Segmentation.Segmentation DefineClass "Drone"
"cameras/segmentation" PUSH Segmentation.LookUpTable classes "Drone"
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
"cameras" SET Transform position (0 5 -30)
CREATE "Savannah" FROM "savannah" AS "test"
"test" SET Transform position (-5000 -180 -5000)
"test" SET active true
CREATE "spawner/city/nature/trees/container"
"spawner/city/nature/trees/container" SET active false
"spawner/city/nature/trees/container" ADD RandomProps.Torus
"spawner/city/nature/trees/container" ADD RandomProps.PropArea
"spawner/city/nature/trees/container" SET RandomProps.PropArea tags "tree"
"spawner/city/nature/trees/container" SET RandomProps.PropArea async false numberOfProps 150~400 collisionCheck true stickToGround true 
"spawner/city/nature/trees/container" SET RandomProps.Torus innerRadius 30~50
"spawner/city/nature/trees/container" SET RandomProps.Torus radius 80
"spawner/city/nature/trees/container" SET Transform position (0 5 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/city/nature/trees/container" SET active true
"spawner/city/nature/trees" SET active true
CREATE "spawner/animals/container"
"spawner/animals/container" SET active false
"spawner/animals/container" ADD RandomProps.Torus
"spawner/animals/container" ADD RandomProps.PropArea
"spawner/animals/container" SET RandomProps.PropArea tags "animal"
"spawner/animals/container" SET RandomProps.PropArea async false numberOfProps 200~350 collisionCheck true stickToGround true 
"spawner/animals/container" SET RandomProps.Torus innerRadius 0
"spawner/animals/container" SET RandomProps.Torus radius 40~80
"spawner/animals/container" SET Transform position (0 5 0) eulerAngles (0 0 0) localScale (1 1 1)
"cameras" SET Orbit target "spawner/animals/container"
"spawner/animals/container" SET active true
"spawner/animals" SET active true
CREATE "spawner/drones/Parrot_Disco/container"
"spawner/drones/Parrot_Disco/container" SET active false
"spawner/drones/Parrot_Disco/container" ADD RandomProps.Torus
"spawner/drones/Parrot_Disco/container" ADD RandomProps.PropArea
"spawner/drones/Parrot_Disco/container" SET RandomProps.PropArea tags "Parrot Disco"
"spawner/drones/Parrot_Disco/container" SET RandomProps.PropArea async false numberOfProps 40 collisionCheck true stickToGround false 
"spawner/drones/Parrot_Disco/container" SET RandomProps.Torus innerRadius 5
"spawner/drones/Parrot_Disco/container" SET RandomProps.Torus radius 21
"spawner/drones/Parrot_Disco/container" SET Transform position (0 0 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/drones/Parrot_Disco/container" ADD Segmentation.ClassGroup
"spawner/drones/Parrot_Disco/container" SET Segmentation.ClassGroup itemsClassName "Drone"
"spawner/drones/Parrot_Disco/container" SET active true
"spawner/drones/Parrot_Disco" SET active true