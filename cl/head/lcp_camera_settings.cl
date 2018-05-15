CREATE "cameras"
"cameras" SET active false
"cameras" SET Transform position (-6 1 -50) eulerAngles (0 0 0)
"cameras" ADD FlyCamera
"cameras" SET FlyCamera enabled true
CREATE "cameras/cameraRGB0"
"cameras/cameraRGB0" SET active false
"cameras/cameraRGB0" ADD Camera AudioListener
"cameras/cameraRGB0" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings"
CREATE "EnviroSky" AS "EnviroSky"
"EnviroSky" SET EnviroSky Player "cameras" PlayerCamera "cameras/cameraRGB0" GameTime.ProgressTime "None" weatherSettings.cloudTransitionSpeed 100 weatherSettings.effectTransitionSpeed 100 weatherSettings.fogTransitionSpeed 100 
"EnviroSky" EXECUTE EnviroSky AssignAndStart "cameras/cameraRGB0" "cameras/cameraRGB0"
"EnviroSky" SET active true
[UI.Window] ShowFromCamera "cameras/cameraRGB0" AS "cameraRGB0" WITH 1024 768 24 "ARGB32" "Default"
"cameras/cameraRGB0" SET active true
CREATE "cameras/cameraRGB1"
"cameras/cameraRGB1" SET active false
"cameras/cameraRGB1" ADD Camera
"cameras/cameraRGB1" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings"
[UI.Window] ShowFromCamera "cameras/cameraRGB1" AS "cameraRGB1" WITH 1024 768 24 "ARGB32" "Default"
"cameras/cameraRGB1" SET active true
CREATE "cameras/cameraRGB2"
"cameras/cameraRGB2" SET active false
"cameras/cameraRGB2" ADD Camera
"cameras/cameraRGB2" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings"
[UI.Window] ShowFromCamera "cameras/cameraRGB2" AS "cameraRGB2" WITH 1024 768 24 "ARGB32" "Default"
"cameras/cameraRGB2" SET active true
CREATE "cameras/cameraRGB3"
"cameras/cameraRGB3" SET active false
"cameras/cameraRGB3" ADD Camera
"cameras/cameraRGB3" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings"
[UI.Window] ShowFromCamera "cameras/cameraRGB3" AS "cameraRGB3" WITH 1024 768 24 "ARGB32" "Default"
"cameras/cameraRGB3" SET active true
CREATE "cameras/cameraRGB4"
"cameras/cameraRGB4" SET active false
"cameras/cameraRGB4" ADD Camera
"cameras/cameraRGB4" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings"
[UI.Window] ShowFromCamera "cameras/cameraRGB4" AS "cameraRGB4" WITH 1024 768 24 "ARGB32" "Default"
"cameras/cameraRGB4" SET active true
CREATE "cameras/cameraRGB5"
"cameras/cameraRGB5" SET active false
"cameras/cameraRGB5" ADD Camera
"cameras/cameraRGB5" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings"
[UI.Window] ShowFromCamera "cameras/cameraRGB5" AS "cameraRGB5" WITH 1024 768 24 "ARGB32" "Default"
"cameras/cameraRGB5" SET active true
"cameras" SET active true
"cameras/cameraRGB0" ADD UnityEngine.PostProcessing.PostProcessingBehaviour
"cameras/cameraRGB0" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "EnviroFX"
"cameras/cameraRGB0" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled false
"cameras/cameraRGB1" ADD UnityEngine.PostProcessing.PostProcessingBehaviour
"cameras/cameraRGB1" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "EnviroFX"
"cameras/cameraRGB1" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled false
"cameras/cameraRGB2" ADD UnityEngine.PostProcessing.PostProcessingBehaviour
"cameras/cameraRGB2" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "EnviroFX"
"cameras/cameraRGB2" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled false
"cameras/cameraRGB3" ADD UnityEngine.PostProcessing.PostProcessingBehaviour
"cameras/cameraRGB3" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "EnviroFX"
"cameras/cameraRGB3" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled false
"cameras/cameraRGB4" ADD UnityEngine.PostProcessing.PostProcessingBehaviour
"cameras/cameraRGB4" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "EnviroFX"
"cameras/cameraRGB4" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled false
"cameras/cameraRGB5" ADD UnityEngine.PostProcessing.PostProcessingBehaviour
"cameras/cameraRGB5" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "EnviroFX"
"cameras/cameraRGB5" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled false
CREATE "disk1"
"disk1" SET active false
"disk1" ADD Sensors.Disk
"disk1" SET Sensors.Disk path "/tmp/" counter 1
"disk1" SET active true
"disk1" SET active false
CREATE "disk1/Cameras/camerargb0"
"disk1/Cameras/camerargb0" ADD Sensors.RenderTextureLink
"disk1/Cameras/camerargb0" SET Sensors.RenderTextureLink target "cameraRGB0"
"disk1/Cameras/camerargb0" SET active true
CREATE "disk1/Cameras/camerargb1"
"disk1/Cameras/camerargb1" ADD Sensors.RenderTextureLink
"disk1/Cameras/camerargb1" SET Sensors.RenderTextureLink target "cameraRGB1"
"disk1/Cameras/camerargb1" SET active true
CREATE "disk1/Cameras/camerargb2"
"disk1/Cameras/camerargb2" ADD Sensors.RenderTextureLink
"disk1/Cameras/camerargb2" SET Sensors.RenderTextureLink target "cameraRGB2"
"disk1/Cameras/camerargb2" SET active true
CREATE "disk1/Cameras/camerargb3"
"disk1/Cameras/camerargb3" ADD Sensors.RenderTextureLink
"disk1/Cameras/camerargb3" SET Sensors.RenderTextureLink target "cameraRGB3"
"disk1/Cameras/camerargb3" SET active true
CREATE "disk1/Cameras/camerargb4"
"disk1/Cameras/camerargb4" ADD Sensors.RenderTextureLink
"disk1/Cameras/camerargb4" SET Sensors.RenderTextureLink target "cameraRGB4"
"disk1/Cameras/camerargb4" SET active true
CREATE "disk1/Cameras/camerargb5"
"disk1/Cameras/camerargb5" ADD Sensors.RenderTextureLink
"disk1/Cameras/camerargb5" SET Sensors.RenderTextureLink target "cameraRGB5"
"disk1/Cameras/camerargb5" SET active true
"disk1" SET active true
CREATE "spawner/drone/container"
"spawner/drone/container" SET active false
"spawner/drone/container" ADD RandomProps.Torus
"spawner/drone/container" ADD RandomProps.PropArea
"spawner/drone/container" SET RandomProps.PropArea tags "drone"
"spawner/drone/container" SET RandomProps.PropArea async false numberOfProps 25 collisionCheck true stickToGround false 
"spawner/drone/container" SET RandomProps.Torus innerRadius 0
"spawner/drone/container" SET RandomProps.Torus radius 15
"spawner/drone/container" SET Transform position (-6 0 -9) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/drone/container" ADD Segmentation.Class
"spawner/drone/container" SET Segmentation.Class className "Drone"
"spawner/drone/container" SET active true
"spawner/drone" SET active true
"cameras/cameraRGB0" ADD LCP
"cameras/cameraRGB0" SET LCP enabled false radialParam1 5 radialParam2 5 enabled true
"cameras/cameraRGB1" ADD LCP
"cameras/cameraRGB1" SET LCP enabled false radialParamX 0.5 enabled true
"cameras/cameraRGB2" ADD LCP
"cameras/cameraRGB2" SET LCP enabled false redParam1 5 redParam2 5 greenParam1 3 greenParam2 3 blueParam1 1 blueParam2 1 enabled true
"cameras/cameraRGB3" ADD LCP
"cameras/cameraRGB3" SET LCP enabled false redParam1 5 redParam2 5 redParamX 1 redParamY 1 greenParam1 3 greenParam2 3 greenParamX 3 greenParamY 3 blueParam1 1 blueParam2 1 blueParamX 5 blueParamY 5 enabled true
"cameras/cameraRGB4" ADD LCP
"cameras/cameraRGB4" SET LCP enabled false distortionScale 1.2 isFisheyeDistortion true radialParam1 4 radialParam2 2 redParam1 5 redParam2 5 redParamX 1 redParamY 1 greenParam1 3 greenParam2 3 greenParamX 3 greenParamY 3 blueParam1 1 blueParam2 1 blueParamX 5 blueParamY 5 enabled true
"cameras/cameraRGB5" ADD LCP
"cameras/cameraRGB5" SET LCP enabled false distortionScale 1 isFisheyeDistortion true radialParam1 -25~25 radialParam2 -25~25 redParam1 -25~25 redParam2 -25~25 redParamX -15~15 redParamY -15~15 greenParam1 -25~25 greenParam2 -25~25 greenParamX -15~15 greenParamY -15~15 blueParam1 -25~25 blueParam2 -25~25 blueParamX -15~15 blueParamY -15~15 enabled true
"cameras" SET Transform position (-4.6025 0.1441 -10.633) eulerAngles (6 -27.75 0) 
