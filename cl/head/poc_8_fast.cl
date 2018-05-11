CREATE "cameras"
"cameras" SET active false
"cameras" SET Transform position (-6 1 -50) eulerAngles (0 0 0)
CREATE "cameras/cameraRGB"
"cameras/cameraRGB" SET active false
"cameras/cameraRGB" ADD Camera AudioListener
"cameras/cameraRGB" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings"
CREATE "EnviroSky" AS "EnviroSky"
"EnviroSky" SET EnviroSky Player "cameras" PlayerCamera "cameras/cameraRGB" GameTime.ProgressTime "None" weatherSettings.cloudTransitionSpeed 100 weatherSettings.effectTransitionSpeed 100 weatherSettings.fogTransitionSpeed 100 
"EnviroSky" EXECUTE EnviroSky AssignAndStart "cameras/cameraRGB" "cameras/cameraRGB"
"EnviroSky" SET active true
"cameras/cameraRGB" SET active true
[UI.Window] ShowFromCamera "cameras/cameraRGB" AS "cameraRGB" WITH 1024 768 24 "ARGB32" "Default"
"cameras" SET active true
"cameras/cameraRGB" ADD UnityEngine.PostProcessing.PostProcessingBehaviour
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "EnviroFX"
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled false
"Segmentation.Profile.instance" PUSH classes "Void" "Car"
CREATE "cameras/segmentation"
"cameras/segmentation" SET active false
"cameras/segmentation" ADD Camera SegmentationCamera Segmentation.Output.BoundingBoxes Segmentation.Output.ClassColors
"cameras/segmentation" SET SegmentationCamera transparencyCutout 0
"cameras/segmentation" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings" targetTexture.filterMode "Point" 
"cameras/segmentation" SET Segmentation.Output.BoundingBoxes minimumObjectVisibility 0 extensionAmount 0 minimumPixelsCount 1 
"cameras/segmentation" ADD Segmentation.Output.FilteredBoundingBoxes
"cameras/segmentation" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Car"
"cameras/segmentation" SET active true
[UI.Window] ShowFromCamera "cameras/segmentation" AS "segmentation" WITH 1024 768 24 "ARGB32" "Default"
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
CREATE "spawner/city/nature/trees/container"
"spawner/city/nature/trees/container" SET active false
"spawner/city/nature/trees/container" ADD RandomProps.Torus
"spawner/city/nature/trees/container" ADD RandomProps.PropArea
"spawner/city/nature/trees/container" SET RandomProps.PropArea tags "tree"
"spawner/city/nature/trees/container" SET RandomProps.PropArea async false numberOfProps 50 collisionCheck false stickToGround false 
"spawner/city/nature/trees/container" SET RandomProps.Torus innerRadius 30
"spawner/city/nature/trees/container" SET RandomProps.Torus radius 80
"spawner/city/nature/trees/container" SET Transform position (0 10 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/city/nature/trees/container" SET active true
"spawner/city/nature/trees" SET active true
CREATE "spawner/city/signs/container"
"spawner/city/signs/container" SET active false
"spawner/city/signs/container" ADD RandomProps.Torus
"spawner/city/signs/container" ADD RandomProps.PropArea
"spawner/city/signs/container" SET RandomProps.PropArea tags "sign"
"spawner/city/signs/container" SET RandomProps.PropArea async false numberOfProps 10 collisionCheck true stickToGround false 
"spawner/city/signs/container" SET RandomProps.Torus innerRadius 0
"spawner/city/signs/container" SET RandomProps.Torus radius 35
"spawner/city/signs/container" SET Transform position (0 10 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/city/signs/container" SET active true
"spawner/city/signs" SET active true
CREATE "spawner/city/buildings/container"
"spawner/city/buildings/container" SET active false
"spawner/city/buildings/container" ADD RandomProps.Torus
"spawner/city/buildings/container" ADD RandomProps.PropArea
"spawner/city/buildings/container" SET RandomProps.PropArea tags "building"
"spawner/city/buildings/container" SET RandomProps.PropArea async false numberOfProps 10 collisionCheck true stickToGround false 
"spawner/city/buildings/container" SET RandomProps.Torus innerRadius 80
"spawner/city/buildings/container" SET RandomProps.Torus radius 335
"spawner/city/buildings/container" SET Transform position (0 10 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/city/buildings/container" SET active true
"spawner/city/buildings" SET active true
CREATE "spawner/cars/container"
"spawner/cars/container" SET active false
"spawner/cars/container" ADD RandomProps.Torus
"spawner/cars/container" ADD RandomProps.PropArea
"spawner/cars/container" SET RandomProps.PropArea tags "car"
"spawner/cars/container" SET RandomProps.PropArea async false numberOfProps 10 collisionCheck true stickToGround false 
"spawner/cars/container" SET RandomProps.Torus innerRadius 0
"spawner/cars/container" SET RandomProps.Torus radius 50
"spawner/cars/container" SET Transform position (0 10 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/cars/container" ADD Segmentation.Class
"spawner/cars/container" SET Segmentation.Class className "Car"
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
"spawner/city/ground_0/container" SET RandomProps.Torus radius 50
"spawner/city/ground_0/container" SET Transform position (0 0 0) eulerAngles (0 0 0) localScale (2 2 2)
"spawner/city/ground_0/container" SET active true
"spawner/city/ground_0" SET active true
CREATE "spawner/city/ground_1/container"
"spawner/city/ground_1/container" SET active false
"spawner/city/ground_1/container" ADD RandomProps.Torus
"spawner/city/ground_1/container" ADD RandomProps.PropArea
"spawner/city/ground_1/container" SET RandomProps.PropArea tags "ground"
"spawner/city/ground_1/container" SET RandomProps.PropArea async false numberOfProps 3 collisionCheck false stickToGround false 
"spawner/city/ground_1/container" SET RandomProps.Torus innerRadius 0
"spawner/city/ground_1/container" SET RandomProps.Torus radius 50
"spawner/city/ground_1/container" SET Transform position (0 1 0) eulerAngles (0 0 0) localScale (2 2 2)
"spawner/city/ground_1/container" SET active true
"spawner/city/ground_1" SET active true
CREATE "spawner/city/ground_2/container"
"spawner/city/ground_2/container" SET active false
"spawner/city/ground_2/container" ADD RandomProps.Torus
"spawner/city/ground_2/container" ADD RandomProps.PropArea
"spawner/city/ground_2/container" SET RandomProps.PropArea tags "ground"
"spawner/city/ground_2/container" SET RandomProps.PropArea async false numberOfProps 3 collisionCheck false stickToGround false 
"spawner/city/ground_2/container" SET RandomProps.Torus innerRadius 0
"spawner/city/ground_2/container" SET RandomProps.Torus radius 50
"spawner/city/ground_2/container" SET Transform position (0 2 0) eulerAngles (0 0 0) localScale (2 2 2)
"spawner/city/ground_2/container" SET active true
"spawner/city/ground_2" SET active true
CREATE "spawner/city/ground_3/container"
"spawner/city/ground_3/container" SET active false
"spawner/city/ground_3/container" ADD RandomProps.Torus
"spawner/city/ground_3/container" ADD RandomProps.PropArea
"spawner/city/ground_3/container" SET RandomProps.PropArea tags "ground"
"spawner/city/ground_3/container" SET RandomProps.PropArea async false numberOfProps 3 collisionCheck false stickToGround false 
"spawner/city/ground_3/container" SET RandomProps.Torus innerRadius 0
"spawner/city/ground_3/container" SET RandomProps.Torus radius 50
"spawner/city/ground_3/container" SET Transform position (0 3 0) eulerAngles (0 0 0) localScale (2 2 2)
"spawner/city/ground_3/container" SET active true
"spawner/city/ground_3" SET active true
CREATE "spawner/city/ground_4/container"
"spawner/city/ground_4/container" SET active false
"spawner/city/ground_4/container" ADD RandomProps.Torus
"spawner/city/ground_4/container" ADD RandomProps.PropArea
"spawner/city/ground_4/container" SET RandomProps.PropArea tags "ground"
"spawner/city/ground_4/container" SET RandomProps.PropArea async false numberOfProps 3 collisionCheck false stickToGround false 
"spawner/city/ground_4/container" SET RandomProps.Torus innerRadius 0
"spawner/city/ground_4/container" SET RandomProps.Torus radius 50
"spawner/city/ground_4/container" SET Transform position (0 4 0) eulerAngles (0 0 0) localScale (2 2 2)
"spawner/city/ground_4/container" SET active true
"spawner/city/ground_4" SET active true
CREATE "spawner/city/ground_5/container"
"spawner/city/ground_5/container" SET active false
"spawner/city/ground_5/container" ADD RandomProps.Torus
"spawner/city/ground_5/container" ADD RandomProps.PropArea
"spawner/city/ground_5/container" SET RandomProps.PropArea tags "ground"
"spawner/city/ground_5/container" SET RandomProps.PropArea async false numberOfProps 3 collisionCheck false stickToGround false 
"spawner/city/ground_5/container" SET RandomProps.Torus innerRadius 0
"spawner/city/ground_5/container" SET RandomProps.Torus radius 50
"spawner/city/ground_5/container" SET Transform position (0 5 0) eulerAngles (0 0 0) localScale (2 2 2)
"spawner/city/ground_5/container" SET active true
"spawner/city/ground_5" SET active true
CREATE "spawner/city/ground_6/container"
"spawner/city/ground_6/container" SET active false
"spawner/city/ground_6/container" ADD RandomProps.Torus
"spawner/city/ground_6/container" ADD RandomProps.PropArea
"spawner/city/ground_6/container" SET RandomProps.PropArea tags "ground"
"spawner/city/ground_6/container" SET RandomProps.PropArea async false numberOfProps 3 collisionCheck false stickToGround false 
"spawner/city/ground_6/container" SET RandomProps.Torus innerRadius 0
"spawner/city/ground_6/container" SET RandomProps.Torus radius 50
"spawner/city/ground_6/container" SET Transform position (0 6 0) eulerAngles (0 0 0) localScale (2 2 2)
"spawner/city/ground_6/container" SET active true
"spawner/city/ground_6" SET active true
CREATE "spawner/city/ground_7/container"
"spawner/city/ground_7/container" SET active false
"spawner/city/ground_7/container" ADD RandomProps.Torus
"spawner/city/ground_7/container" ADD RandomProps.PropArea
"spawner/city/ground_7/container" SET RandomProps.PropArea tags "ground"
"spawner/city/ground_7/container" SET RandomProps.PropArea async false numberOfProps 3 collisionCheck false stickToGround false 
"spawner/city/ground_7/container" SET RandomProps.Torus innerRadius 0
"spawner/city/ground_7/container" SET RandomProps.Torus radius 50
"spawner/city/ground_7/container" SET Transform position (0 7 0) eulerAngles (0 0 0) localScale (2 2 2)
"spawner/city/ground_7/container" SET active true
"spawner/city/ground_7" SET active true
CREATE "spawner/city/ground_8/container"
"spawner/city/ground_8/container" SET active false
"spawner/city/ground_8/container" ADD RandomProps.Torus
"spawner/city/ground_8/container" ADD RandomProps.PropArea
"spawner/city/ground_8/container" SET RandomProps.PropArea tags "ground"
"spawner/city/ground_8/container" SET RandomProps.PropArea async false numberOfProps 3 collisionCheck false stickToGround false 
"spawner/city/ground_8/container" SET RandomProps.Torus innerRadius 0
"spawner/city/ground_8/container" SET RandomProps.Torus radius 50
"spawner/city/ground_8/container" SET Transform position (0 8 0) eulerAngles (0 0 0) localScale (2 2 2)
"spawner/city/ground_8/container" SET active true
"spawner/city/ground_8" SET active true
