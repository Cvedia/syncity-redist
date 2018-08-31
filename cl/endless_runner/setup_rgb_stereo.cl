// ----- RGB CAMERAS -----

CREATE "mainCar/cameras/RGB1"
"mainCar/cameras/RGB1" SET active false
"mainCar/cameras/RGB1" SET Transform localPosition (0.1 0 0) localEulerAngles (0 -3 0)
"mainCar/cameras/RGB1" ADD Camera EnviroSkyRendering EnviroLightShafts Sensors.RenderCamera
"mainCar/cameras/RGB1" SET Camera near 0.3 far 400 fieldOfView 60 allowMSAA false renderingPath "DeferredShading"

"mainCar/cameras/RGB1" ADD UnityEngine.Rendering.PostProcessing.PostProcessLayer UnityEngine.Rendering.PostProcessing.PostProcessVolume
"mainCar/cameras/RGB1" SET UnityEngine.Rendering.PostProcessing.PostProcessLayer volumeTrigger "mainCar/cameras/RGB1" antialiasingMode "TemporalAntialiasing" volumeLayer 1
"mainCar/cameras/RGB1" EXECUTE UnityEngine.Rendering.PostProcessing.PostProcessLayer Init "PostProcessResources"
"mainCar/cameras/RGB1" SET UnityEngine.Rendering.PostProcessing.PostProcessVolume isGlobal true priority 100 sharedProfile ASSET "Tiles/Postpro Tiles" FROM "tiles"


CREATE RenderTexture 1920 1080 24 "ARGB32" "Default" AS "RGB1"
"mainCar/cameras/RGB1" SET Camera targetTexture "RGB1"
"mainCar/cameras/RGB1" SET Sensors.RenderCamera alwaysOn true
"mainCar/cameras/RGB1" SET active true

[UI.Window] ShowFromRenderTexture "RGB1" AS "RGB1"


"EnviroSky" EXECUTE EnviroSky AssignAndStart "mainCar/cameras/RGB1" "mainCar/cameras/RGB1"


CREATE "mainCar/cameras/RGB2"
"mainCar/cameras/RGB2" SET active false
"mainCar/cameras/RGB2" SET Transform localPosition (-0.1 0 0) localEulerAngles (0 3 0)
"mainCar/cameras/RGB2" ADD Camera EnviroSkyRendering EnviroLightShafts Sensors.RenderCamera
"mainCar/cameras/RGB2" SET Camera near 0.3 far 400 fieldOfView 60 allowMSAA false renderingPath "DeferredShading"

"mainCar/cameras/RGB2" ADD UnityEngine.Rendering.PostProcessing.PostProcessLayer UnityEngine.Rendering.PostProcessing.PostProcessVolume
"mainCar/cameras/RGB2" SET UnityEngine.Rendering.PostProcessing.PostProcessLayer volumeTrigger "mainCar/cameras/RGB2" antialiasingMode "TemporalAntialiasing" volumeLayer 1
"mainCar/cameras/RGB2" EXECUTE UnityEngine.Rendering.PostProcessing.PostProcessLayer Init "PostProcessResources"
"mainCar/cameras/RGB2" SET UnityEngine.Rendering.PostProcessing.PostProcessVolume isGlobal true priority 100 sharedProfile ASSET "Tiles/Postpro Tiles" FROM "tiles"
"mainCar/cameras/RGB2" ADD EnviroSkyRendering


CREATE RenderTexture 1280 720 24 "ARGB32" "Default" AS "RGB2"
"mainCar/cameras/RGB2" SET Camera targetTexture "RGB2"
"mainCar/cameras/RGB2" SET Sensors.RenderCamera alwaysOn true
"mainCar/cameras/RGB2" SET active true

[UI.Window] ShowFromRenderTexture "RGB2" AS "RGB2"