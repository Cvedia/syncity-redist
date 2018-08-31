CREATE "mainCar/cameras"
"mainCar/cameras" SET active false
"mainCar/cameras" SET Transform position (-6 1 -50) eulerAngles (0 0 0) localPosition (0 0.872 2.318) localEulerAngles (0 0 0)

// front / bumper camera -------------------------------------------------------

CREATE "mainCar/cameras/Front"
"mainCar/cameras/Front" SET active false
"mainCar/cameras/Front" ADD Camera EnviroSkyRendering EnviroLightShafts Postprocessing.EnviroMerged UnityEngine.Rendering.PostProcessing.PostProcessLayer Sensors.RenderCamera
"mainCar/cameras/Front" SET Camera near 0.3 far 1000 fieldOfView 60 allowMSAA false renderingPath "DeferredShading"

// postprocessing stack matching what's on the driver camera
"mainCar/cameras/Front" SET Postprocessing.EnviroMerged dayProfile ASSET "Highway/Resources/Day" FROM "highway" nightProfile ASSET "Highway/Resources/Night" FROM "highway"
"mainCar/cameras/Front" SET UnityEngine.Rendering.PostProcessing.PostProcessLayer antialiasingMode "SubpixelMorphologicalAntialiasing" fog.enabled 0 volumeTrigger "mainCar/cameras/Front"

"mainCar/cameras/Front" SET Sensors.RenderCamera format "ARGB32" resolution (1024 768) alwaysOn true

"mainCar/cameras/Front" SET active true

CREATE "disk1/mainCar/cameras/front"
"disk1/mainCar/cameras/front" ADD Sensors.RenderCameraLink
"disk1/mainCar/cameras/front" SET Sensors.RenderCameraLink target "mainCar/cameras/Front"
"disk1/mainCar/cameras/front" SET active true

[UI.Window] ShowFromCamera "mainCar/cameras/Front" AS "Front" WITH 1024 768 24 "ARGB32" "Default"

// depth camera ----------------------------------------------------------------

CREATE "mainCar/cameras/Depth"
"mainCar/cameras/Depth" SET active false
"mainCar/cameras/Depth" ADD Camera Sensors.RenderCamera Cameras.RenderDepthBufferSimple Sensors.LidarNoLights
"mainCar/cameras/Depth" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "DeferredShading" allowMSAA false
"mainCar/cameras/Depth" SET Sensors.RenderCamera format "RFloat" resolution (320 240) alwaysOn true
"mainCar/cameras/Depth" SET Cameras.RenderDepthBufferSimple outputMode "Linear01Depth" transparencyCutout 0
"mainCar/cameras/Depth" SET active true

CREATE "disk1/mainCar/cameras/depth"
"disk1/mainCar/cameras/depth" ADD Sensors.RenderCameraLink
"disk1/mainCar/cameras/depth" SET Sensors.RenderCameraLink target "mainCar/cameras/Depth"
"disk1/mainCar/cameras/depth" SET Sensors.RenderCameraLink outputType "DEPTH"
"disk1/mainCar/cameras/depth" SET active true

[UI.Window] ShowFromCamera "mainCar/cameras/Depth" AS "Depth" WITH 320 240 8 "RFloat" "Default"

// segmentation camera ---------------------------------------------------------

CREATE "mainCar/cameras/Segment"
"mainCar/cameras/Segment" SET active false
"mainCar/cameras/Segment" ADD Camera Sensors.RenderCamera SegmentationCamera Segmentation.Output.ClassColors Sensors.LidarNoLights
"mainCar/cameras/Segment" SET Camera near 0.3 far 1000 fieldOfView 60 allowMSAA false renderingPath "DeferredShading" targetTexture.filterMode "Point"
"mainCar/cameras/Segment" SET Sensors.RenderCamera format "ARGB32" resolution (320 240) alwaysOn true
"mainCar/cameras/Segment" SET Sensors.BoundingBoxes minimumObjectVisibility 1 boundingBoxesExtensionAmount 0 minimumPixelsCount 1
"mainCar/cameras/Segment" EXECUTE Segmentation.Output.ClassColors lookUpTable.SetClassColor "Road->#838383" "Road lines->white" "Road fences->#FF00FF" "Road shoulders->#DFDFDF" "Signs->red" "Trees->green" "Props->#AA00FF" "Car->blue"
"mainCar/cameras/Segment" SET active true

