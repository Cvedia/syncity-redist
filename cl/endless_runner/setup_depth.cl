// ----- DEPTH CAMERAS -----

CREATE "mainCar/cameras/Depth"
"mainCar/cameras/Depth" SET active false
"mainCar/cameras/Depth" ADD Camera Sensors.RenderCamera Cameras.RenderDepthBufferSimple Sensors.LidarNoLights
"mainCar/cameras/Depth" SET Camera near 0.3 far 400 fieldOfView 60 renderingPath "DeferredShading" allowMSAA false
"mainCar/cameras/Depth" SET Sensors.RenderCamera format "RFloat" resolution (640 512) alwaysOn true
"mainCar/cameras/Depth" SET Cameras.RenderDepthBufferSimple outputMode "Linear01Depth" transparencyCutout 0
"mainCar/cameras/Depth" SET active true

[UI.Window] ShowFromCamera "mainCar/cameras/Depth" AS "Depth" WITH 320 240 8 "RFloat" "Default"

[Segmentation.Camera] UseProfile ASSET "Resources/Segmentation.Profile" FROM "tiles"
[Segmentation.Camera] CreateWithClassColors "mainCar/cameras/Depth/Segmentation" WITH lookUpTable ASSET "Tiles/Segmentation/Segmentation.LookUpTable" FROM "tiles"
[Cameras.RenderTexture] CreateNew "DepthSegmentation" 640 512
"mainCar/cameras/Depth/Segmentation" SET Camera targetTexture "DepthSegmentation"
"mainCar/cameras/Depth/Segmentation" SET Camera far 400
"mainCar/cameras/Depth/Segmentation" SET active true
[UI.Window] ShowFromRenderTexture "DepthSegmentation" AS "DepthSegmentation"

"Vehicle Spawner" ADD Segmentation.Class
"Vehicle Spawner" SET Segmentation.Class className "Cars"