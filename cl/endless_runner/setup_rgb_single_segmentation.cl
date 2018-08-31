// ----- RGB CAMERAS SEGMENTATION -----

[Segmentation.Camera] CreateWithClassColors "mainCar/cameras/RGB1/Segmentation" WITH lookUpTable "lookUpTable"
[Cameras.RenderTexture] CreateNew "RGB1Segmentation" 480 120
"mainCar/cameras/RGB1/Segmentation" SET Camera targetTexture "RGB1Segmentation"
"mainCar/cameras/RGB1/Segmentation" SET Camera far 400
"mainCar/cameras/RGB1/Segmentation" SET active true
[UI.Window] ShowFromRenderTexture "RGB1Segmentation" AS "RGB1Segmentation"

"Vehicle Spawner" ADD Segmentation.Class
"Vehicle Spawner" SET Segmentation.Class className "Car"