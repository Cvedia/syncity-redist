// ----- THERMAL CAMERAS SEGMENTATION -----

[Segmentation.Camera] CreateWithClassColors "mainCar/cameras/Thermal1/Segmentation" WITH lookUpTable "lookUpTable"
[Cameras.RenderTexture] CreateNew "Thermal1Segmentation" 640 512
"mainCar/cameras/Thermal1/Segmentation" SET Camera targetTexture "Thermal1Segmentation" far 400
"mainCar/cameras/Thermal1/Segmentation" SET active true
[UI.Window] ShowFromRenderTexture "Thermal1Segmentation" AS "Thermal1Segmentation"

[Segmentation.Camera] CreateWithClassColors "mainCar/cameras/Thermal2/Segmentation" WITH lookUpTable "lookUpTable"
[Cameras.RenderTexture] CreateNew "Thermal2Segmentation" 640 512
"mainCar/cameras/Thermal2/Segmentation" SET Camera targetTexture "Thermal2Segmentation" far 400
"mainCar/cameras/Thermal2/Segmentation" SET active true
[UI.Window] ShowFromRenderTexture "Thermal2Segmentation" AS "Thermal2Segmentation"


"Vehicle Spawner" ADD Segmentation.Class
"Vehicle Spawner" SET Segmentation.Class className "Cars"