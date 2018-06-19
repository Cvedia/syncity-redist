CREATE "cameras"
"cameras" SET active false
"cameras" SET Transform position (-6 1 -50) eulerAngles (0 0 0)
CREATE "cameras/cameraRGB"
"cameras/cameraRGB" SET active false
"cameras/cameraRGB" ADD Camera Sensors.RenderCamera AudioListener
"cameras/cameraRGB" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings" allowHDR true allowMSAA false 
CREATE RenderTexture 1024 768 24 "ARGB32" "Default" AS "cameraRGB_RT"
"cameraRGB_RT" SET name "cameras/cameraRGB"
"cameraRGB_RT" EXECUTE @Create
"cameras/cameraRGB" SET Camera targetTexture "cameraRGB_RT"
"cameras/cameraRGB" SET Sensors.RenderCamera format "ARGB32" resolution (1024 768) alwaysOn false
CREATE "EnviroSky" AS "EnviroSky"
"EnviroSky" SET EnviroSky Player "cameras" PlayerCamera "cameras/cameraRGB" GameTime.ProgressTime "None" weatherSettings.cloudTransitionSpeed 100 weatherSettings.effectTransitionSpeed 100 weatherSettings.fogTransitionSpeed 100 
"EnviroSky" EXECUTE EnviroSky AssignAndStart "cameras/cameraRGB" "cameras/cameraRGB"
"EnviroSky" SET active true
[UI.Window] ShowFromRenderTexture "cameraRGB_RT" AS "cameraRGB"
"cameras/cameraRGB" SET active true
"cameras" SET active true
"cameras/cameraRGB" ADD UnityEngine.PostProcessing.PostProcessingBehaviour
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "EnviroFX"
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled false
CREATE "disk1"
"disk1" SET active false
"disk1" ADD Sensors.Disk
"disk1" SET Sensors.Disk path "/tmp/" counter 1
"disk1" SET active true
"disk1" SET active false
CREATE "disk1/Cameras/camerargb"
"disk1/Cameras/camerargb" ADD Sensors.RenderTextureLink
"disk1/Cameras/camerargb" SET Sensors.RenderTextureLink target "cameraRGB"
"disk1/Cameras/camerargb" SET active true
"disk1" SET active true
CREATE "spawner/Buildings_001//container"
"spawner/Buildings_001//container" SET active false
"spawner/Buildings_001//container" ADD RandomProps.Torus
"spawner/Buildings_001//container" ADD RandomProps.PropArea
"spawner/Buildings_001//container" SET RandomProps.PropArea tags ""
"spawner/Buildings_001//container" SET RandomProps.PropArea async false numberOfProps 350 collisionCheck true stickToGround false 
"spawner/Buildings_001//container" SET RandomProps.Torus radius 350
"spawner/Buildings_001//container" SET RandomProps.Torus innerRadius 0
"spawner/Buildings_001//container" SET Transform position (0 0 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/Buildings_001//container" SET active true
"spawner/Buildings_001/" SET active true
CREATE "spawner/Buildings_002//container"
"spawner/Buildings_002//container" SET active false
"spawner/Buildings_002//container" ADD RandomProps.Torus
"spawner/Buildings_002//container" ADD RandomProps.PropArea
"spawner/Buildings_002//container" SET RandomProps.PropArea tags ""
"spawner/Buildings_002//container" SET RandomProps.PropArea async false numberOfProps 350 collisionCheck true stickToGround false 
"spawner/Buildings_002//container" SET RandomProps.Torus radius 350
"spawner/Buildings_002//container" SET RandomProps.Torus innerRadius 0
"spawner/Buildings_002//container" SET Transform position (0 0 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/Buildings_002//container" SET active true
"spawner/Buildings_002/" SET active true
CREATE "spawner/Buildings_003//container"
"spawner/Buildings_003//container" SET active false
"spawner/Buildings_003//container" ADD RandomProps.Torus
"spawner/Buildings_003//container" ADD RandomProps.PropArea
"spawner/Buildings_003//container" SET RandomProps.PropArea tags ""
"spawner/Buildings_003//container" SET RandomProps.PropArea async false numberOfProps 350 collisionCheck true stickToGround false 
"spawner/Buildings_003//container" SET RandomProps.Torus radius 350
"spawner/Buildings_003//container" SET RandomProps.Torus innerRadius 0
"spawner/Buildings_003//container" SET Transform position (0 0 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/Buildings_003//container" SET active true
"spawner/Buildings_003/" SET active true
CREATE "buildings/buildings_0" "Buildings_001/AM_131_building_obj_49 1"
"buildings/buildings_0" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_0" SET Segmentation.Class className "Car"
"buildings/buildings_0" SET Transform position (-15 -5 -30)
CREATE "buildings/buildings_1" "Buildings_001/AM_131_building_obj_05 2"
"buildings/buildings_1" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_1" SET Segmentation.Class className "Car"
"buildings/buildings_1" SET Transform position (-15 -5 10)
CREATE "buildings/buildings_2" "Buildings_001/AM_131_building_obj_30 1"
"buildings/buildings_2" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_2" SET Segmentation.Class className "Car"
"buildings/buildings_2" SET Transform position (-15 -5 50)
CREATE "buildings/buildings_3" "Buildings_001/AM_131_building_obj_29 1"
"buildings/buildings_3" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_3" SET Segmentation.Class className "Car"
"buildings/buildings_3" SET Transform position (-15 -5 90)
CREATE "buildings/buildings_4" "Buildings_001/AM_131_building_obj_71 1"
"buildings/buildings_4" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_4" SET Segmentation.Class className "Car"
"buildings/buildings_4" SET Transform position (-15 -5 130)
CREATE "buildings/buildings_5" "Buildings_001/AM_131_building_obj_41 1"
"buildings/buildings_5" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_5" SET Segmentation.Class className "Car"
"buildings/buildings_5" SET Transform position (-15 -5 170)
CREATE "buildings/buildings_6" "Buildings_001/AM_131_building_obj_13 1"
"buildings/buildings_6" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_6" SET Segmentation.Class className "Car"
"buildings/buildings_6" SET Transform position (-15 -5 210)
CREATE "buildings/buildings_7" "Buildings_001/AM_131_building_obj_62 1"
"buildings/buildings_7" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_7" SET Segmentation.Class className "Car"
"buildings/buildings_7" SET Transform position (-15 -5 250)
CREATE "buildings/buildings_8" "Buildings_001/AM_131_building_obj_37 1"
"buildings/buildings_8" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_8" SET Segmentation.Class className "Car"
"buildings/buildings_8" SET Transform position (-15 -5 290)
CREATE "buildings/buildings_9" "Buildings_001/AM_131_building_obj_15 1"
"buildings/buildings_9" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_9" SET Segmentation.Class className "Car"
"buildings/buildings_9" SET Transform position (-15 -5 330)
CREATE "buildings/buildings_10" "Buildings_001/AM_131_building_obj_57 1"
"buildings/buildings_10" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_10" SET Segmentation.Class className "Car"
"buildings/buildings_10" SET Transform position (-15 -5 370)
CREATE "buildings/buildings_11" "Buildings_001/AM_131_building_obj_43 1"
"buildings/buildings_11" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_11" SET Segmentation.Class className "Car"
"buildings/buildings_11" SET Transform position (25 -5 -30)
CREATE "buildings/buildings_12" "Buildings_001/AM_131_building_obj_23 1"
"buildings/buildings_12" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_12" SET Segmentation.Class className "Car"
"buildings/buildings_12" SET Transform position (25 -5 10)
CREATE "buildings/buildings_13" "Buildings_001/AM_131_building_obj_16 1"
"buildings/buildings_13" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_13" SET Segmentation.Class className "Car"
"buildings/buildings_13" SET Transform position (25 -5 50)
CREATE "buildings/buildings_14" "Buildings_001/AM_131_building_obj_78 1"
"buildings/buildings_14" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_14" SET Segmentation.Class className "Car"
"buildings/buildings_14" SET Transform position (25 -5 90)
CREATE "buildings/buildings_15" "Buildings_001/AM_131_building_obj_07 1"
"buildings/buildings_15" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_15" SET Segmentation.Class className "Car"
"buildings/buildings_15" SET Transform position (25 -5 130)
CREATE "buildings/buildings_16" "Buildings_001/AM_131_building_obj_18 1"
"buildings/buildings_16" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_16" SET Segmentation.Class className "Car"
"buildings/buildings_16" SET Transform position (25 -5 170)
CREATE "buildings/buildings_17" "Buildings_001/AM_131_building_obj_79 1"
"buildings/buildings_17" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_17" SET Segmentation.Class className "Car"
"buildings/buildings_17" SET Transform position (25 -5 210)
CREATE "buildings/buildings_18" "Buildings_001/AM_131_building_obj_31 1"
"buildings/buildings_18" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_18" SET Segmentation.Class className "Car"
"buildings/buildings_18" SET Transform position (25 -5 250)
CREATE "buildings/buildings_19" "Buildings_001/AM_131_building_obj_28 1"
"buildings/buildings_19" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_19" SET Segmentation.Class className "Car"
"buildings/buildings_19" SET Transform position (25 -5 290)
CREATE "buildings/buildings_20" "Buildings_001/AM_131_building_obj_02 1"
"buildings/buildings_20" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_20" SET Segmentation.Class className "Car"
"buildings/buildings_20" SET Transform position (25 -5 330)
CREATE "buildings/buildings_21" "Buildings_001/AM_131_building_obj_138 1"
"buildings/buildings_21" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_21" SET Segmentation.Class className "Car"
"buildings/buildings_21" SET Transform position (25 -5 370)
CREATE "buildings/buildings_22" "Buildings_001/AM_131_building_obj_24 1"
"buildings/buildings_22" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_22" SET Segmentation.Class className "Car"
"buildings/buildings_22" SET Transform position (65 -5 -30)
CREATE "buildings/buildings_23" "Buildings_001/AM_131_building_obj_11 1"
"buildings/buildings_23" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_23" SET Segmentation.Class className "Car"
"buildings/buildings_23" SET Transform position (65 -5 10)
CREATE "buildings/buildings_24" "Buildings_001/AM_131_building_obj_21 1"
"buildings/buildings_24" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_24" SET Segmentation.Class className "Car"
"buildings/buildings_24" SET Transform position (65 -5 50)
CREATE "buildings/buildings_25" "Buildings_001/AM_131_building_obj_67 1"
"buildings/buildings_25" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_25" SET Segmentation.Class className "Car"
"buildings/buildings_25" SET Transform position (65 -5 90)
CREATE "buildings/buildings_26" "Buildings_001/AM_131_building_obj_39 1"
"buildings/buildings_26" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_26" SET Segmentation.Class className "Car"
"buildings/buildings_26" SET Transform position (65 -5 130)
CREATE "buildings/buildings_27" "Buildings_001/AM_131_building_obj_20 1"
"buildings/buildings_27" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_27" SET Segmentation.Class className "Car"
"buildings/buildings_27" SET Transform position (65 -5 170)
CREATE "buildings/buildings_28" "Buildings_001/AM_131_building_obj_33 1"
"buildings/buildings_28" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_28" SET Segmentation.Class className "Car"
"buildings/buildings_28" SET Transform position (65 -5 210)
CREATE "buildings/buildings_29" "Buildings_001/AM_131_building_obj_101"
"buildings/buildings_29" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_29" SET Segmentation.Class className "Car"
"buildings/buildings_29" SET Transform position (65 -5 250)
CREATE "buildings/buildings_30" "Buildings_001/AM_131_building_obj_08 1"
"buildings/buildings_30" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_30" SET Segmentation.Class className "Car"
"buildings/buildings_30" SET Transform position (65 -5 290)
CREATE "buildings/buildings_31" "Buildings_001/AM_131_building_obj_17 1"
"buildings/buildings_31" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_31" SET Segmentation.Class className "Car"
"buildings/buildings_31" SET Transform position (65 -5 330)
CREATE "buildings/buildings_32" "Buildings_001/AM_131_building_obj_110 1"
"buildings/buildings_32" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_32" SET Segmentation.Class className "Car"
"buildings/buildings_32" SET Transform position (65 -5 370)
CREATE "buildings/buildings_33" "Buildings_001/AM_131_building_obj_22 1"
"buildings/buildings_33" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_33" SET Segmentation.Class className "Car"
"buildings/buildings_33" SET Transform position (105 -5 -30)
CREATE "buildings/buildings_34" "Buildings_001/AM_131_building_obj_117 1"
"buildings/buildings_34" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_34" SET Segmentation.Class className "Car"
"buildings/buildings_34" SET Transform position (105 -5 10)
CREATE "buildings/buildings_35" "Buildings_001/AM_131_building_obj_104 1"
"buildings/buildings_35" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_35" SET Segmentation.Class className "Car"
"buildings/buildings_35" SET Transform position (105 -5 50)
CREATE "buildings/buildings_36" "Buildings_001/AM_131_building_obj_12 1"
"buildings/buildings_36" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_36" SET Segmentation.Class className "Car"
"buildings/buildings_36" SET Transform position (105 -5 90)
CREATE "buildings/buildings_37" "Buildings_001/AM_131_building_obj_130 1"
"buildings/buildings_37" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_37" SET Segmentation.Class className "Car"
"buildings/buildings_37" SET Transform position (105 -5 130)
CREATE "buildings/buildings_38" "Buildings_001/AM_131_building_obj_56 1"
"buildings/buildings_38" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_38" SET Segmentation.Class className "Car"
"buildings/buildings_38" SET Transform position (105 -5 170)
CREATE "buildings/buildings_39" "Buildings_001/AM_131_building_obj_58 1"
"buildings/buildings_39" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_39" SET Segmentation.Class className "Car"
"buildings/buildings_39" SET Transform position (105 -5 210)
CREATE "buildings/buildings_40" "Buildings_001/AM_131_building_obj_19 1"
"buildings/buildings_40" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_40" SET Segmentation.Class className "Car"
"buildings/buildings_40" SET Transform position (105 -5 250)
CREATE "buildings/buildings_41" "Buildings_001/AM_131_building_obj_50 1"
"buildings/buildings_41" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_41" SET Segmentation.Class className "Car"
"buildings/buildings_41" SET Transform position (105 -5 290)
CREATE "buildings/buildings_42" "Buildings_001/AM_131_building_obj_05 1"
"buildings/buildings_42" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_42" SET Segmentation.Class className "Car"
"buildings/buildings_42" SET Transform position (105 -5 330)
CREATE "buildings/buildings_43" "Buildings_001/AM_131_building_obj_26 1"
"buildings/buildings_43" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_43" SET Segmentation.Class className "Car"
"buildings/buildings_43" SET Transform position (105 -5 370)
CREATE "buildings/buildings_44" "Buildings_001/AM_131_building_obj_32 1"
"buildings/buildings_44" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_44" SET Segmentation.Class className "Car"
"buildings/buildings_44" SET Transform position (145 -5 -30)
CREATE "buildings/buildings_45" "Buildings_001/AM_131_building_obj_114 1"
"buildings/buildings_45" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_45" SET Segmentation.Class className "Car"
"buildings/buildings_45" SET Transform position (145 -5 10)
CREATE "buildings/buildings_46" "Buildings_001/AM_131_building_obj_54 1"
"buildings/buildings_46" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_46" SET Segmentation.Class className "Car"
"buildings/buildings_46" SET Transform position (145 -5 50)
CREATE "buildings/buildings_47" "Buildings_001/AM_131_building_obj_80 1"
"buildings/buildings_47" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_47" SET Segmentation.Class className "Car"
"buildings/buildings_47" SET Transform position (145 -5 90)
CREATE "buildings/buildings_48" "Buildings_001/AM_131_building_obj_27 1"
"buildings/buildings_48" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_48" SET Segmentation.Class className "Car"
"buildings/buildings_48" SET Transform position (145 -5 130)
CREATE "buildings/buildings_49" "Buildings_001/AM_131_building_obj_01 1"
"buildings/buildings_49" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_49" SET Segmentation.Class className "Car"
"buildings/buildings_49" SET Transform position (145 -5 170)
CREATE "buildings/buildings_50" "Buildings_001/AM_131_building_obj_55 1"
"buildings/buildings_50" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_50" SET Segmentation.Class className "Car"
"buildings/buildings_50" SET Transform position (145 -5 210)
CREATE "buildings/buildings_51" "Buildings_001/AM_131_building_obj_68 1"
"buildings/buildings_51" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_51" SET Segmentation.Class className "Car"
"buildings/buildings_51" SET Transform position (145 -5 250)
CREATE "buildings/buildings_52" "Buildings_001/AM_131_building_obj_59 1"
"buildings/buildings_52" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_52" SET Segmentation.Class className "Car"
"buildings/buildings_52" SET Transform position (145 -5 290)
CREATE "buildings/buildings_53" "Buildings_001/AM_131_building_obj_14 1"
"buildings/buildings_53" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_53" SET Segmentation.Class className "Car"
"buildings/buildings_53" SET Transform position (145 -5 330)
CREATE "buildings/buildings_54" "Buildings_001/AM_131_building_obj_10 1"
"buildings/buildings_54" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_54" SET Segmentation.Class className "Car"
"buildings/buildings_54" SET Transform position (145 -5 370)
CREATE "buildings/buildings_55" "Buildings_001/AM_131_building_obj_04 1"
"buildings/buildings_55" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_55" SET Segmentation.Class className "Car"
"buildings/buildings_55" SET Transform position (185 -5 -30)
CREATE "buildings/buildings_56" "Buildings_001/AM_131_building_obj_74 1"
"buildings/buildings_56" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_56" SET Segmentation.Class className "Car"
"buildings/buildings_56" SET Transform position (185 -5 10)
CREATE "buildings/buildings_57" "Buildings_001/AM_131_building_obj_03 1"
"buildings/buildings_57" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_57" SET Segmentation.Class className "Car"
"buildings/buildings_57" SET Transform position (185 -5 50)
CREATE "buildings/buildings_58" "Buildings_001/AM_131_building_obj_09 1"
"buildings/buildings_58" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_58" SET Segmentation.Class className "Car"
"buildings/buildings_58" SET Transform position (185 -5 90)
CREATE "buildings/buildings_59" "Buildings_002/AM_131_002_set_004_obj_0022"
"buildings/buildings_59" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_59" SET Segmentation.Class className "Car"
"buildings/buildings_59" SET Transform position (185 -5 130)
CREATE "buildings/buildings_60" "Buildings_002/AM_131_002_set_001_obj_0028"
"buildings/buildings_60" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_60" SET Segmentation.Class className "Car"
"buildings/buildings_60" SET Transform position (185 -5 170)
CREATE "buildings/buildings_61" "Buildings_002/AM_131_002_set_003_obj_0023"
"buildings/buildings_61" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_61" SET Segmentation.Class className "Car"
"buildings/buildings_61" SET Transform position (185 -5 210)
CREATE "buildings/buildings_62" "Buildings_002/AM_131_002_set_002_obj_0017"
"buildings/buildings_62" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_62" SET Segmentation.Class className "Car"
"buildings/buildings_62" SET Transform position (185 -5 250)
CREATE "buildings/buildings_63" "Buildings_002/AM_131_002_set_005_obj_000"
"buildings/buildings_63" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_63" SET Segmentation.Class className "Car"
"buildings/buildings_63" SET Transform position (185 -5 290)
CREATE "buildings/buildings_64" "Buildings_002/AM_131_002_set_001_obj_0014 1"
"buildings/buildings_64" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_64" SET Segmentation.Class className "Car"
"buildings/buildings_64" SET Transform position (185 -5 330)
CREATE "buildings/buildings_65" "Buildings_002/AM_131_002_set_001_obj_0047"
"buildings/buildings_65" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_65" SET Segmentation.Class className "Car"
"buildings/buildings_65" SET Transform position (185 -5 370)
CREATE "buildings/buildings_66" "Buildings_002/AM_131_002_set_004_obj_0033"
"buildings/buildings_66" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_66" SET Segmentation.Class className "Car"
"buildings/buildings_66" SET Transform position (225 -5 -30)
CREATE "buildings/buildings_67" "Buildings_002/AM_131_002_set_001_obj_0043"
"buildings/buildings_67" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_67" SET Segmentation.Class className "Car"
"buildings/buildings_67" SET Transform position (225 -5 10)
CREATE "buildings/buildings_68" "Buildings_002/AM_131_002_set_001_obj_0045"
"buildings/buildings_68" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_68" SET Segmentation.Class className "Car"
"buildings/buildings_68" SET Transform position (225 -5 50)
CREATE "buildings/buildings_69" "Buildings_002/AM_131_002_set_004_obj_0026"
"buildings/buildings_69" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_69" SET Segmentation.Class className "Car"
"buildings/buildings_69" SET Transform position (225 -5 90)
CREATE "buildings/buildings_70" "Buildings_002/AM_131_002_set_002_obj_0069"
"buildings/buildings_70" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_70" SET Segmentation.Class className "Car"
"buildings/buildings_70" SET Transform position (225 -5 130)
CREATE "buildings/buildings_71" "Buildings_002/AM_131_002_set_002_obj_0027"
"buildings/buildings_71" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_71" SET Segmentation.Class className "Car"
"buildings/buildings_71" SET Transform position (225 -5 170)
CREATE "buildings/buildings_72" "Buildings_002/AM_131_002_set_001_obj_0044"
"buildings/buildings_72" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_72" SET Segmentation.Class className "Car"
"buildings/buildings_72" SET Transform position (225 -5 210)
CREATE "buildings/buildings_73" "Buildings_002/AM_131_002_set_003_obj_0026"
"buildings/buildings_73" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_73" SET Segmentation.Class className "Car"
"buildings/buildings_73" SET Transform position (225 -5 250)
CREATE "buildings/buildings_74" "Buildings_002/AM_131_002_set_001_obj_0041"
"buildings/buildings_74" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_74" SET Segmentation.Class className "Car"
"buildings/buildings_74" SET Transform position (225 -5 290)
CREATE "buildings/buildings_75" "Buildings_002/AM_131_002_set_002_obj_0030"
"buildings/buildings_75" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_75" SET Segmentation.Class className "Car"
"buildings/buildings_75" SET Transform position (225 -5 330)
CREATE "buildings/buildings_76" "Buildings_002/AM_131_002_set_001_obj_0034"
"buildings/buildings_76" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_76" SET Segmentation.Class className "Car"
"buildings/buildings_76" SET Transform position (225 -5 370)
CREATE "buildings/buildings_77" "Buildings_002/AM_131_002_set_001_obj_0036"
"buildings/buildings_77" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_77" SET Segmentation.Class className "Car"
"buildings/buildings_77" SET Transform position (265 -5 -30)
CREATE "buildings/buildings_78" "Buildings_002/AM_131_002_set_004_obj_0032"
"buildings/buildings_78" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_78" SET Segmentation.Class className "Car"
"buildings/buildings_78" SET Transform position (265 -5 10)
CREATE "buildings/buildings_79" "Buildings_002/AM_131_002_set_004_obj_0016"
"buildings/buildings_79" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_79" SET Segmentation.Class className "Car"
"buildings/buildings_79" SET Transform position (265 -5 50)
CREATE "buildings/buildings_80" "Buildings_002/AM_131_002_set_001_obj_0030"
"buildings/buildings_80" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_80" SET Segmentation.Class className "Car"
"buildings/buildings_80" SET Transform position (265 -5 90)
CREATE "buildings/buildings_81" "Buildings_002/AM_131_002_set_001_obj_0015"
"buildings/buildings_81" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_81" SET Segmentation.Class className "Car"
"buildings/buildings_81" SET Transform position (265 -5 130)
CREATE "buildings/buildings_82" "Buildings_002/AM_131_002_set_001_obj_0021"
"buildings/buildings_82" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_82" SET Segmentation.Class className "Car"
"buildings/buildings_82" SET Transform position (265 -5 170)
CREATE "buildings/buildings_83" "Buildings_002/AM_131_002_set_004_obj_0011"
"buildings/buildings_83" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_83" SET Segmentation.Class className "Car"
"buildings/buildings_83" SET Transform position (265 -5 210)
CREATE "buildings/buildings_84" "Buildings_003/Building_008_high"
"buildings/buildings_84" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_84" SET Segmentation.Class className "Car"
"buildings/buildings_84" SET Transform position (265 -5 250)
CREATE "buildings/buildings_85" "Buildings_003/Building_045_high"
"buildings/buildings_85" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_85" SET Segmentation.Class className "Car"
"buildings/buildings_85" SET Transform position (265 -5 290)
CREATE "buildings/buildings_86" "Buildings_003/Building_076_high"
"buildings/buildings_86" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_86" SET Segmentation.Class className "Car"
"buildings/buildings_86" SET Transform position (265 -5 330)
CREATE "buildings/buildings_87" "Buildings_003/Building_044_high"
"buildings/buildings_87" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_87" SET Segmentation.Class className "Car"
"buildings/buildings_87" SET Transform position (265 -5 370)
CREATE "buildings/buildings_88" "Buildings_003/Building_062_high"
"buildings/buildings_88" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_88" SET Segmentation.Class className "Car"
"buildings/buildings_88" SET Transform position (305 -5 -30)
CREATE "buildings/buildings_89" "Buildings_003/Building_002_high"
"buildings/buildings_89" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_89" SET Segmentation.Class className "Car"
"buildings/buildings_89" SET Transform position (305 -5 10)
CREATE "buildings/buildings_90" "Buildings_003/Building_019_high"
"buildings/buildings_90" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_90" SET Segmentation.Class className "Car"
"buildings/buildings_90" SET Transform position (305 -5 50)
CREATE "buildings/buildings_91" "Buildings_003/Building_028_high"
"buildings/buildings_91" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_91" SET Segmentation.Class className "Car"
"buildings/buildings_91" SET Transform position (305 -5 90)
CREATE "buildings/buildings_92" "Buildings_003/Building_031_high"
"buildings/buildings_92" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_92" SET Segmentation.Class className "Car"
"buildings/buildings_92" SET Transform position (305 -5 130)
CREATE "buildings/buildings_93" "Buildings_003/Building_012_high"
"buildings/buildings_93" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_93" SET Segmentation.Class className "Car"
"buildings/buildings_93" SET Transform position (305 -5 170)
CREATE "buildings/buildings_94" "Buildings_003/Building_064_high"
"buildings/buildings_94" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_94" SET Segmentation.Class className "Car"
"buildings/buildings_94" SET Transform position (305 -5 210)
CREATE "buildings/buildings_95" "Buildings_003/Building_046_high"
"buildings/buildings_95" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_95" SET Segmentation.Class className "Car"
"buildings/buildings_95" SET Transform position (305 -5 250)
CREATE "buildings/buildings_96" "Buildings_003/Building_075_high"
"buildings/buildings_96" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_96" SET Segmentation.Class className "Car"
"buildings/buildings_96" SET Transform position (305 -5 290)
CREATE "buildings/buildings_97" "Buildings_003/Building_043_high"
"buildings/buildings_97" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_97" SET Segmentation.Class className "Car"
"buildings/buildings_97" SET Transform position (305 -5 330)
CREATE "buildings/buildings_98" "Buildings_003/Building_048_high"
"buildings/buildings_98" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_98" SET Segmentation.Class className "Car"
"buildings/buildings_98" SET Transform position (305 -5 370)
CREATE "buildings/buildings_99" "Buildings_003/Building_022_high"
"buildings/buildings_99" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_99" SET Segmentation.Class className "Car"
"buildings/buildings_99" SET Transform position (345 -5 -30)
CREATE "buildings/buildings_100" "Buildings_003/Building_074_high"
"buildings/buildings_100" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_100" SET Segmentation.Class className "Car"
"buildings/buildings_100" SET Transform position (345 -5 10)
CREATE "buildings/buildings_101" "Buildings_003/Building_068_high"
"buildings/buildings_101" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_101" SET Segmentation.Class className "Car"
"buildings/buildings_101" SET Transform position (345 -5 50)
CREATE "buildings/buildings_102" "Buildings_003/Building_069_high"
"buildings/buildings_102" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_102" SET Segmentation.Class className "Car"
"buildings/buildings_102" SET Transform position (345 -5 90)
CREATE "buildings/buildings_103" "Buildings_003/Building_011_high"
"buildings/buildings_103" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_103" SET Segmentation.Class className "Car"
"buildings/buildings_103" SET Transform position (345 -5 130)
CREATE "buildings/buildings_104" "Buildings_003/Building_040_high"
"buildings/buildings_104" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_104" SET Segmentation.Class className "Car"
"buildings/buildings_104" SET Transform position (345 -5 170)
CREATE "buildings/buildings_105" "Buildings_003/Building_013_high"
"buildings/buildings_105" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_105" SET Segmentation.Class className "Car"
"buildings/buildings_105" SET Transform position (345 -5 210)
CREATE "buildings/buildings_106" "Buildings_003/Building_015_high"
"buildings/buildings_106" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_106" SET Segmentation.Class className "Car"
"buildings/buildings_106" SET Transform position (345 -5 250)
CREATE "buildings/buildings_107" "Buildings_003/Building_060_high"
"buildings/buildings_107" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_107" SET Segmentation.Class className "Car"
"buildings/buildings_107" SET Transform position (345 -5 290)
CREATE "buildings/buildings_108" "Buildings_003/Building_057_high"
"buildings/buildings_108" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_108" SET Segmentation.Class className "Car"
"buildings/buildings_108" SET Transform position (345 -5 330)
CREATE "buildings/buildings_109" "Buildings_003/Building_055_high"
"buildings/buildings_109" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_109" SET Segmentation.Class className "Car"
"buildings/buildings_109" SET Transform position (345 -5 370)
CREATE "buildings/buildings_110" "Buildings_003/Building_066_high"
"buildings/buildings_110" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_110" SET Segmentation.Class className "Car"
"buildings/buildings_110" SET Transform position (385 -5 -30)
CREATE "buildings/buildings_111" "Buildings_003/Building_042_high"
"buildings/buildings_111" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_111" SET Segmentation.Class className "Car"
"buildings/buildings_111" SET Transform position (385 -5 10)
CREATE "buildings/buildings_112" "Buildings_003/Building_016_high"
"buildings/buildings_112" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_112" SET Segmentation.Class className "Car"
"buildings/buildings_112" SET Transform position (385 -5 50)
CREATE "buildings/buildings_113" "Buildings_003/Building_025_high"
"buildings/buildings_113" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_113" SET Segmentation.Class className "Car"
"buildings/buildings_113" SET Transform position (385 -5 90)
CREATE "buildings/buildings_114" "Buildings_003/Building_056_high"
"buildings/buildings_114" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_114" SET Segmentation.Class className "Car"
"buildings/buildings_114" SET Transform position (385 -5 130)
CREATE "buildings/buildings_115" "Buildings_003/Building_041_high"
"buildings/buildings_115" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_115" SET Segmentation.Class className "Car"
"buildings/buildings_115" SET Transform position (385 -5 170)
CREATE "buildings/buildings_116" "Buildings_003/Building_026_high"
"buildings/buildings_116" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_116" SET Segmentation.Class className "Car"
"buildings/buildings_116" SET Transform position (385 -5 210)
CREATE "buildings/buildings_117" "Buildings_003/Building_063_high"
"buildings/buildings_117" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_117" SET Segmentation.Class className "Car"
"buildings/buildings_117" SET Transform position (385 -5 250)
CREATE "buildings/buildings_118" "Buildings_003/Building_035_high"
"buildings/buildings_118" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_118" SET Segmentation.Class className "Car"
"buildings/buildings_118" SET Transform position (385 -5 290)
CREATE "buildings/buildings_119" "Buildings_003/Building_038_high"
"buildings/buildings_119" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_119" SET Segmentation.Class className "Car"
"buildings/buildings_119" SET Transform position (385 -5 330)
CREATE "buildings/buildings_120" "Buildings_003/Building_003_high"
"buildings/buildings_120" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_120" SET Segmentation.Class className "Car"
"buildings/buildings_120" SET Transform position (385 -5 370)
CREATE "buildings/buildings_121" "Buildings_003/Building_078_high"
"buildings/buildings_121" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_121" SET Segmentation.Class className "Car"
"buildings/buildings_121" SET Transform position (425 -5 -30)
CREATE "buildings/buildings_122" "Buildings_003/Building_030_high"
"buildings/buildings_122" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_122" SET Segmentation.Class className "Car"
"buildings/buildings_122" SET Transform position (425 -5 10)
CREATE "buildings/buildings_123" "Buildings_003/Building_021_high"
"buildings/buildings_123" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_123" SET Segmentation.Class className "Car"
"buildings/buildings_123" SET Transform position (425 -5 50)
CREATE "buildings/buildings_124" "Buildings_003/Building_052_high"
"buildings/buildings_124" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_124" SET Segmentation.Class className "Car"
"buildings/buildings_124" SET Transform position (425 -5 90)
CREATE "buildings/buildings_125" "Buildings_003/Building_007_high"
"buildings/buildings_125" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_125" SET Segmentation.Class className "Car"
"buildings/buildings_125" SET Transform position (425 -5 130)
CREATE "buildings/buildings_126" "Buildings_003/Building_032_high"
"buildings/buildings_126" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_126" SET Segmentation.Class className "Car"
"buildings/buildings_126" SET Transform position (425 -5 170)
CREATE "buildings/buildings_127" "Buildings_003/building_001_high"
"buildings/buildings_127" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_127" SET Segmentation.Class className "Car"
"buildings/buildings_127" SET Transform position (425 -5 210)
CREATE "buildings/buildings_128" "Buildings_003/Building_070_high"
"buildings/buildings_128" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_128" SET Segmentation.Class className "Car"
"buildings/buildings_128" SET Transform position (425 -5 250)
CREATE "buildings/buildings_129" "Buildings_003/Building_059_high"
"buildings/buildings_129" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_129" SET Segmentation.Class className "Car"
"buildings/buildings_129" SET Transform position (425 -5 290)
CREATE "buildings/buildings_130" "Buildings_003/Building_058_high"
"buildings/buildings_130" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_130" SET Segmentation.Class className "Car"
"buildings/buildings_130" SET Transform position (425 -5 330)
CREATE "buildings/buildings_131" "Buildings_003/Building_010_high"
"buildings/buildings_131" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_131" SET Segmentation.Class className "Car"
"buildings/buildings_131" SET Transform position (425 -5 370)
CREATE "buildings/buildings_132" "Buildings_003/Building_014_high"
"buildings/buildings_132" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_132" SET Segmentation.Class className "Car"
"buildings/buildings_132" SET Transform position (465 -5 -30)
CREATE "buildings/buildings_133" "Buildings_003/Building_049_high"
"buildings/buildings_133" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_133" SET Segmentation.Class className "Car"
"buildings/buildings_133" SET Transform position (465 -5 10)
CREATE "buildings/buildings_134" "Buildings_003/Building_082_high"
"buildings/buildings_134" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_134" SET Segmentation.Class className "Car"
"buildings/buildings_134" SET Transform position (465 -5 50)
CREATE "buildings/buildings_135" "Buildings_003/Building_054_high"
"buildings/buildings_135" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_135" SET Segmentation.Class className "Car"
"buildings/buildings_135" SET Transform position (465 -5 90)
CREATE "buildings/buildings_136" "Buildings_003/Building_034_high"
"buildings/buildings_136" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_136" SET Segmentation.Class className "Car"
"buildings/buildings_136" SET Transform position (465 -5 130)
CREATE "buildings/buildings_137" "Buildings_003/Building_005_high"
"buildings/buildings_137" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_137" SET Segmentation.Class className "Car"
"buildings/buildings_137" SET Transform position (465 -5 170)
CREATE "buildings/buildings_138" "Buildings_003/Building_065_high"
"buildings/buildings_138" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_138" SET Segmentation.Class className "Car"
"buildings/buildings_138" SET Transform position (465 -5 210)
CREATE "buildings/buildings_139" "Buildings_003/Building_017_high"
"buildings/buildings_139" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_139" SET Segmentation.Class className "Car"
"buildings/buildings_139" SET Transform position (465 -5 250)
CREATE "buildings/buildings_140" "Buildings_003/Building_029_high"
"buildings/buildings_140" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_140" SET Segmentation.Class className "Car"
"buildings/buildings_140" SET Transform position (465 -5 290)
CREATE "buildings/buildings_141" "Buildings_003/Building_039_high"
"buildings/buildings_141" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_141" SET Segmentation.Class className "Car"
"buildings/buildings_141" SET Transform position (465 -5 330)
CREATE "buildings/buildings_142" "Buildings_003/Building_061_high"
"buildings/buildings_142" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_142" SET Segmentation.Class className "Car"
"buildings/buildings_142" SET Transform position (465 -5 370)
CREATE "buildings/buildings_143" "Buildings_003/Building_027_high"
"buildings/buildings_143" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_143" SET Segmentation.Class className "Car"
"buildings/buildings_143" SET Transform position (505 -5 -30)
CREATE "buildings/buildings_144" "Buildings_003/Building_006_high"
"buildings/buildings_144" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_144" SET Segmentation.Class className "Car"
"buildings/buildings_144" SET Transform position (505 -5 10)
CREATE "buildings/buildings_145" "Buildings_003/Building_018_high"
"buildings/buildings_145" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_145" SET Segmentation.Class className "Car"
"buildings/buildings_145" SET Transform position (505 -5 50)
CREATE "buildings/buildings_146" "Buildings_003/Building_051_high"
"buildings/buildings_146" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_146" SET Segmentation.Class className "Car"
"buildings/buildings_146" SET Transform position (505 -5 90)
CREATE "buildings/buildings_147" "Buildings_003/Building_020_high"
"buildings/buildings_147" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_147" SET Segmentation.Class className "Car"
"buildings/buildings_147" SET Transform position (505 -5 130)
CREATE "buildings/buildings_148" "Buildings_003/Building_004_high"
"buildings/buildings_148" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_148" SET Segmentation.Class className "Car"
"buildings/buildings_148" SET Transform position (505 -5 170)
CREATE "buildings/buildings_149" "Buildings_003/Building_071_high"
"buildings/buildings_149" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_149" SET Segmentation.Class className "Car"
"buildings/buildings_149" SET Transform position (505 -5 210)
CREATE "buildings/buildings_150" "Buildings_003/Building_073_high"
"buildings/buildings_150" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_150" SET Segmentation.Class className "Car"
"buildings/buildings_150" SET Transform position (505 -5 250)
CREATE "buildings/buildings_151" "Buildings_003/Building_050_high"
"buildings/buildings_151" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_151" SET Segmentation.Class className "Car"
"buildings/buildings_151" SET Transform position (505 -5 290)
CREATE "buildings/buildings_152" "Buildings_003/Building_033_high"
"buildings/buildings_152" ADD Segmentation.Entity Segmentation.Class
"buildings/buildings_152" SET Segmentation.Class className "Car"
"buildings/buildings_152" SET Transform position (505 -5 330)
"cameras/cameraRGB" SET Camera enabled true
"cameras" SET Transform position (0 1 -16)
"cameras" SET Transform eulerAngles (-20 -45 0)
"EnviroSky" SET EnviroSky cloudsMode "Volume"
