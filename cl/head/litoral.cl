LOAD "Litoral" from "litoral_scene"
[Cameras.RenderTexture] CreateNew "RGB Texture" 1920 1080
"Camera" SET Camera targetTexture "RGB Texture"
"Camera" SET FlyCamera enabled false
"Segmentation.Profile.instance" PUSH classes "Void" "Boats"
CREATE Segmentation.LookUpTable AS "lookUpTable"
"lookUpTable" EXECUTE Segmentation.LookUpTable SetClassColor "Boats->red"
[Segmentation.Camera] CreateWithClassColors "Camera/Segmentation" WITH lookUpTable "lookUpTable"
"Camera/Segmentation" ADD Segmentation.Output.BoundingBoxes Segmentation.Output.FilteredBoundingBoxes Segmentation.Output.BoundingBoxesOnTexture
"Camera/Segmentation" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Boats"
"Camera/Segmentation" SET Segmentation.Output.BoundingBoxesOnTexture boxesColor "Yellow"
[Cameras.RenderTexture] CreateNew "Segmentation Texture" 1920 1080
"Camera/Segmentation" SET Camera targetTexture "Segmentation Texture" farClipPlane 52904 fieldOfView 25
"Camera/Segmentation" SET active true
[UI.Window] ShowFromRenderTexture "Segmentation Texture" AS "Segmentation Texture"
[UI.Window] ShowFromRenderTexture "RGB Texture" AS "RGB"
[Sensors.Disk] CreateDisk "disk1" "/tmp/"
[Sensors.Disk] AddTextureOutput IN "disk1" "RGB Texture" AS "Cameras/rgb" outputType "rgb"
[Sensors.Disk] AddTextureOutput IN "disk1" "Segmentation Texture" AS "Cameras/segmentation" outputType "rgb"
"disk1" SET active true
CREATE "ships"
"ships" SET active true
"Camera" ADD Orbit
"Camera" SET Orbit distance 10000~20000 elevation 45~89.999 azimuth -120~120 targetOffset (-10000~10000 -2000~10000 -1000~10000)
CREATE "Ships/?" from "litoral" as "ships/1"
"ships/1" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/1" ADD Segmentation.Class Segmentation.Entity
"ships/1" SET Segmentation.Class className "Boats"
"ships/1" SET active true
CREATE "Ships/?" from "litoral" as "ships/2"
"ships/2" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/2" ADD Segmentation.Class Segmentation.Entity
"ships/2" SET Segmentation.Class className "Boats"
"ships/2" SET active true
CREATE "Ships/?" from "litoral" as "ships/3"
"ships/3" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/3" ADD Segmentation.Class Segmentation.Entity
"ships/3" SET Segmentation.Class className "Boats"
"ships/3" SET active true
CREATE "Ships/?" from "litoral" as "ships/4"
"ships/4" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/4" ADD Segmentation.Class Segmentation.Entity
"ships/4" SET Segmentation.Class className "Boats"
"ships/4" SET active true
CREATE "Ships/?" from "litoral" as "ships/5"
"ships/5" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/5" ADD Segmentation.Class Segmentation.Entity
"ships/5" SET Segmentation.Class className "Boats"
"ships/5" SET active true
CREATE "Ships/?" from "litoral" as "ships/6"
"ships/6" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/6" ADD Segmentation.Class Segmentation.Entity
"ships/6" SET Segmentation.Class className "Boats"
"ships/6" SET active true
CREATE "Ships/?" from "litoral" as "ships/7"
"ships/7" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/7" ADD Segmentation.Class Segmentation.Entity
"ships/7" SET Segmentation.Class className "Boats"
"ships/7" SET active true
CREATE "Ships/?" from "litoral" as "ships/8"
"ships/8" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/8" ADD Segmentation.Class Segmentation.Entity
"ships/8" SET Segmentation.Class className "Boats"
"ships/8" SET active true
CREATE "Ships/?" from "litoral" as "ships/9"
"ships/9" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/9" ADD Segmentation.Class Segmentation.Entity
"ships/9" SET Segmentation.Class className "Boats"
"ships/9" SET active true
CREATE "Ships/?" from "litoral" as "ships/10"
"ships/10" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/10" ADD Segmentation.Class Segmentation.Entity
"ships/10" SET Segmentation.Class className "Boats"
"ships/10" SET active true
CREATE "Ships/?" from "litoral" as "ships/11"
"ships/11" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/11" ADD Segmentation.Class Segmentation.Entity
"ships/11" SET Segmentation.Class className "Boats"
"ships/11" SET active true
CREATE "Ships/?" from "litoral" as "ships/12"
"ships/12" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/12" ADD Segmentation.Class Segmentation.Entity
"ships/12" SET Segmentation.Class className "Boats"
"ships/12" SET active true
CREATE "Ships/?" from "litoral" as "ships/13"
"ships/13" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/13" ADD Segmentation.Class Segmentation.Entity
"ships/13" SET Segmentation.Class className "Boats"
"ships/13" SET active true
CREATE "Ships/?" from "litoral" as "ships/14"
"ships/14" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/14" ADD Segmentation.Class Segmentation.Entity
"ships/14" SET Segmentation.Class className "Boats"
"ships/14" SET active true
CREATE "Ships/?" from "litoral" as "ships/15"
"ships/15" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/15" ADD Segmentation.Class Segmentation.Entity
"ships/15" SET Segmentation.Class className "Boats"
"ships/15" SET active true
CREATE "Ships/?" from "litoral" as "ships/16"
"ships/16" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/16" ADD Segmentation.Class Segmentation.Entity
"ships/16" SET Segmentation.Class className "Boats"
"ships/16" SET active true
CREATE "Ships/?" from "litoral" as "ships/17"
"ships/17" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/17" ADD Segmentation.Class Segmentation.Entity
"ships/17" SET Segmentation.Class className "Boats"
"ships/17" SET active true
CREATE "Ships/?" from "litoral" as "ships/18"
"ships/18" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/18" ADD Segmentation.Class Segmentation.Entity
"ships/18" SET Segmentation.Class className "Boats"
"ships/18" SET active true
CREATE "Ships/?" from "litoral" as "ships/19"
"ships/19" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/19" ADD Segmentation.Class Segmentation.Entity
"ships/19" SET Segmentation.Class className "Boats"
"ships/19" SET active true
CREATE "Ships/?" from "litoral" as "ships/20"
"ships/20" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/20" ADD Segmentation.Class Segmentation.Entity
"ships/20" SET Segmentation.Class className "Boats"
"ships/20" SET active true
CREATE "Ships/?" from "litoral" as "ships/21"
"ships/21" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/21" ADD Segmentation.Class Segmentation.Entity
"ships/21" SET Segmentation.Class className "Boats"
"ships/21" SET active true
CREATE "Ships/?" from "litoral" as "ships/22"
"ships/22" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/22" ADD Segmentation.Class Segmentation.Entity
"ships/22" SET Segmentation.Class className "Boats"
"ships/22" SET active true
CREATE "Ships/?" from "litoral" as "ships/23"
"ships/23" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/23" ADD Segmentation.Class Segmentation.Entity
"ships/23" SET Segmentation.Class className "Boats"
"ships/23" SET active true
CREATE "Ships/?" from "litoral" as "ships/24"
"ships/24" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/24" ADD Segmentation.Class Segmentation.Entity
"ships/24" SET Segmentation.Class className "Boats"
"ships/24" SET active true
CREATE "Ships/?" from "litoral" as "ships/25"
"ships/25" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/25" ADD Segmentation.Class Segmentation.Entity
"ships/25" SET Segmentation.Class className "Boats"
"ships/25" SET active true
CREATE "Ships/?" from "litoral" as "ships/26"
"ships/26" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/26" ADD Segmentation.Class Segmentation.Entity
"ships/26" SET Segmentation.Class className "Boats"
"ships/26" SET active true
CREATE "Ships/?" from "litoral" as "ships/27"
"ships/27" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/27" ADD Segmentation.Class Segmentation.Entity
"ships/27" SET Segmentation.Class className "Boats"
"ships/27" SET active true
CREATE "Ships/?" from "litoral" as "ships/28"
"ships/28" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/28" ADD Segmentation.Class Segmentation.Entity
"ships/28" SET Segmentation.Class className "Boats"
"ships/28" SET active true
CREATE "Ships/?" from "litoral" as "ships/29"
"ships/29" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/29" ADD Segmentation.Class Segmentation.Entity
"ships/29" SET Segmentation.Class className "Boats"
"ships/29" SET active true
CREATE "Ships/?" from "litoral" as "ships/30"
"ships/30" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/30" ADD Segmentation.Class Segmentation.Entity
"ships/30" SET Segmentation.Class className "Boats"
"ships/30" SET active true
CREATE "Ships/?" from "litoral" as "ships/31"
"ships/31" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/31" ADD Segmentation.Class Segmentation.Entity
"ships/31" SET Segmentation.Class className "Boats"
"ships/31" SET active true
CREATE "Ships/?" from "litoral" as "ships/32"
"ships/32" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/32" ADD Segmentation.Class Segmentation.Entity
"ships/32" SET Segmentation.Class className "Boats"
"ships/32" SET active true
CREATE "Ships/?" from "litoral" as "ships/33"
"ships/33" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/33" ADD Segmentation.Class Segmentation.Entity
"ships/33" SET Segmentation.Class className "Boats"
"ships/33" SET active true
CREATE "Ships/?" from "litoral" as "ships/34"
"ships/34" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/34" ADD Segmentation.Class Segmentation.Entity
"ships/34" SET Segmentation.Class className "Boats"
"ships/34" SET active true
CREATE "Ships/?" from "litoral" as "ships/35"
"ships/35" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/35" ADD Segmentation.Class Segmentation.Entity
"ships/35" SET Segmentation.Class className "Boats"
"ships/35" SET active true
CREATE "Ships/?" from "litoral" as "ships/36"
"ships/36" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/36" ADD Segmentation.Class Segmentation.Entity
"ships/36" SET Segmentation.Class className "Boats"
"ships/36" SET active true
CREATE "Ships/?" from "litoral" as "ships/37"
"ships/37" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/37" ADD Segmentation.Class Segmentation.Entity
"ships/37" SET Segmentation.Class className "Boats"
"ships/37" SET active true
CREATE "Ships/?" from "litoral" as "ships/38"
"ships/38" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/38" ADD Segmentation.Class Segmentation.Entity
"ships/38" SET Segmentation.Class className "Boats"
"ships/38" SET active true
CREATE "Ships/?" from "litoral" as "ships/39"
"ships/39" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/39" ADD Segmentation.Class Segmentation.Entity
"ships/39" SET Segmentation.Class className "Boats"
"ships/39" SET active true
CREATE "Ships/?" from "litoral" as "ships/40"
"ships/40" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/40" ADD Segmentation.Class Segmentation.Entity
"ships/40" SET Segmentation.Class className "Boats"
"ships/40" SET active true
CREATE "Ships/?" from "litoral" as "ships/41"
"ships/41" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/41" ADD Segmentation.Class Segmentation.Entity
"ships/41" SET Segmentation.Class className "Boats"
"ships/41" SET active true
CREATE "Ships/?" from "litoral" as "ships/42"
"ships/42" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/42" ADD Segmentation.Class Segmentation.Entity
"ships/42" SET Segmentation.Class className "Boats"
"ships/42" SET active true
CREATE "Ships/?" from "litoral" as "ships/43"
"ships/43" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/43" ADD Segmentation.Class Segmentation.Entity
"ships/43" SET Segmentation.Class className "Boats"
"ships/43" SET active true
CREATE "Ships/?" from "litoral" as "ships/44"
"ships/44" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/44" ADD Segmentation.Class Segmentation.Entity
"ships/44" SET Segmentation.Class className "Boats"
"ships/44" SET active true
CREATE "Ships/?" from "litoral" as "ships/45"
"ships/45" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/45" ADD Segmentation.Class Segmentation.Entity
"ships/45" SET Segmentation.Class className "Boats"
"ships/45" SET active true
CREATE "Ships/?" from "litoral" as "ships/46"
"ships/46" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/46" ADD Segmentation.Class Segmentation.Entity
"ships/46" SET Segmentation.Class className "Boats"
"ships/46" SET active true
CREATE "Ships/?" from "litoral" as "ships/47"
"ships/47" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/47" ADD Segmentation.Class Segmentation.Entity
"ships/47" SET Segmentation.Class className "Boats"
"ships/47" SET active true
CREATE "Ships/?" from "litoral" as "ships/48"
"ships/48" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/48" ADD Segmentation.Class Segmentation.Entity
"ships/48" SET Segmentation.Class className "Boats"
"ships/48" SET active true
CREATE "Ships/?" from "litoral" as "ships/49"
"ships/49" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/49" ADD Segmentation.Class Segmentation.Entity
"ships/49" SET Segmentation.Class className "Boats"
"ships/49" SET active true
CREATE "Ships/?" from "litoral" as "ships/50"
"ships/50" SET Transform position (-5000~5000 -15~0 0~10000) eulerAngles (0 -180~180 0)
"ships/50" ADD Segmentation.Class Segmentation.Entity
"ships/50" SET Segmentation.Class className "Boats"
"ships/50" SET active true
