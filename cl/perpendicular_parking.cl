CREATE "Camera"
"Camera" SET Transform localPosition (0 1.5 0)
"Camera" ADD Camera UnityEngine.PostProcessing.PostProcessingBehaviour
"Camera" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "EnviroFX" profile.motionBlur.enabled false
"Camera" SET active true

CREATE "Camera/RGB"
"Camera/RGB" SET active false
"Camera/RGB" ADD Camera AudioListener
"Camera/RGB" SET Camera fieldOfView 60 renderingPath "UsePlayerSettings" allowHDR true
"Camera/RGB" ADD UnityEngine.Rendering.PostProcessing.PostProcessVolume UnityEngine.Rendering.PostProcessing.PostProcessLayer
"Camera/RGB" SET UnityEngine.Rendering.PostProcessing.PostProcessLayer volumeTrigger "Camera/RGB" antialiasingMode "SubpixelMorphologicalAntialiasing"
"Camera/RGB" SET UnityEngine.Rendering.PostProcessing.PostProcessVolume isGlobal true profile "Cold Profile"
"Camera/RGB" EXECUTE UnityEngine.Rendering.PostProcessing.PostProcessLayer Init "PostProcessResources"
"Camera/RGB" SET active true

"Segmentation.Profile.instance" PUSH classes "Void" "Sky" "Person" "Bicycles" "Car"
CREATE Segmentation.LookUpTable AS "lookUpTable"
"lookUpTable" EXECUTE Segmentation.LookUpTable SetClassColor "Void->black" "Sky->#FF7B00FF" "Person->Yellow" "Bicycle->#00FF00FF" "Car->#FF0000FF"

CREATE "Camera/Segmentation"
"Camera/Segmentation" ADD Camera SegmentationCamera Segmentation.Output.BoundingBoxes Segmentation.Output.FilteredBoundingBoxes Segmentation.Output.ClassColors
"Camera/Segmentation" SET Segmentation.Output.ClassColors lookUpTable "lookUpTable"
"Camera/Segmentation" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Person" "Bicycle" "Car"
"Camera/Segmentation" SET active true


CREATE "Grounds"
"Grounds" SET Transform localPosition (0 0.01 0)
"Grounds" ADD RandomProps.FillGrid
"Grounds" SET RandomProps.FillGrid tags "ground"
"Grounds" SET RandomProps.FillGrid size (100 100)
"Grounds" SET RandomProps.FillGrid cellSize (10 10)
"Grounds" ADD Segmentation.Class Segmentation.Spawners.Entity
"Grounds" SET Segmentation.Class className "Void"
"Grounds" SET active true

CREATE "Cars-Right"
CREATE "Cars-Left"

REGEX "Cars-.*" ADD Segmentation.Class Segmentation.Spawners.Entity
REGEX "Cars-.*" SET Segmentation.Class className "Car"
REGEX "Cars-.*" ADD RandomProps.Frustum
REGEX "Cars-.*" SET RandomProps.Frustum cam "Camera/RGB"
REGEX "Cars-.*" SET RandomProps.Frustum minDistance 4
REGEX "Cars-.*" SET RandomProps.Frustum maxDistance 55
REGEX "Cars-.*" SET RandomProps.Frustum fixedYAxis 0

"Cars-Left" SET RandomProps.Frustum fixedXAxis -6
"Cars-Right" SET RandomProps.Frustum fixedXAxis 6

REGEX "Cars-.*" ADD RandomProps.PropArea
REGEX "Cars-.*" SET RandomProps.PropArea tags "+car,+thermal,-car.classification=\"Truck\",-car.classification=\"Bus\",-car.classification=\"Police\",-car.classification=\"Bike\",-car.classification=\"Special Purpose Vehicle\",-car.classification=\"Motorbike\"" collisionCheck True
REGEX "Cars-.*" PUSH RandomProps.PropArea fixedRotations (0 90 0)  (0 270 0)
REGEX "Cars-.*" SET RandomProps.PropArea numberOfProps 10
REGEX "Cars-.*" SET RigidBody enabled false
REGEX "Cars-.*" SET active true