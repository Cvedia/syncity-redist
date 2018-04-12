CREATE "cameras"
"cameras" SET active false
"cameras" SET Transform position (-6 1 -50)
"cameras" SET Transform eulerAngles (0 0 0)
"Canvas/Cameras/Viewport/Content" SET UI.GridLayoutGroup cellSize (1024 768)
"Canvas" SET active true
CREATE "cameras/segmentation"
"cameras/segmentation" SET active false
"cameras/segmentation" ADD Camera
"cameras/segmentation" SET Camera near 0.3 far 1000 fieldOfView 60
"cameras/segmentation" ADD Sensors.RenderCamera
"cameras/segmentation" SET Sensors.RenderCamera format "ARGB32" resolution (1024 1024)
"cameras/segmentation" SET Camera renderingPath "UsePlayerSettings" targetTexture.filterMode "Point"
"cameras/segmentation" ADD Segmentation.Segmentation
"cameras/segmentation" SET Segmentation.Segmentation minimumObjectVisibility 0 outputType "Auto" boundingBoxesExtensionAmount 0 transparencyCutout 0 
"cameras/segmentation" EXECUTE Segmentation.Segmentation DefineClass "Void"
"cameras/segmentation" PUSH Segmentation.Segmentation boundingBoxesFilter "DRONE"
"cameras/segmentation" ADD Segmentation.LookUpTable
"cameras/segmentation" PUSH Segmentation.LookUpTable classes "Void"
"cameras/segmentation" PUSH Segmentation.LookUpTable colors "black"
"cameras/segmentation" EXECUTE Segmentation.Segmentation DefineClass "DRONE"
"cameras/segmentation" PUSH Segmentation.LookUpTable classes "DRONE"
"cameras/segmentation" PUSH Segmentation.LookUpTable colors "red"
"cameras/segmentation" EXECUTE Segmentation.LookUpTable MarkTextureDirty
"cameras/segmentation" SET active true
CREATE "cameras/depth"
"cameras/depth" SET active false
"cameras/depth" ADD Camera
"cameras/depth" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "DeferredShading"
"cameras/depth" ADD Sensors.RenderCamera
"cameras/depth" SET Sensors.RenderCamera format "RFloat" resolution (1024 1024)
"cameras/depth" ADD Cameras.RenderDepthBufferSimple
"cameras/depth" SET Cameras.RenderDepthBufferSimple outputMode "Linear01Depth" transparencyCutout 0
"cameras/depth" SET active true
CREATE "cameras/cameraRGB"
"cameras/cameraRGB" SET active false
"cameras/cameraRGB" ADD Camera
"cameras/cameraRGB" SET Camera near 0.3 far 1000 fieldOfView 60
"cameras/cameraRGB" ADD Sensors.RenderCamera
"cameras/cameraRGB" SET Sensors.RenderCamera format "ARGB32" resolution (1024 1024)
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
"disk1" SET active true
"disk1/Cameras/depth" SET Sensors.RenderCameraLink outputType "DEPTH"
"cameras/cameraRGB" ADD LCP
"cameras/cameraRGB" SET LCP enabled false redParam1 0.05 redParam2 0.05 enabled true
"disk1/Cameras/camerargb" SET active false
"disk1/Cameras/camerargb" SET Sensors.RenderCameraLink videoFilter true
"disk1/Cameras/camerargb" ADD Sensors.Augmentations
"disk1/Cameras/camerargb" SET active true
CREATE "spawner/city/ground/container"
"spawner/city/ground/container" SET active false
"spawner/city/ground/container" ADD RandomProps.Torus
"spawner/city/ground/container" ADD RandomProps.PropArea
"RandomProps.Random.instance" SET seed -1
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
"RandomProps.Random.instance" SET seed -1
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
"RandomProps.Random.instance" SET seed -1
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
"RandomProps.Random.instance" SET seed -1
"spawner/city/buildings/container" SET RandomProps.PropArea tags "building"
"spawner/city/buildings/container" SET RandomProps.PropArea async false numberOfProps 100 collisionCheck false stickToGround false 
"spawner/city/buildings/container" SET RandomProps.Torus radius 120
"spawner/city/buildings/container" SET RandomProps.Torus innerRadius 80
"spawner/city/buildings/container" SET Transform position (0 0 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/city/buildings/container" SET active true
"spawner/city/buildings" SET active true
CREATE "spawner/animals/birds/container"
"spawner/animals/birds/container" SET active false
"spawner/animals/birds/container" ADD RandomProps.Torus
"spawner/animals/birds/container" ADD RandomProps.PropArea
"RandomProps.Random.instance" SET seed -1
"spawner/animals/birds/container" SET RandomProps.PropArea tags "bird"
"spawner/animals/birds/container" SET RandomProps.PropArea async false numberOfProps 73 collisionCheck true stickToGround false 
"spawner/animals/birds/container" SET RandomProps.Torus radius 120
"spawner/animals/birds/container" SET RandomProps.Torus innerRadius 0
"spawner/animals/birds/container" SET Transform position (0 77 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/animals/birds/container" SET active true
"spawner/animals/birds" SET active true
CREATE "spawner/cars/container"
"spawner/cars/container" SET active false
"spawner/cars/container" ADD RandomProps.Torus
"spawner/cars/container" ADD RandomProps.PropArea
"RandomProps.Random.instance" SET seed -1
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
"RandomProps.Random.instance" SET seed -1
"spawner/roadsigns/container" SET RandomProps.PropArea tags "roadsign"
"spawner/roadsigns/container" SET RandomProps.PropArea async false numberOfProps 250 collisionCheck false stickToGround false 
"spawner/roadsigns/container" SET RandomProps.Torus radius 80
"spawner/roadsigns/container" SET RandomProps.Torus innerRadius 15
"spawner/roadsigns/container" SET Transform position (0 0 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/roadsigns/container" SET active true
"spawner/roadsigns" SET active true
CREATE "cameras/spawner/drones/container"
"cameras/spawner/drones/container" SET active false
"cameras/spawner/drones/container" ADD RandomProps.Frustum
"cameras/spawner/drones/container" ADD RandomProps.PropArea
"RandomProps.Random.instance" SET seed -1
"cameras/spawner/drones/container" SET RandomProps.PropArea tags "blurred"
"cameras/spawner/drones/container" SET RandomProps.Frustum minDistance 2
"cameras/spawner/drones/container" SET RandomProps.Frustum maxDistance 6
"cameras/spawner/drones/container" SET RandomProps.PropArea async false numberOfProps 2 collisionCheck true stickToGround false 
"cameras/spawner/drones/container" SET RandomProps.Frustum scaleBack 0.25
"cameras/spawner/drones/container" SET RandomProps.Frustum allowEdge false
"cameras/spawner/drones/container" SET RandomProps.Frustum cam "cameras/cameraRGB"
"cameras/spawner/drones/container" SET Transform eulerAngles (0 0 0) localScale (1 1 1)
"cameras/spawner/drones/container" ADD Segmentation.ClassGroup
"cameras/spawner/drones/container" SET Segmentation.ClassGroup itemsClassName "DRONE"
"cameras/spawner/drones/container" ADD RandomProps.SpawnerRandomizers.RandomColor
"cameras/spawner/drones/container" SET RandomProps.SpawnerRandomizers.RandomColor randomMethod "Random"
"cameras/spawner/drones/container" PUSH RandomProps.SpawnerRandomizers.RandomColor availableColors "#AFFD59FF"
"cameras/spawner/drones/container" SET RandomProps.SpawnerRandomizers.RandomColor partsNames "chassis,legs,motors,battery,bolts,sensors_caps,sensors,camera,blades"
"cameras/spawner/drones/container" PUSH RandomProps.SpawnerRandomizers.RandomColor colorsWeights 14
"cameras/spawner/drones/container" SET active true
"cameras/spawner/drones" SET active true
"cameras/cameraRGB" SET Camera enabled true
"cameras" SET Transform position (0 5 0) eulerAngles (-20~0 0 0)
"EnviroSky" EXECUTE EnviroSky ChangeWeather "Cloudy 2"
"EnviroSky" SET EnviroSky cloudsMode "Volume" fogSettings.heightFog false fogSettings.distanceFog false cloudsSettings.globalCloudCoverage -0.04
"cameras/cameraRGB" SET Sensors.RenderCamera alwaysOn false
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled false
"disk1" SET Sensors.Disk counter 1
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.bloom.enabled false
"cameras/spawner" SET Transform localScale (0.75 0.75 0.75)
