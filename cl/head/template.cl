CREATE "cameras"
"cameras" SET active false
"cameras" SET Transform position (-6 1 -50)
"cameras" SET Transform eulerAngles (0 0 0)
"cameras" ADD Orbit
"Canvas/Cameras/Viewport/Content" SET UI.GridLayoutGroup cellSize (1024 768)
"Canvas" SET active true
CREATE "cameras/cameraRGB"
"cameras/cameraRGB" SET active false
"cameras/cameraRGB" ADD Camera
"cameras/cameraRGB" SET Camera near 0.3 far 1000 fieldOfView 60
"cameras/cameraRGB" ADD Sensors.RenderCamera
"cameras/cameraRGB" SET Sensors.RenderCamera format "ARGB32" resolution (2048 1536)
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
CREATE "cameras/segmentation"
"cameras/segmentation" SET active false
"cameras/segmentation" ADD Camera
"cameras/segmentation" SET Camera near 0.3 far 1000 fieldOfView 60
"cameras/segmentation" ADD Sensors.RenderCamera
"cameras/segmentation" SET Sensors.RenderCamera format "ARGB32" resolution (1024 768)
"cameras/segmentation" SET Camera renderingPath "UsePlayerSettings" targetTexture.filterMode "Point"
"cameras/segmentation" ADD Segmentation.Segmentation
"cameras/segmentation" SET Segmentation.Segmentation minimumObjectVisibility 0 outputType "Auto" boundingBoxesExtensionAmount 0 transparencyCutout 0 
"cameras/segmentation" EXECUTE Segmentation.Segmentation DefineClass "Void"
"cameras/segmentation" PUSH Segmentation.Segmentation boundingBoxesFilter "Car"
"cameras/segmentation" ADD Segmentation.LookUpTable
"cameras/segmentation" PUSH Segmentation.LookUpTable classes "Void"
"cameras/segmentation" PUSH Segmentation.LookUpTable colors "black"
"cameras/segmentation" EXECUTE Segmentation.Segmentation DefineClass "Car"
"cameras/segmentation" PUSH Segmentation.LookUpTable classes "Car"
"cameras/segmentation" PUSH Segmentation.LookUpTable colors "blue"
"cameras/segmentation" EXECUTE Segmentation.LookUpTable MarkTextureDirty
"cameras/segmentation" SET active true
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
"disk1" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_0"
"cars/car_0" ADD Segmentation.ClassGroup
"cars/car_0" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_0" SET Transform position (-15 -5 -30)
"cars/car_0" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_1"
"cars/car_1" ADD Segmentation.ClassGroup
"cars/car_1" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_1" SET Transform position (-15 -5 -22)
"cars/car_1" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_2"
"cars/car_2" ADD Segmentation.ClassGroup
"cars/car_2" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_2" SET Transform position (-15 -5 -14)
"cars/car_2" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_3"
"cars/car_3" ADD Segmentation.ClassGroup
"cars/car_3" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_3" SET Transform position (-15 -5 -6)
"cars/car_3" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_4"
"cars/car_4" ADD Segmentation.ClassGroup
"cars/car_4" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_4" SET Transform position (-15 -5 2)
"cars/car_4" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_5"
"cars/car_5" ADD Segmentation.ClassGroup
"cars/car_5" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_5" SET Transform position (-15 -5 10)
"cars/car_5" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_6"
"cars/car_6" ADD Segmentation.ClassGroup
"cars/car_6" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_6" SET Transform position (-15 -5 18)
"cars/car_6" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_7"
"cars/car_7" ADD Segmentation.ClassGroup
"cars/car_7" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_7" SET Transform position (-15 -5 26)
"cars/car_7" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_8"
"cars/car_8" ADD Segmentation.ClassGroup
"cars/car_8" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_8" SET Transform position (-12 -5 -30)
"cars/car_8" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_9"
"cars/car_9" ADD Segmentation.ClassGroup
"cars/car_9" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_9" SET Transform position (-12 -5 -22)
"cars/car_9" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_10"
"cars/car_10" ADD Segmentation.ClassGroup
"cars/car_10" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_10" SET Transform position (-12 -5 -14)
"cars/car_10" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_11"
"cars/car_11" ADD Segmentation.ClassGroup
"cars/car_11" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_11" SET Transform position (-12 -5 -6)
"cars/car_11" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_12"
"cars/car_12" ADD Segmentation.ClassGroup
"cars/car_12" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_12" SET Transform position (-12 -5 2)
"cars/car_12" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_13"
"cars/car_13" ADD Segmentation.ClassGroup
"cars/car_13" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_13" SET Transform position (-12 -5 10)
"cars/car_13" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_14"
"cars/car_14" ADD Segmentation.ClassGroup
"cars/car_14" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_14" SET Transform position (-12 -5 18)
"cars/car_14" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_15"
"cars/car_15" ADD Segmentation.ClassGroup
"cars/car_15" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_15" SET Transform position (-12 -5 26)
"cars/car_15" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_16"
"cars/car_16" ADD Segmentation.ClassGroup
"cars/car_16" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_16" SET Transform position (-9 -5 -30)
"cars/car_16" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_17"
"cars/car_17" ADD Segmentation.ClassGroup
"cars/car_17" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_17" SET Transform position (-9 -5 -22)
"cars/car_17" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_18"
"cars/car_18" ADD Segmentation.ClassGroup
"cars/car_18" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_18" SET Transform position (-9 -5 -14)
"cars/car_18" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_19"
"cars/car_19" ADD Segmentation.ClassGroup
"cars/car_19" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_19" SET Transform position (-9 -5 -6)
"cars/car_19" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_20"
"cars/car_20" ADD Segmentation.ClassGroup
"cars/car_20" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_20" SET Transform position (-9 -5 2)
"cars/car_20" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_21"
"cars/car_21" ADD Segmentation.ClassGroup
"cars/car_21" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_21" SET Transform position (-9 -5 10)
"cars/car_21" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_22"
"cars/car_22" ADD Segmentation.ClassGroup
"cars/car_22" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_22" SET Transform position (-9 -5 18)
"cars/car_22" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_23"
"cars/car_23" ADD Segmentation.ClassGroup
"cars/car_23" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_23" SET Transform position (-9 -5 26)
"cars/car_23" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_24"
"cars/car_24" ADD Segmentation.ClassGroup
"cars/car_24" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_24" SET Transform position (-6 -5 -30)
"cars/car_24" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_25"
"cars/car_25" ADD Segmentation.ClassGroup
"cars/car_25" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_25" SET Transform position (-6 -5 -22)
"cars/car_25" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_26"
"cars/car_26" ADD Segmentation.ClassGroup
"cars/car_26" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_26" SET Transform position (-6 -5 -14)
"cars/car_26" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_27"
"cars/car_27" ADD Segmentation.ClassGroup
"cars/car_27" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_27" SET Transform position (-6 -5 -6)
"cars/car_27" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_28"
"cars/car_28" ADD Segmentation.ClassGroup
"cars/car_28" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_28" SET Transform position (-6 -5 2)
"cars/car_28" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_29"
"cars/car_29" ADD Segmentation.ClassGroup
"cars/car_29" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_29" SET Transform position (-6 -5 10)
"cars/car_29" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_30"
"cars/car_30" ADD Segmentation.ClassGroup
"cars/car_30" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_30" SET Transform position (-6 -5 18)
"cars/car_30" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_31"
"cars/car_31" ADD Segmentation.ClassGroup
"cars/car_31" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_31" SET Transform position (-6 -5 26)
"cars/car_31" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_32"
"cars/car_32" ADD Segmentation.ClassGroup
"cars/car_32" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_32" SET Transform position (-3 -5 -30)
"cars/car_32" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_33"
"cars/car_33" ADD Segmentation.ClassGroup
"cars/car_33" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_33" SET Transform position (-3 -5 -22)
"cars/car_33" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_34"
"cars/car_34" ADD Segmentation.ClassGroup
"cars/car_34" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_34" SET Transform position (-3 -5 -14)
"cars/car_34" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_35"
"cars/car_35" ADD Segmentation.ClassGroup
"cars/car_35" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_35" SET Transform position (-3 -5 -6)
"cars/car_35" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_36"
"cars/car_36" ADD Segmentation.ClassGroup
"cars/car_36" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_36" SET Transform position (-3 -5 2)
"cars/car_36" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_37"
"cars/car_37" ADD Segmentation.ClassGroup
"cars/car_37" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_37" SET Transform position (-3 -5 10)
"cars/car_37" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_38"
"cars/car_38" ADD Segmentation.ClassGroup
"cars/car_38" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_38" SET Transform position (-3 -5 18)
"cars/car_38" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_39"
"cars/car_39" ADD Segmentation.ClassGroup
"cars/car_39" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_39" SET Transform position (-3 -5 26)
"cars/car_39" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_40"
"cars/car_40" ADD Segmentation.ClassGroup
"cars/car_40" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_40" SET Transform position (0 -5 -30)
"cars/car_40" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_41"
"cars/car_41" ADD Segmentation.ClassGroup
"cars/car_41" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_41" SET Transform position (0 -5 -22)
"cars/car_41" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_42"
"cars/car_42" ADD Segmentation.ClassGroup
"cars/car_42" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_42" SET Transform position (0 -5 -14)
"cars/car_42" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_43"
"cars/car_43" ADD Segmentation.ClassGroup
"cars/car_43" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_43" SET Transform position (0 -5 -6)
"cars/car_43" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_44"
"cars/car_44" ADD Segmentation.ClassGroup
"cars/car_44" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_44" SET Transform position (0 -5 2)
"cars/car_44" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_45"
"cars/car_45" ADD Segmentation.ClassGroup
"cars/car_45" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_45" SET Transform position (0 -5 10)
"cars/car_45" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_46"
"cars/car_46" ADD Segmentation.ClassGroup
"cars/car_46" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_46" SET Transform position (0 -5 18)
"cars/car_46" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_47"
"cars/car_47" ADD Segmentation.ClassGroup
"cars/car_47" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_47" SET Transform position (0 -5 26)
"cars/car_47" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_48"
"cars/car_48" ADD Segmentation.ClassGroup
"cars/car_48" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_48" SET Transform position (3 -5 -30)
"cars/car_48" SET active true
CREATE "Cars/?" FROM "cars" AS "cars/car_49"
"cars/car_49" ADD Segmentation.ClassGroup
"cars/car_49" SET Segmentation.ClassGroup itemsClassName "Car"
"cars/car_49" SET Transform position (3 -5 -22)
"cars/car_49" SET active true
"cars/car_25" GET Transform position