CREATE "disk1/mainCar/cameras/segment"
"disk1/mainCar/cameras/segment" ADD Sensors.RenderCameraLink
"disk1/mainCar/cameras/segment" SET Sensors.RenderCameraLink target "mainCar/cameras/Segment"
"disk1/mainCar/cameras/segment" SET active true

[UI.Window] ShowFromCamera "mainCar/cameras/Segment" AS "Segmentation" WITH 320 240 24 "ARGB32" "Default"

// fisheye left mirror camera --------------------------------------------------

CREATE "mainCar/cameras/mirrorL"
"mainCar/cameras/mirrorL" SET active false
"mainCar/cameras/mirrorL" SET Transform localPosition (-1 0 -1.44) localEulerAngles (0 270 0)
"mainCar/cameras/mirrorL" ADD Camera SphericalCamera EnviroSkyRendering EnviroLightShafts Postprocessing.EnviroMerged UnityEngine.Rendering.PostProcessing.PostProcessLayer Sensors.RenderCamera
"mainCar/cameras/mirrorL" SET Camera near 0.3 far 500 allowMSAA false renderingPath "DeferredShading"
"mainCar/cameras/mirrorL" SET SphericalCamera azimuth 180 elevation 90 cameraRTResolution 320

// postprocessing stack matching what's on the driver camera
"mainCar/cameras/mirrorL" SET Postprocessing.EnviroMerged dayProfile ASSET "Highway/Resources/Day" FROM "highway" nightProfile ASSET "Highway/Resources/Night" FROM "highway"
"mainCar/cameras/mirrorL" SET UnityEngine.Rendering.PostProcessing.PostProcessLayer antialiasingMode "SubpixelMorphologicalAntialiasing" fog.enabled 0 volumeTrigger "mainCar/cameras/mirrorL"

"mainCar/cameras/mirrorL" SET Sensors.RenderCamera format "ARGB32" resolution (320 240) alwaysOn true

"mainCar/cameras/mirrorL" SET active true

CREATE "disk1/mainCar/cameras/mirrorL"
"disk1/mainCar/cameras/mirrorL" ADD Sensors.RenderCameraLink
"disk1/mainCar/cameras/mirrorL" SET Sensors.RenderCameraLink target "mainCar/cameras/mirrorL"
"disk1/mainCar/cameras/mirrorL" SET active true

[UI.Window] ShowFromCamera "mainCar/cameras/mirrorL" AS "mirrorL" WITH 320 240 24 "ARGB32" "Default"

// fisheye right mirror camera -------------------------------------------------

CREATE "mainCar/cameras/mirrorR"
"mainCar/cameras/mirrorR" SET active false
"mainCar/cameras/mirrorR" SET Transform localPosition (1 0 -1.44) localEulerAngles (0 90 0)
"mainCar/cameras/mirrorR" ADD Camera SphericalCamera EnviroSkyRendering EnviroLightShafts Postprocessing.EnviroMerged UnityEngine.Rendering.PostProcessing.PostProcessLayer Sensors.RenderCamera
"mainCar/cameras/mirrorR" SET Camera near 0.3 far 500 allowMSAA false renderingPath "DeferredShading"
"mainCar/cameras/mirrorR" SET SphericalCamera azimuth 180 elevation 90 cameraRTResolution 320

// postprocessing stack matching what's on the driver camera
"mainCar/cameras/mirrorR" SET Postprocessing.EnviroMerged dayProfile ASSET "Highway/Resources/Day" FROM "highway" nightProfile ASSET "Highway/Resources/Night" FROM "highway"
"mainCar/cameras/mirrorR" SET UnityEngine.Rendering.PostProcessing.PostProcessLayer antialiasingMode "SubpixelMorphologicalAntialiasing" fog.enabled 0 volumeTrigger "mainCar/cameras/mirrorR"

"mainCar/cameras/mirrorR" SET Sensors.RenderCamera format "ARGB32" resolution (320 240) alwaysOn true

"mainCar/cameras/mirrorR" SET active true

CREATE "disk1/mainCar/cameras/mirrorR"
"disk1/mainCar/cameras/mirrorR" ADD Sensors.RenderCameraLink
"disk1/mainCar/cameras/mirrorR" SET Sensors.RenderCameraLink target "mainCar/cameras/mirrorR"
"disk1/mainCar/cameras/mirrorR" SET active true

[UI.Window] ShowFromCamera "mainCar/cameras/mirrorR" AS "mirrorR" WITH 320 240 24 "ARGB32" "Default"

// -----------------------------------------------------------------------------

"mainCar/cameras" SET active true
"disk1" SET active true
