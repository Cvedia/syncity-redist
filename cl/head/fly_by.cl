CREATE "cameras"
"cameras" SET active false
"cameras" SET Transform position (-6 1 -50) eulerAngles (0 0 0)
CREATE "cameras/cameraRGB"
"cameras/cameraRGB" SET active false
"cameras/cameraRGB" ADD Camera AudioListener
"cameras/cameraRGB" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings"
CREATE "EnviroSky" AS "EnviroSky"
"EnviroSky" SET EnviroSky Player "cameras" PlayerCamera "cameras/cameraRGB" GameTime.ProgressTime "None" weatherSettings.cloudTransitionSpeed 100 weatherSettings.effectTransitionSpeed 100 weatherSettings.fogTransitionSpeed 100 
"EnviroSky" EXECUTE EnviroSky AssignAndStart "cameras/cameraRGB" "cameras/cameraRGB"
"EnviroSky" SET active true
"cameras/cameraRGB" SET active true
[UI.Window] ShowFromCamera "cameras/cameraRGB" AS "cameraRGB" WITH 1024 768 24 "ARGB32" "Default"
"cameras" SET active true
"cameras/cameraRGB" ADD UnityEngine.PostProcessing.PostProcessingBehaviour
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "EnviroFX"
"cameras/cameraRGB" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.motionBlur.enabled false
"Segmentation.Profile.instance" PUSH classes "Void" "Car"
CREATE "cameras/segmentation"
"cameras/segmentation" SET active false
"cameras/segmentation" ADD Camera SegmentationCamera Segmentation.Output.BoundingBoxes Segmentation.Output.ClassColors
"cameras/segmentation" SET SegmentationCamera transparencyCutout 0
"cameras/segmentation" SET Camera near 0.3 far 1000 fieldOfView 60 renderingPath "UsePlayerSettings" targetTexture.filterMode "Point" 
"cameras/segmentation" SET Segmentation.Output.BoundingBoxes minimumObjectVisibility 0 extensionAmount 0 minimumPixelsCount 1 
"cameras/segmentation" ADD Segmentation.Output.FilteredBoundingBoxes
"cameras/segmentation" EXECUTE Segmentation.Output.FilteredBoundingBoxes EnableClasses "Car"
"cameras/segmentation" SET active true
[UI.Window] ShowFromCamera "cameras/segmentation" AS "segmentation" WITH 1024 768 24 "ARGB32" "Default"
CREATE "disk1"
"disk1" SET active false
"disk1" ADD Sensors.Disk
"disk1" SET Sensors.Disk path "/tmp/"
"disk1" SET active true
"disk1" SET active false
CREATE "disk1/Cameras/camerargb"
"disk1/Cameras/camerargb" ADD Sensors.RenderTextureLink
"disk1/Cameras/camerargb" SET Sensors.RenderTextureLink target "cameraRGB"
"disk1/Cameras/camerargb" SET active true
CREATE "disk1/Cameras/segmentation"
"disk1/Cameras/segmentation" ADD Sensors.RenderTextureLink
"disk1/Cameras/segmentation" SET Sensors.RenderTextureLink target "segmentation"
"disk1/Cameras/segmentation" SET Sensors.RenderTextureLink outputType "LOSSLESS"
"disk1/Cameras/segmentation" SET active true
"disk1" SET active true
CREATE "Cars/auditts/auditts" FROM "cars" AS "cars/car_0"
"cars/car_0" ADD Segmentation.Class
"cars/car_0" SET Segmentation.Class className "Car"
"cars/car_0" SET Transform position (-60 5 -90)
"cars/car_0" SET active true
CREATE "Cars/audi_a2/audi_a2" FROM "cars" AS "cars/car_1"
"cars/car_1" ADD Segmentation.Class
"cars/car_1" SET Segmentation.Class className "Car"
"cars/car_1" SET Transform position (-60 5 -70)
"cars/car_1" SET active true
CREATE "Cars/audi_q7/audi_q7" FROM "cars" AS "cars/car_2"
"cars/car_2" ADD Segmentation.Class
"cars/car_2" SET Segmentation.Class className "Car"
"cars/car_2" SET Transform position (-60 5 -50)
"cars/car_2" SET active true
CREATE "Cars/audi_s3/audi_s3" FROM "cars" AS "cars/car_3"
"cars/car_3" ADD Segmentation.Class
"cars/car_3" SET Segmentation.Class className "Car"
"cars/car_3" SET Transform position (-60 5 -30)
"cars/car_3" SET active true
CREATE "Cars/bentley_arnage/bentley_arnage" FROM "cars" AS "cars/car_4"
"cars/car_4" ADD Segmentation.Class
"cars/car_4" SET Segmentation.Class className "Car"
"cars/car_4" SET Transform position (-60 5 -10)
"cars/car_4" SET active true
CREATE "Cars/bmw/bmw" FROM "cars" AS "cars/car_5"
"cars/car_5" ADD Segmentation.Class
"cars/car_5" SET Segmentation.Class className "Car"
"cars/car_5" SET Transform position (-60 5 10)
"cars/car_5" SET active true
CREATE "Cars/bmw6_series_650i/bmw6_series_650i" FROM "cars" AS "cars/car_6"
"cars/car_6" ADD Segmentation.Class
"cars/car_6" SET Segmentation.Class className "Car"
"cars/car_6" SET Transform position (-60 5 30)
"cars/car_6" SET active true
CREATE "Cars/bmw_760li/bmw_760li" FROM "cars" AS "cars/car_7"
"cars/car_7" ADD Segmentation.Class
"cars/car_7" SET Segmentation.Class className "Car"
"cars/car_7" SET Transform position (-40 5 -30)
"cars/car_7" SET active true
CREATE "Cars/bmw_m3/bmw_m3" FROM "cars" AS "cars/car_8"
"cars/car_8" ADD Segmentation.Class
"cars/car_8" SET Segmentation.Class className "Car"
"cars/car_8" SET Transform position (-40 5 -10)
"cars/car_8" SET active true
CREATE "Cars/bmw_m5/bmw_m5" FROM "cars" AS "cars/car_9"
"cars/car_9" ADD Segmentation.Class
"cars/car_9" SET Segmentation.Class className "Car"
"cars/car_9" SET Transform position (-40 5 10)
"cars/car_9" SET active true
CREATE "Cars/bmw_m_limousine/bmw_m_limousine" FROM "cars" AS "cars/car_10"
"cars/car_10" ADD Segmentation.Class
"cars/car_10" SET Segmentation.Class className "Car"
"cars/car_10" SET Transform position (-40 5 30)
"cars/car_10" SET active true
CREATE "Cars/cadillac_escalade_ext/cadillac_escalade_ext" FROM "cars" AS "cars/car_11"
"cars/car_11" ADD Segmentation.Class
"cars/car_11" SET Segmentation.Class className "Car"
"cars/car_11" SET Transform position (-20 5 -30)
"cars/car_11" SET active true
CREATE "Cars/caterpillar_bulldozer_d9/caterpillar_bulldozer_d9" FROM "cars" AS "cars/car_12"
"cars/car_12" ADD Segmentation.Class
"cars/car_12" SET Segmentation.Class className "Car"
"cars/car_12" SET Transform position (-20 5 -10)
"cars/car_12" SET active true
CREATE "Cars/chevrolet_cruze_2011/chevrolet_cruze_2011" FROM "cars" AS "cars/car_13"
"cars/car_13" ADD Segmentation.Class
"cars/car_13" SET Segmentation.Class className "Car"
"cars/car_13" SET Transform position (-20 5 10)
"cars/car_13" SET active true
CREATE "Cars/chevrolet_s10/chevrolet_s10" FROM "cars" AS "cars/car_14"
"cars/car_14" ADD Segmentation.Class
"cars/car_14" SET Segmentation.Class className "Car"
"cars/car_14" SET Transform position (-20 5 30)
"cars/car_14" SET active true
CREATE "Cars/chevrolet_tornado/chevrolet_tornado" FROM "cars" AS "cars/car_15"
"cars/car_15" ADD Segmentation.Class
"cars/car_15" SET Segmentation.Class className "Car"
"cars/car_15" SET Transform position (0 5 -30)
"cars/car_15" SET active true
CREATE "Cars/fiat500_new/fiat500_new" FROM "cars" AS "cars/car_16"
"cars/car_16" ADD Segmentation.Class
"cars/car_16" SET Segmentation.Class className "Car"
"cars/car_16" SET Transform position (0 5 -10)
"cars/car_16" SET active true
CREATE "Cars/fiat_131/fiat_131" FROM "cars" AS "cars/car_17"
"cars/car_17" ADD Segmentation.Class
"cars/car_17" SET Segmentation.Class className "Car"
"cars/car_17" SET Transform position (0 5 10)
"cars/car_17" SET active true
CREATE "Cars/fiat_500/fiat_500" FROM "cars" AS "cars/car_18"
"cars/car_18" ADD Segmentation.Class
"cars/car_18" SET Segmentation.Class className "Car"
"cars/car_18" SET Transform position (0 5 30)
"cars/car_18" SET active true
CREATE "Cars/ford_crown_victoria_taxi/ford_crown_victoria_taxi" FROM "cars" AS "cars/car_19"
"cars/car_19" ADD Segmentation.Class
"cars/car_19" SET Segmentation.Class className "Car"
"cars/car_19" SET Transform position (20 5 -30)
"cars/car_19" SET active true
CREATE "Cars/ford_fiesta/ford_fiesta" FROM "cars" AS "cars/car_20"
"cars/car_20" ADD Segmentation.Class
"cars/car_20" SET Segmentation.Class className "Car"
"cars/car_20" SET Transform position (20 5 -10)
"cars/car_20" SET active true
CREATE "Cars/ford_fire_department/ford_fire_department" FROM "cars" AS "cars/car_21"
"cars/car_21" ADD Segmentation.Class
"cars/car_21" SET Segmentation.Class className "Car"
"cars/car_21" SET Transform position (20 5 10)
"cars/car_21" SET active true
CREATE "Cars/ford_focus/ford_focus" FROM "cars" AS "cars/car_22"
"cars/car_22" ADD Segmentation.Class
"cars/car_22" SET Segmentation.Class className "Car"
"cars/car_22" SET Transform position (20 5 30)
"cars/car_22" SET active true
CREATE "Cars/ford_mustang_gt_eleanor/ford_mustang_gt_eleanor" FROM "cars" AS "cars/car_23"
"cars/car_23" ADD Segmentation.Class
"cars/car_23" SET Segmentation.Class className "Car"
"cars/car_23" SET Transform position (40 5 -30)
"cars/car_23" SET active true
CREATE "Cars/ford_shelby_cobra/ford_shelby_cobra" FROM "cars" AS "cars/car_24"
"cars/car_24" ADD Segmentation.Class
"cars/car_24" SET Segmentation.Class className "Car"
"cars/car_24" SET Transform position (40 5 -10)
"cars/car_24" SET active true
CREATE "Cars/ford_transit_jumbo/ford_transit_jumbo" FROM "cars" AS "cars/car_25"
"cars/car_25" ADD Segmentation.Class
"cars/car_25" SET Segmentation.Class className "Car"
"cars/car_25" SET Transform position (40 5 10)
"cars/car_25" SET active true
CREATE "Cars/freightliner_aerodyne/freightliner_aerodyne" FROM "cars" AS "cars/car_26"
"cars/car_26" ADD Segmentation.Class
"cars/car_26" SET Segmentation.Class className "Car"
"cars/car_26" SET Transform position (40 5 30)
"cars/car_26" SET active true
CREATE "Cars/honda_civic_sedan/honda_civic_sedan" FROM "cars" AS "cars/car_27"
"cars/car_27" ADD Segmentation.Class
"cars/car_27" SET Segmentation.Class className "Car"
"cars/car_27" SET Transform position (60 5 -30)
"cars/car_27" SET active true
CREATE "Cars/hummer_h2/hummer_h2" FROM "cars" AS "cars/car_28"
"cars/car_28" ADD Segmentation.Class
"cars/car_28" SET Segmentation.Class className "Car"
"cars/car_28" SET Transform position (60 5 -10)
"cars/car_28" SET active true
CREATE "Cars/international_ambulance_fdny/international_ambulance_fdny" FROM "cars" AS "cars/car_29"
"cars/car_29" ADD Segmentation.Class
"cars/car_29" SET Segmentation.Class className "Car"
"cars/car_29" SET Transform position (60 5 10)
"cars/car_29" SET active true
CREATE "Cars/international_school_bus/international_school_bus" FROM "cars" AS "cars/car_30"
"cars/car_30" ADD Segmentation.Class
"cars/car_30" SET Segmentation.Class className "Car"
"cars/car_30" SET Transform position (60 5 30)
"cars/car_30" SET active true
CREATE "Cars/kenworth_t600/kenworth_t600" FROM "cars" AS "cars/car_31"
"cars/car_31" ADD Segmentation.Class
"cars/car_31" SET Segmentation.Class className "Car"
"cars/car_31" SET Transform position (80 5 -30)
"cars/car_31" SET active true
CREATE "Cars/lamborghini_gallardo/lamborghini_gallardo" FROM "cars" AS "cars/car_32"
"cars/car_32" ADD Segmentation.Class
"cars/car_32" SET Segmentation.Class className "Car"
"cars/car_32" SET Transform position (80 5 -10)
"cars/car_32" SET active true
CREATE "Cars/lancia_delta/lancia_delta" FROM "cars" AS "cars/car_33"
"cars/car_33" ADD Segmentation.Class
"cars/car_33" SET Segmentation.Class className "Car"
"cars/car_33" SET Transform position (80 5 10)
"cars/car_33" SET active true
CREATE "Cars/mack_dumper/mack_dumper" FROM "cars" AS "cars/car_34"
"cars/car_34" ADD Segmentation.Class
"cars/car_34" SET Segmentation.Class className "Car"
"cars/car_34" SET Transform position (80 5 30)
"cars/car_34" SET active true
CREATE "Cars/mercedes_class_g_500/mercedes_class_g_500" FROM "cars" AS "cars/car_35"
"cars/car_35" ADD Segmentation.Class
"cars/car_35" SET Segmentation.Class className "Car"
"cars/car_35" SET Transform position (100 5 -30)
"cars/car_35" SET active true
CREATE "Cars/mercedes_slk/mercedes_slk" FROM "cars" AS "cars/car_36"
"cars/car_36" ADD Segmentation.Class
"cars/car_36" SET Segmentation.Class className "Car"
"cars/car_36" SET Transform position (100 5 -10)
"cars/car_36" SET active true
CREATE "Cars/mercedes_vario_brinks/mercedes_vario_brinks" FROM "cars" AS "cars/car_37"
"cars/car_37" ADD Segmentation.Class
"cars/car_37" SET Segmentation.Class className "Car"
"cars/car_37" SET Transform position (100 5 10)
"cars/car_37" SET active true
CREATE "Cars/mini_coopers/mini_coopers" FROM "cars" AS "cars/car_38"
"cars/car_38" ADD Segmentation.Class
"cars/car_38" SET Segmentation.Class className "Car"
"cars/car_38" SET Transform position (100 5 30)
"cars/car_38" SET active true
CREATE "Cars/nissan_elgrand/nissan_elgrand" FROM "cars" AS "cars/car_39"
"cars/car_39" ADD Segmentation.Class
"cars/car_39" SET Segmentation.Class className "Car"
"cars/car_39" SET Transform position (120 5 -30)
"cars/car_39" SET active true
CREATE "Cars/nissan_murano/nissan_murano" FROM "cars" AS "cars/car_40"
"cars/car_40" ADD Segmentation.Class
"cars/car_40" SET Segmentation.Class className "Car"
"cars/car_40" SET Transform position (120 5 -10)
"cars/car_40" SET active true
CREATE "Cars/peugeot_406/peugeot_406" FROM "cars" AS "cars/car_41"
"cars/car_41" ADD Segmentation.Class
"cars/car_41" SET Segmentation.Class className "Car"
"cars/car_41" SET Transform position (120 5 10)
"cars/car_41" SET active true
CREATE "Cars/rangerover/rangerover" FROM "cars" AS "cars/car_42"
"cars/car_42" ADD Segmentation.Class
"cars/car_42" SET Segmentation.Class className "Car"
"cars/car_42" SET Transform position (120 5 30)
"cars/car_42" SET active true
CREATE "Cars/renault_420/renault_420" FROM "cars" AS "cars/car_43"
"cars/car_43" ADD Segmentation.Class
"cars/car_43" SET Segmentation.Class className "Car"
"cars/car_43" SET Transform position (140 5 -30)
"cars/car_43" SET active true
CREATE "Cars/renault_g210/renault_g210" FROM "cars" AS "cars/car_44"
"cars/car_44" ADD Segmentation.Class
"cars/car_44" SET Segmentation.Class className "Car"
"cars/car_44" SET Transform position (140 5 -10)
"cars/car_44" SET active true
CREATE "Cars/renault_megane/renault_megane" FROM "cars" AS "cars/car_45"
"cars/car_45" ADD Segmentation.Class
"cars/car_45" SET Segmentation.Class className "Car"
"cars/car_45" SET Transform position (140 5 10)
"cars/car_45" SET active true
CREATE "Cars/renault_trm_2000/renault_trm_2000" FROM "cars" AS "cars/car_46"
"cars/car_46" ADD Segmentation.Class
"cars/car_46" SET Segmentation.Class className "Car"
"cars/car_46" SET Transform position (140 5 30)
"cars/car_46" SET active true
CREATE "Cars/scania_400_concretemixer/scania_400_concretemixer" FROM "cars" AS "cars/car_47"
"cars/car_47" ADD Segmentation.Class
"cars/car_47" SET Segmentation.Class className "Car"
"cars/car_47" SET Transform position (160 5 -30)
"cars/car_47" SET active true
CREATE "Cars/scania_450_dumpster_hauler/scania_450_dumpster_hauler" FROM "cars" AS "cars/car_48"
"cars/car_48" ADD Segmentation.Class
"cars/car_48" SET Segmentation.Class className "Car"
"cars/car_48" SET Transform position (160 5 -10)
"cars/car_48" SET active true
CREATE "Cars/truck_v010_008/truck_v010_008" FROM "cars" AS "cars/car_49"
"cars/car_49" ADD Segmentation.Class
"cars/car_49" SET Segmentation.Class className "Car"
"cars/car_49" SET Transform position (160 5 10)
"cars/car_49" SET active true
CREATE "Cars/volvo_th5/volvo_th5" FROM "cars" AS "cars/car_50"
"cars/car_50" ADD Segmentation.Class
"cars/car_50" SET Segmentation.Class className "Car"
"cars/car_50" SET Transform position (160 5 30)
"cars/car_50" SET active true
CREATE "Cars/vw_caravelle/vw_caravelle" FROM "cars" AS "cars/car_51"
"cars/car_51" ADD Segmentation.Class
"cars/car_51" SET Segmentation.Class className "Car"
"cars/car_51" SET Transform position (180 5 -30)
"cars/car_51" SET active true
CREATE "Cars/vw_golf_v/vw_golf_v" FROM "cars" AS "cars/car_52"
"cars/car_52" ADD Segmentation.Class
"cars/car_52" SET Segmentation.Class className "Car"
"cars/car_52" SET Transform position (180 5 -10)
"cars/car_52" SET active true
CREATE "Cars/vw_touareg/vw_touareg" FROM "cars" AS "cars/car_53"
"cars/car_53" ADD Segmentation.Class
"cars/car_53" SET Segmentation.Class className "Car"
"cars/car_53" SET Transform position (180 5 10)
"cars/car_53" SET active true
CREATE "Cars/vw_touran_2007/vw_touran_2007" FROM "cars" AS "cars/car_54"
"cars/car_54" ADD Segmentation.Class
"cars/car_54" SET Segmentation.Class className "Car"
"cars/car_54" SET Transform position (180 5 30)
"cars/car_54" SET active true
CREATE "Cars/vw_transporter/vw_transporter" FROM "cars" AS "cars/car_55"
"cars/car_55" ADD Segmentation.Class
"cars/car_55" SET Segmentation.Class className "Car"
"cars/car_55" SET Transform position (200 5 -30)
"cars/car_55" SET active true
CREATE "Cars/auditts/auditts" FROM "cars" AS "cars/car_56"
"cars/car_56" ADD Segmentation.Class
"cars/car_56" SET Segmentation.Class className "Car"
"cars/car_56" SET Transform position (200 5 -10)
"cars/car_56" SET active true
CREATE "Cars/audi_a2/audi_a2" FROM "cars" AS "cars/car_57"
"cars/car_57" ADD Segmentation.Class
"cars/car_57" SET Segmentation.Class className "Car"
"cars/car_57" SET Transform position (200 5 10)
"cars/car_57" SET active true
CREATE "Cars/audi_q7/audi_q7" FROM "cars" AS "cars/car_58"
"cars/car_58" ADD Segmentation.Class
"cars/car_58" SET Segmentation.Class className "Car"
"cars/car_58" SET Transform position (200 5 30)
"cars/car_58" SET active true
CREATE "Cars/audi_s3/audi_s3" FROM "cars" AS "cars/car_59"
"cars/car_59" ADD Segmentation.Class
"cars/car_59" SET Segmentation.Class className "Car"
"cars/car_59" SET Transform position (220 5 -30)
"cars/car_59" SET active true
CREATE "Cars/bentley_arnage/bentley_arnage" FROM "cars" AS "cars/car_60"
"cars/car_60" ADD Segmentation.Class
"cars/car_60" SET Segmentation.Class className "Car"
"cars/car_60" SET Transform position (220 5 -10)
"cars/car_60" SET active true
CREATE "Cars/bmw/bmw" FROM "cars" AS "cars/car_61"
"cars/car_61" ADD Segmentation.Class
"cars/car_61" SET Segmentation.Class className "Car"
"cars/car_61" SET Transform position (220 5 10)
"cars/car_61" SET active true
CREATE "Cars/bmw6_series_650i/bmw6_series_650i" FROM "cars" AS "cars/car_62"
"cars/car_62" ADD Segmentation.Class
"cars/car_62" SET Segmentation.Class className "Car"
"cars/car_62" SET Transform position (220 5 30)
"cars/car_62" SET active true
CREATE "Cars/bmw_760li/bmw_760li" FROM "cars" AS "cars/car_63"
"cars/car_63" ADD Segmentation.Class
"cars/car_63" SET Segmentation.Class className "Car"
"cars/car_63" SET Transform position (240 5 -30)
"cars/car_63" SET active true
CREATE "Cars/bmw_m3/bmw_m3" FROM "cars" AS "cars/car_64"
"cars/car_64" ADD Segmentation.Class
"cars/car_64" SET Segmentation.Class className "Car"
"cars/car_64" SET Transform position (240 5 -10)
"cars/car_64" SET active true
CREATE "Cars/bmw_m5/bmw_m5" FROM "cars" AS "cars/car_65"
"cars/car_65" ADD Segmentation.Class
"cars/car_65" SET Segmentation.Class className "Car"
"cars/car_65" SET Transform position (240 5 10)
"cars/car_65" SET active true
CREATE "Cars/bmw_m_limousine/bmw_m_limousine" FROM "cars" AS "cars/car_66"
"cars/car_66" ADD Segmentation.Class
"cars/car_66" SET Segmentation.Class className "Car"
"cars/car_66" SET Transform position (240 5 30)
"cars/car_66" SET active true
CREATE "Cars/cadillac_escalade_ext/cadillac_escalade_ext" FROM "cars" AS "cars/car_67"
"cars/car_67" ADD Segmentation.Class
"cars/car_67" SET Segmentation.Class className "Car"
"cars/car_67" SET Transform position (260 5 -30)
"cars/car_67" SET active true
CREATE "Cars/caterpillar_bulldozer_d9/caterpillar_bulldozer_d9" FROM "cars" AS "cars/car_68"
"cars/car_68" ADD Segmentation.Class
"cars/car_68" SET Segmentation.Class className "Car"
"cars/car_68" SET Transform position (260 5 -10)
"cars/car_68" SET active true
CREATE "Cars/chevrolet_cruze_2011/chevrolet_cruze_2011" FROM "cars" AS "cars/car_69"
"cars/car_69" ADD Segmentation.Class
"cars/car_69" SET Segmentation.Class className "Car"
"cars/car_69" SET Transform position (260 5 10)
"cars/car_69" SET active true
CREATE "Cars/chevrolet_s10/chevrolet_s10" FROM "cars" AS "cars/car_70"
"cars/car_70" ADD Segmentation.Class
"cars/car_70" SET Segmentation.Class className "Car"
"cars/car_70" SET Transform position (260 5 30)
"cars/car_70" SET active true
CREATE "Cars/chevrolet_tornado/chevrolet_tornado" FROM "cars" AS "cars/car_71"
"cars/car_71" ADD Segmentation.Class
"cars/car_71" SET Segmentation.Class className "Car"
"cars/car_71" SET Transform position (280 5 -30)
"cars/car_71" SET active true
CREATE "Cars/fiat500_new/fiat500_new" FROM "cars" AS "cars/car_72"
"cars/car_72" ADD Segmentation.Class
"cars/car_72" SET Segmentation.Class className "Car"
"cars/car_72" SET Transform position (280 5 -10)
"cars/car_72" SET active true
CREATE "Cars/fiat_131/fiat_131" FROM "cars" AS "cars/car_73"
"cars/car_73" ADD Segmentation.Class
"cars/car_73" SET Segmentation.Class className "Car"
"cars/car_73" SET Transform position (280 5 10)
"cars/car_73" SET active true
CREATE "Cars/fiat_500/fiat_500" FROM "cars" AS "cars/car_74"
"cars/car_74" ADD Segmentation.Class
"cars/car_74" SET Segmentation.Class className "Car"
"cars/car_74" SET Transform position (280 5 30)
"cars/car_74" SET active true
CREATE "Cars/ford_crown_victoria_taxi/ford_crown_victoria_taxi" FROM "cars" AS "cars/car_75"
"cars/car_75" ADD Segmentation.Class
"cars/car_75" SET Segmentation.Class className "Car"
"cars/car_75" SET Transform position (300 5 -30)
"cars/car_75" SET active true
CREATE "Cars/ford_fiesta/ford_fiesta" FROM "cars" AS "cars/car_76"
"cars/car_76" ADD Segmentation.Class
"cars/car_76" SET Segmentation.Class className "Car"
"cars/car_76" SET Transform position (300 5 -10)
"cars/car_76" SET active true
CREATE "Cars/ford_fire_department/ford_fire_department" FROM "cars" AS "cars/car_77"
"cars/car_77" ADD Segmentation.Class
"cars/car_77" SET Segmentation.Class className "Car"
"cars/car_77" SET Transform position (300 5 10)
"cars/car_77" SET active true
CREATE "Cars/ford_focus/ford_focus" FROM "cars" AS "cars/car_78"
"cars/car_78" ADD Segmentation.Class
"cars/car_78" SET Segmentation.Class className "Car"
"cars/car_78" SET Transform position (300 5 30)
"cars/car_78" SET active true
CREATE "Cars/ford_mustang_gt_eleanor/ford_mustang_gt_eleanor" FROM "cars" AS "cars/car_79"
"cars/car_79" ADD Segmentation.Class
"cars/car_79" SET Segmentation.Class className "Car"
"cars/car_79" SET Transform position (320 5 -30)
"cars/car_79" SET active true
CREATE "Cars/ford_shelby_cobra/ford_shelby_cobra" FROM "cars" AS "cars/car_80"
"cars/car_80" ADD Segmentation.Class
"cars/car_80" SET Segmentation.Class className "Car"
"cars/car_80" SET Transform position (320 5 -10)
"cars/car_80" SET active true
CREATE "Cars/ford_transit_jumbo/ford_transit_jumbo" FROM "cars" AS "cars/car_81"
"cars/car_81" ADD Segmentation.Class
"cars/car_81" SET Segmentation.Class className "Car"
"cars/car_81" SET Transform position (320 5 10)
"cars/car_81" SET active true
CREATE "Cars/freightliner_aerodyne/freightliner_aerodyne" FROM "cars" AS "cars/car_82"
"cars/car_82" ADD Segmentation.Class
"cars/car_82" SET Segmentation.Class className "Car"
"cars/car_82" SET Transform position (320 5 30)
"cars/car_82" SET active true
CREATE "Cars/honda_civic_sedan/honda_civic_sedan" FROM "cars" AS "cars/car_83"
"cars/car_83" ADD Segmentation.Class
"cars/car_83" SET Segmentation.Class className "Car"
"cars/car_83" SET Transform position (340 5 -30)
"cars/car_83" SET active true
CREATE "Cars/hummer_h2/hummer_h2" FROM "cars" AS "cars/car_84"
"cars/car_84" ADD Segmentation.Class
"cars/car_84" SET Segmentation.Class className "Car"
"cars/car_84" SET Transform position (340 5 -10)
"cars/car_84" SET active true
CREATE "Cars/international_ambulance_fdny/international_ambulance_fdny" FROM "cars" AS "cars/car_85"
"cars/car_85" ADD Segmentation.Class
"cars/car_85" SET Segmentation.Class className "Car"
"cars/car_85" SET Transform position (340 5 10)
"cars/car_85" SET active true
CREATE "Cars/international_school_bus/international_school_bus" FROM "cars" AS "cars/car_86"
"cars/car_86" ADD Segmentation.Class
"cars/car_86" SET Segmentation.Class className "Car"
"cars/car_86" SET Transform position (340 5 30)
"cars/car_86" SET active true
CREATE "Cars/kenworth_t600/kenworth_t600" FROM "cars" AS "cars/car_87"
"cars/car_87" ADD Segmentation.Class
"cars/car_87" SET Segmentation.Class className "Car"
"cars/car_87" SET Transform position (360 5 -30)
"cars/car_87" SET active true
CREATE "Cars/lamborghini_gallardo/lamborghini_gallardo" FROM "cars" AS "cars/car_88"
"cars/car_88" ADD Segmentation.Class
"cars/car_88" SET Segmentation.Class className "Car"
"cars/car_88" SET Transform position (360 5 -10)
"cars/car_88" SET active true
CREATE "Cars/lancia_delta/lancia_delta" FROM "cars" AS "cars/car_89"
"cars/car_89" ADD Segmentation.Class
"cars/car_89" SET Segmentation.Class className "Car"
"cars/car_89" SET Transform position (360 5 10)
"cars/car_89" SET active true
CREATE "Cars/mack_dumper/mack_dumper" FROM "cars" AS "cars/car_90"
"cars/car_90" ADD Segmentation.Class
"cars/car_90" SET Segmentation.Class className "Car"
"cars/car_90" SET Transform position (360 5 30)
"cars/car_90" SET active true
CREATE "Cars/mercedes_class_g_500/mercedes_class_g_500" FROM "cars" AS "cars/car_91"
"cars/car_91" ADD Segmentation.Class
"cars/car_91" SET Segmentation.Class className "Car"
"cars/car_91" SET Transform position (380 5 -30)
"cars/car_91" SET active true
CREATE "Cars/mercedes_slk/mercedes_slk" FROM "cars" AS "cars/car_92"
"cars/car_92" ADD Segmentation.Class
"cars/car_92" SET Segmentation.Class className "Car"
"cars/car_92" SET Transform position (380 5 -10)
"cars/car_92" SET active true
CREATE "Cars/mercedes_vario_brinks/mercedes_vario_brinks" FROM "cars" AS "cars/car_93"
"cars/car_93" ADD Segmentation.Class
"cars/car_93" SET Segmentation.Class className "Car"
"cars/car_93" SET Transform position (380 5 10)
"cars/car_93" SET active true
CREATE "Cars/mini_coopers/mini_coopers" FROM "cars" AS "cars/car_94"
"cars/car_94" ADD Segmentation.Class
"cars/car_94" SET Segmentation.Class className "Car"
"cars/car_94" SET Transform position (380 5 30)
"cars/car_94" SET active true
CREATE "Cars/nissan_elgrand/nissan_elgrand" FROM "cars" AS "cars/car_95"
"cars/car_95" ADD Segmentation.Class
"cars/car_95" SET Segmentation.Class className "Car"
"cars/car_95" SET Transform position (400 5 -30)
"cars/car_95" SET active true
CREATE "Cars/nissan_murano/nissan_murano" FROM "cars" AS "cars/car_96"
"cars/car_96" ADD Segmentation.Class
"cars/car_96" SET Segmentation.Class className "Car"
"cars/car_96" SET Transform position (400 5 -10)
"cars/car_96" SET active true
CREATE "Cars/peugeot_406/peugeot_406" FROM "cars" AS "cars/car_97"
"cars/car_97" ADD Segmentation.Class
"cars/car_97" SET Segmentation.Class className "Car"
"cars/car_97" SET Transform position (400 5 10)
"cars/car_97" SET active true
CREATE "Cars/rangerover/rangerover" FROM "cars" AS "cars/car_98"
"cars/car_98" ADD Segmentation.Class
"cars/car_98" SET Segmentation.Class className "Car"
"cars/car_98" SET Transform position (400 5 30)
"cars/car_98" SET active true
CREATE "Cars/renault_420/renault_420" FROM "cars" AS "cars/car_99"
"cars/car_99" ADD Segmentation.Class
"cars/car_99" SET Segmentation.Class className "Car"
"cars/car_99" SET Transform position (420 5 -30)
"cars/car_99" SET active true
CREATE "Cars/renault_g210/renault_g210" FROM "cars" AS "cars/car_100"
"cars/car_100" ADD Segmentation.Class
"cars/car_100" SET Segmentation.Class className "Car"
"cars/car_100" SET Transform position (420 5 -10)
"cars/car_100" SET active true
CREATE "Cars/renault_megane/renault_megane" FROM "cars" AS "cars/car_101"
"cars/car_101" ADD Segmentation.Class
"cars/car_101" SET Segmentation.Class className "Car"
"cars/car_101" SET Transform position (420 5 10)
"cars/car_101" SET active true
CREATE "Cars/renault_trm_2000/renault_trm_2000" FROM "cars" AS "cars/car_102"
"cars/car_102" ADD Segmentation.Class
"cars/car_102" SET Segmentation.Class className "Car"
"cars/car_102" SET Transform position (420 5 30)
"cars/car_102" SET active true
CREATE "Cars/scania_400_concretemixer/scania_400_concretemixer" FROM "cars" AS "cars/car_103"
"cars/car_103" ADD Segmentation.Class
"cars/car_103" SET Segmentation.Class className "Car"
"cars/car_103" SET Transform position (440 5 -30)
"cars/car_103" SET active true
CREATE "Cars/scania_450_dumpster_hauler/scania_450_dumpster_hauler" FROM "cars" AS "cars/car_104"
"cars/car_104" ADD Segmentation.Class
"cars/car_104" SET Segmentation.Class className "Car"
"cars/car_104" SET Transform position (440 5 -10)
"cars/car_104" SET active true
CREATE "Cars/truck_v010_008/truck_v010_008" FROM "cars" AS "cars/car_105"
"cars/car_105" ADD Segmentation.Class
"cars/car_105" SET Segmentation.Class className "Car"
"cars/car_105" SET Transform position (440 5 10)
"cars/car_105" SET active true
CREATE "Cars/volvo_th5/volvo_th5" FROM "cars" AS "cars/car_106"
"cars/car_106" ADD Segmentation.Class
"cars/car_106" SET Segmentation.Class className "Car"
"cars/car_106" SET Transform position (440 5 30)
"cars/car_106" SET active true
CREATE "Cars/vw_caravelle/vw_caravelle" FROM "cars" AS "cars/car_107"
"cars/car_107" ADD Segmentation.Class
"cars/car_107" SET Segmentation.Class className "Car"
"cars/car_107" SET Transform position (460 5 -30)
"cars/car_107" SET active true
CREATE "Cars/vw_golf_v/vw_golf_v" FROM "cars" AS "cars/car_108"
"cars/car_108" ADD Segmentation.Class
"cars/car_108" SET Segmentation.Class className "Car"
"cars/car_108" SET Transform position (460 5 -10)
"cars/car_108" SET active true
CREATE "Cars/vw_touareg/vw_touareg" FROM "cars" AS "cars/car_109"
"cars/car_109" ADD Segmentation.Class
"cars/car_109" SET Segmentation.Class className "Car"
"cars/car_109" SET Transform position (460 5 10)
"cars/car_109" SET active true
CREATE "Cars/vw_touran_2007/vw_touran_2007" FROM "cars" AS "cars/car_110"
"cars/car_110" ADD Segmentation.Class
"cars/car_110" SET Segmentation.Class className "Car"
"cars/car_110" SET Transform position (460 5 30)
"cars/car_110" SET active true
CREATE "Cars/vw_transporter/vw_transporter" FROM "cars" AS "cars/car_111"
"cars/car_111" ADD Segmentation.Class
"cars/car_111" SET Segmentation.Class className "Car"
"cars/car_111" SET Transform position (480 5 -30)
"cars/car_111" SET active true
CREATE "Cars/auditts/auditts" FROM "cars" AS "cars/car_112"
"cars/car_112" ADD Segmentation.Class
"cars/car_112" SET Segmentation.Class className "Car"
"cars/car_112" SET Transform position (480 5 -10)
"cars/car_112" SET active true
CREATE "Cars/audi_a2/audi_a2" FROM "cars" AS "cars/car_113"
"cars/car_113" ADD Segmentation.Class
"cars/car_113" SET Segmentation.Class className "Car"
"cars/car_113" SET Transform position (480 5 10)
"cars/car_113" SET active true
CREATE "Cars/audi_q7/audi_q7" FROM "cars" AS "cars/car_114"
"cars/car_114" ADD Segmentation.Class
"cars/car_114" SET Segmentation.Class className "Car"
"cars/car_114" SET Transform position (480 5 30)
"cars/car_114" SET active true
CREATE "Cars/audi_s3/audi_s3" FROM "cars" AS "cars/car_115"
"cars/car_115" ADD Segmentation.Class
"cars/car_115" SET Segmentation.Class className "Car"
"cars/car_115" SET Transform position (500 5 -30)
"cars/car_115" SET active true
CREATE "Cars/bentley_arnage/bentley_arnage" FROM "cars" AS "cars/car_116"
"cars/car_116" ADD Segmentation.Class
"cars/car_116" SET Segmentation.Class className "Car"
"cars/car_116" SET Transform position (500 5 -10)
"cars/car_116" SET active true
CREATE "Cars/bmw/bmw" FROM "cars" AS "cars/car_117"
"cars/car_117" ADD Segmentation.Class
"cars/car_117" SET Segmentation.Class className "Car"
"cars/car_117" SET Transform position (500 5 10)
"cars/car_117" SET active true
CREATE "Cars/bmw6_series_650i/bmw6_series_650i" FROM "cars" AS "cars/car_118"
"cars/car_118" ADD Segmentation.Class
"cars/car_118" SET Segmentation.Class className "Car"
"cars/car_118" SET Transform position (500 5 30)
"cars/car_118" SET active true
CREATE "Cars/bmw_760li/bmw_760li" FROM "cars" AS "cars/car_119"
"cars/car_119" ADD Segmentation.Class
"cars/car_119" SET Segmentation.Class className "Car"
"cars/car_119" SET Transform position (520 5 -30)
"cars/car_119" SET active true
CREATE "Cars/bmw_m3/bmw_m3" FROM "cars" AS "cars/car_120"
"cars/car_120" ADD Segmentation.Class
"cars/car_120" SET Segmentation.Class className "Car"
"cars/car_120" SET Transform position (520 5 -10)
"cars/car_120" SET active true
CREATE "Cars/bmw_m5/bmw_m5" FROM "cars" AS "cars/car_121"
"cars/car_121" ADD Segmentation.Class
"cars/car_121" SET Segmentation.Class className "Car"
"cars/car_121" SET Transform position (520 5 10)
"cars/car_121" SET active true
CREATE "Cars/bmw_m_limousine/bmw_m_limousine" FROM "cars" AS "cars/car_122"
"cars/car_122" ADD Segmentation.Class
"cars/car_122" SET Segmentation.Class className "Car"
"cars/car_122" SET Transform position (520 5 30)
"cars/car_122" SET active true
CREATE "Cars/cadillac_escalade_ext/cadillac_escalade_ext" FROM "cars" AS "cars/car_123"
"cars/car_123" ADD Segmentation.Class
"cars/car_123" SET Segmentation.Class className "Car"
"cars/car_123" SET Transform position (540 5 -30)
"cars/car_123" SET active true
CREATE "Cars/caterpillar_bulldozer_d9/caterpillar_bulldozer_d9" FROM "cars" AS "cars/car_124"
"cars/car_124" ADD Segmentation.Class
"cars/car_124" SET Segmentation.Class className "Car"
"cars/car_124" SET Transform position (540 5 -10)
"cars/car_124" SET active true
CREATE "Cars/chevrolet_cruze_2011/chevrolet_cruze_2011" FROM "cars" AS "cars/car_125"
"cars/car_125" ADD Segmentation.Class
"cars/car_125" SET Segmentation.Class className "Car"
"cars/car_125" SET Transform position (540 5 10)
"cars/car_125" SET active true
CREATE "Cars/chevrolet_s10/chevrolet_s10" FROM "cars" AS "cars/car_126"
"cars/car_126" ADD Segmentation.Class
"cars/car_126" SET Segmentation.Class className "Car"
"cars/car_126" SET Transform position (540 5 30)
"cars/car_126" SET active true
CREATE "Cars/chevrolet_tornado/chevrolet_tornado" FROM "cars" AS "cars/car_127"
"cars/car_127" ADD Segmentation.Class
"cars/car_127" SET Segmentation.Class className "Car"
"cars/car_127" SET Transform position (560 5 -30)
"cars/car_127" SET active true
CREATE "Cars/fiat500_new/fiat500_new" FROM "cars" AS "cars/car_128"
"cars/car_128" ADD Segmentation.Class
"cars/car_128" SET Segmentation.Class className "Car"
"cars/car_128" SET Transform position (560 5 -10)
"cars/car_128" SET active true
CREATE "Cars/fiat_131/fiat_131" FROM "cars" AS "cars/car_129"
"cars/car_129" ADD Segmentation.Class
"cars/car_129" SET Segmentation.Class className "Car"
"cars/car_129" SET Transform position (560 5 10)
"cars/car_129" SET active true
CREATE "Cars/fiat_500/fiat_500" FROM "cars" AS "cars/car_130"
"cars/car_130" ADD Segmentation.Class
"cars/car_130" SET Segmentation.Class className "Car"
"cars/car_130" SET Transform position (560 5 30)
"cars/car_130" SET active true
CREATE "Cars/ford_crown_victoria_taxi/ford_crown_victoria_taxi" FROM "cars" AS "cars/car_131"
"cars/car_131" ADD Segmentation.Class
"cars/car_131" SET Segmentation.Class className "Car"
"cars/car_131" SET Transform position (580 5 -30)
"cars/car_131" SET active true
CREATE "Cars/ford_fiesta/ford_fiesta" FROM "cars" AS "cars/car_132"
"cars/car_132" ADD Segmentation.Class
"cars/car_132" SET Segmentation.Class className "Car"
"cars/car_132" SET Transform position (580 5 -10)
"cars/car_132" SET active true
CREATE "Cars/ford_fire_department/ford_fire_department" FROM "cars" AS "cars/car_133"
"cars/car_133" ADD Segmentation.Class
"cars/car_133" SET Segmentation.Class className "Car"
"cars/car_133" SET Transform position (580 5 10)
"cars/car_133" SET active true
CREATE "Cars/ford_focus/ford_focus" FROM "cars" AS "cars/car_134"
"cars/car_134" ADD Segmentation.Class
"cars/car_134" SET Segmentation.Class className "Car"
"cars/car_134" SET Transform position (580 5 30)
"cars/car_134" SET active true
CREATE "Cars/ford_mustang_gt_eleanor/ford_mustang_gt_eleanor" FROM "cars" AS "cars/car_135"
"cars/car_135" ADD Segmentation.Class
"cars/car_135" SET Segmentation.Class className "Car"
"cars/car_135" SET Transform position (600 5 -30)
"cars/car_135" SET active true
CREATE "Cars/ford_shelby_cobra/ford_shelby_cobra" FROM "cars" AS "cars/car_136"
"cars/car_136" ADD Segmentation.Class
"cars/car_136" SET Segmentation.Class className "Car"
"cars/car_136" SET Transform position (600 5 -10)
"cars/car_136" SET active true
CREATE "Cars/ford_transit_jumbo/ford_transit_jumbo" FROM "cars" AS "cars/car_137"
"cars/car_137" ADD Segmentation.Class
"cars/car_137" SET Segmentation.Class className "Car"
"cars/car_137" SET Transform position (600 5 10)
"cars/car_137" SET active true
CREATE "Cars/freightliner_aerodyne/freightliner_aerodyne" FROM "cars" AS "cars/car_138"
"cars/car_138" ADD Segmentation.Class
"cars/car_138" SET Segmentation.Class className "Car"
"cars/car_138" SET Transform position (600 5 30)
"cars/car_138" SET active true
CREATE "Cars/honda_civic_sedan/honda_civic_sedan" FROM "cars" AS "cars/car_139"
"cars/car_139" ADD Segmentation.Class
"cars/car_139" SET Segmentation.Class className "Car"
"cars/car_139" SET Transform position (620 5 -30)
"cars/car_139" SET active true
CREATE "Cars/hummer_h2/hummer_h2" FROM "cars" AS "cars/car_140"
"cars/car_140" ADD Segmentation.Class
"cars/car_140" SET Segmentation.Class className "Car"
"cars/car_140" SET Transform position (620 5 -10)
"cars/car_140" SET active true
CREATE "Cars/international_ambulance_fdny/international_ambulance_fdny" FROM "cars" AS "cars/car_141"
"cars/car_141" ADD Segmentation.Class
"cars/car_141" SET Segmentation.Class className "Car"
"cars/car_141" SET Transform position (620 5 10)
"cars/car_141" SET active true
CREATE "Cars/international_school_bus/international_school_bus" FROM "cars" AS "cars/car_142"
"cars/car_142" ADD Segmentation.Class
"cars/car_142" SET Segmentation.Class className "Car"
"cars/car_142" SET Transform position (620 5 30)
"cars/car_142" SET active true
CREATE "Cars/kenworth_t600/kenworth_t600" FROM "cars" AS "cars/car_143"
"cars/car_143" ADD Segmentation.Class
"cars/car_143" SET Segmentation.Class className "Car"
"cars/car_143" SET Transform position (640 5 -30)
"cars/car_143" SET active true
CREATE "Cars/lamborghini_gallardo/lamborghini_gallardo" FROM "cars" AS "cars/car_144"
"cars/car_144" ADD Segmentation.Class
"cars/car_144" SET Segmentation.Class className "Car"
"cars/car_144" SET Transform position (640 5 -10)
"cars/car_144" SET active true
CREATE "Cars/lancia_delta/lancia_delta" FROM "cars" AS "cars/car_145"
"cars/car_145" ADD Segmentation.Class
"cars/car_145" SET Segmentation.Class className "Car"
"cars/car_145" SET Transform position (640 5 10)
"cars/car_145" SET active true
CREATE "Cars/mack_dumper/mack_dumper" FROM "cars" AS "cars/car_146"
"cars/car_146" ADD Segmentation.Class
"cars/car_146" SET Segmentation.Class className "Car"
"cars/car_146" SET Transform position (640 5 30)
"cars/car_146" SET active true
CREATE "Cars/mercedes_class_g_500/mercedes_class_g_500" FROM "cars" AS "cars/car_147"
"cars/car_147" ADD Segmentation.Class
"cars/car_147" SET Segmentation.Class className "Car"
"cars/car_147" SET Transform position (660 5 -30)
"cars/car_147" SET active true
CREATE "Cars/mercedes_slk/mercedes_slk" FROM "cars" AS "cars/car_148"
"cars/car_148" ADD Segmentation.Class
"cars/car_148" SET Segmentation.Class className "Car"
"cars/car_148" SET Transform position (660 5 -10)
"cars/car_148" SET active true
CREATE "Cars/mercedes_vario_brinks/mercedes_vario_brinks" FROM "cars" AS "cars/car_149"
"cars/car_149" ADD Segmentation.Class
"cars/car_149" SET Segmentation.Class className "Car"
"cars/car_149" SET Transform position (660 5 10)
"cars/car_149" SET active true
CREATE "Cars/mini_coopers/mini_coopers" FROM "cars" AS "cars/car_150"
"cars/car_150" ADD Segmentation.Class
"cars/car_150" SET Segmentation.Class className "Car"
"cars/car_150" SET Transform position (660 5 30)
"cars/car_150" SET active true
CREATE "Cars/nissan_elgrand/nissan_elgrand" FROM "cars" AS "cars/car_151"
"cars/car_151" ADD Segmentation.Class
"cars/car_151" SET Segmentation.Class className "Car"
"cars/car_151" SET Transform position (680 5 -30)
"cars/car_151" SET active true
CREATE "Cars/nissan_murano/nissan_murano" FROM "cars" AS "cars/car_152"
"cars/car_152" ADD Segmentation.Class
"cars/car_152" SET Segmentation.Class className "Car"
"cars/car_152" SET Transform position (680 5 -10)
"cars/car_152" SET active true
CREATE "Cars/peugeot_406/peugeot_406" FROM "cars" AS "cars/car_153"
"cars/car_153" ADD Segmentation.Class
"cars/car_153" SET Segmentation.Class className "Car"
"cars/car_153" SET Transform position (680 5 10)
"cars/car_153" SET active true
CREATE "Cars/rangerover/rangerover" FROM "cars" AS "cars/car_154"
"cars/car_154" ADD Segmentation.Class
"cars/car_154" SET Segmentation.Class className "Car"
"cars/car_154" SET Transform position (680 5 30)
"cars/car_154" SET active true
CREATE "Cars/renault_420/renault_420" FROM "cars" AS "cars/car_155"
"cars/car_155" ADD Segmentation.Class
"cars/car_155" SET Segmentation.Class className "Car"
"cars/car_155" SET Transform position (700 5 -30)
"cars/car_155" SET active true
CREATE "Cars/renault_g210/renault_g210" FROM "cars" AS "cars/car_156"
"cars/car_156" ADD Segmentation.Class
"cars/car_156" SET Segmentation.Class className "Car"
"cars/car_156" SET Transform position (700 5 -10)
"cars/car_156" SET active true
CREATE "Cars/renault_megane/renault_megane" FROM "cars" AS "cars/car_157"
"cars/car_157" ADD Segmentation.Class
"cars/car_157" SET Segmentation.Class className "Car"
"cars/car_157" SET Transform position (700 5 10)
"cars/car_157" SET active true
CREATE "Cars/renault_trm_2000/renault_trm_2000" FROM "cars" AS "cars/car_158"
"cars/car_158" ADD Segmentation.Class
"cars/car_158" SET Segmentation.Class className "Car"
"cars/car_158" SET Transform position (700 5 30)
"cars/car_158" SET active true
CREATE "Cars/scania_400_concretemixer/scania_400_concretemixer" FROM "cars" AS "cars/car_159"
"cars/car_159" ADD Segmentation.Class
"cars/car_159" SET Segmentation.Class className "Car"
"cars/car_159" SET Transform position (720 5 -30)
"cars/car_159" SET active true
CREATE "Cars/scania_450_dumpster_hauler/scania_450_dumpster_hauler" FROM "cars" AS "cars/car_160"
"cars/car_160" ADD Segmentation.Class
"cars/car_160" SET Segmentation.Class className "Car"
"cars/car_160" SET Transform position (720 5 -10)
"cars/car_160" SET active true
CREATE "Cars/truck_v010_008/truck_v010_008" FROM "cars" AS "cars/car_161"
"cars/car_161" ADD Segmentation.Class
"cars/car_161" SET Segmentation.Class className "Car"
"cars/car_161" SET Transform position (720 5 10)
"cars/car_161" SET active true
CREATE "Cars/volvo_th5/volvo_th5" FROM "cars" AS "cars/car_162"
"cars/car_162" ADD Segmentation.Class
"cars/car_162" SET Segmentation.Class className "Car"
"cars/car_162" SET Transform position (720 5 30)
"cars/car_162" SET active true
CREATE "Cars/vw_caravelle/vw_caravelle" FROM "cars" AS "cars/car_163"
"cars/car_163" ADD Segmentation.Class
"cars/car_163" SET Segmentation.Class className "Car"
"cars/car_163" SET Transform position (740 5 -30)
"cars/car_163" SET active true
CREATE "Cars/vw_golf_v/vw_golf_v" FROM "cars" AS "cars/car_164"
"cars/car_164" ADD Segmentation.Class
"cars/car_164" SET Segmentation.Class className "Car"
"cars/car_164" SET Transform position (740 5 -10)
"cars/car_164" SET active true
CREATE "Cars/vw_touareg/vw_touareg" FROM "cars" AS "cars/car_165"
"cars/car_165" ADD Segmentation.Class
"cars/car_165" SET Segmentation.Class className "Car"
"cars/car_165" SET Transform position (740 5 10)
"cars/car_165" SET active true
CREATE "Cars/vw_touran_2007/vw_touran_2007" FROM "cars" AS "cars/car_166"
"cars/car_166" ADD Segmentation.Class
"cars/car_166" SET Segmentation.Class className "Car"
"cars/car_166" SET Transform position (740 5 30)
"cars/car_166" SET active true
CREATE "Cars/vw_transporter/vw_transporter" FROM "cars" AS "cars/car_167"
"cars/car_167" ADD Segmentation.Class
"cars/car_167" SET Segmentation.Class className "Car"
"cars/car_167" SET Transform position (760 5 -30)
"cars/car_167" SET active true
CREATE "Cars/auditts/auditts" FROM "cars" AS "cars/car_168"
"cars/car_168" ADD Segmentation.Class
"cars/car_168" SET Segmentation.Class className "Car"
"cars/car_168" SET Transform position (760 5 -10)
"cars/car_168" SET active true
CREATE "Cars/audi_a2/audi_a2" FROM "cars" AS "cars/car_169"
"cars/car_169" ADD Segmentation.Class
"cars/car_169" SET Segmentation.Class className "Car"
"cars/car_169" SET Transform position (760 5 10)
"cars/car_169" SET active true
CREATE "Cars/audi_q7/audi_q7" FROM "cars" AS "cars/car_170"
"cars/car_170" ADD Segmentation.Class
"cars/car_170" SET Segmentation.Class className "Car"
"cars/car_170" SET Transform position (760 5 30)
"cars/car_170" SET active true
CREATE "Cars/audi_s3/audi_s3" FROM "cars" AS "cars/car_171"
"cars/car_171" ADD Segmentation.Class
"cars/car_171" SET Segmentation.Class className "Car"
"cars/car_171" SET Transform position (780 5 -30)
"cars/car_171" SET active true
CREATE "Cars/bentley_arnage/bentley_arnage" FROM "cars" AS "cars/car_172"
"cars/car_172" ADD Segmentation.Class
"cars/car_172" SET Segmentation.Class className "Car"
"cars/car_172" SET Transform position (780 5 -10)
"cars/car_172" SET active true
CREATE "Cars/bmw/bmw" FROM "cars" AS "cars/car_173"
"cars/car_173" ADD Segmentation.Class
"cars/car_173" SET Segmentation.Class className "Car"
"cars/car_173" SET Transform position (780 5 10)
"cars/car_173" SET active true
CREATE "Cars/bmw6_series_650i/bmw6_series_650i" FROM "cars" AS "cars/car_174"
"cars/car_174" ADD Segmentation.Class
"cars/car_174" SET Segmentation.Class className "Car"
"cars/car_174" SET Transform position (780 5 30)
"cars/car_174" SET active true
CREATE "Cars/bmw_760li/bmw_760li" FROM "cars" AS "cars/car_175"
"cars/car_175" ADD Segmentation.Class
"cars/car_175" SET Segmentation.Class className "Car"
"cars/car_175" SET Transform position (800 5 -30)
"cars/car_175" SET active true
CREATE "Cars/bmw_m3/bmw_m3" FROM "cars" AS "cars/car_176"
"cars/car_176" ADD Segmentation.Class
"cars/car_176" SET Segmentation.Class className "Car"
"cars/car_176" SET Transform position (800 5 -10)
"cars/car_176" SET active true
CREATE "Cars/bmw_m5/bmw_m5" FROM "cars" AS "cars/car_177"
"cars/car_177" ADD Segmentation.Class
"cars/car_177" SET Segmentation.Class className "Car"
"cars/car_177" SET Transform position (800 5 10)
"cars/car_177" SET active true
CREATE "Cars/bmw_m_limousine/bmw_m_limousine" FROM "cars" AS "cars/car_178"
"cars/car_178" ADD Segmentation.Class
"cars/car_178" SET Segmentation.Class className "Car"
"cars/car_178" SET Transform position (800 5 30)
"cars/car_178" SET active true
CREATE "Cars/cadillac_escalade_ext/cadillac_escalade_ext" FROM "cars" AS "cars/car_179"
"cars/car_179" ADD Segmentation.Class
"cars/car_179" SET Segmentation.Class className "Car"
"cars/car_179" SET Transform position (820 5 -30)
"cars/car_179" SET active true
CREATE "Cars/caterpillar_bulldozer_d9/caterpillar_bulldozer_d9" FROM "cars" AS "cars/car_180"
"cars/car_180" ADD Segmentation.Class
"cars/car_180" SET Segmentation.Class className "Car"
"cars/car_180" SET Transform position (820 5 -10)
"cars/car_180" SET active true
CREATE "Cars/chevrolet_cruze_2011/chevrolet_cruze_2011" FROM "cars" AS "cars/car_181"
"cars/car_181" ADD Segmentation.Class
"cars/car_181" SET Segmentation.Class className "Car"
"cars/car_181" SET Transform position (820 5 10)
"cars/car_181" SET active true
CREATE "Cars/chevrolet_s10/chevrolet_s10" FROM "cars" AS "cars/car_182"
"cars/car_182" ADD Segmentation.Class
"cars/car_182" SET Segmentation.Class className "Car"
"cars/car_182" SET Transform position (820 5 30)
"cars/car_182" SET active true
CREATE "Cars/chevrolet_tornado/chevrolet_tornado" FROM "cars" AS "cars/car_183"
"cars/car_183" ADD Segmentation.Class
"cars/car_183" SET Segmentation.Class className "Car"
"cars/car_183" SET Transform position (840 5 -30)
"cars/car_183" SET active true
CREATE "Cars/fiat500_new/fiat500_new" FROM "cars" AS "cars/car_184"
"cars/car_184" ADD Segmentation.Class
"cars/car_184" SET Segmentation.Class className "Car"
"cars/car_184" SET Transform position (840 5 -10)
"cars/car_184" SET active true
CREATE "Cars/fiat_131/fiat_131" FROM "cars" AS "cars/car_185"
"cars/car_185" ADD Segmentation.Class
"cars/car_185" SET Segmentation.Class className "Car"
"cars/car_185" SET Transform position (840 5 10)
"cars/car_185" SET active true
CREATE "Cars/fiat_500/fiat_500" FROM "cars" AS "cars/car_186"
"cars/car_186" ADD Segmentation.Class
"cars/car_186" SET Segmentation.Class className "Car"
"cars/car_186" SET Transform position (840 5 30)
"cars/car_186" SET active true
CREATE "Cars/ford_crown_victoria_taxi/ford_crown_victoria_taxi" FROM "cars" AS "cars/car_187"
"cars/car_187" ADD Segmentation.Class
"cars/car_187" SET Segmentation.Class className "Car"
"cars/car_187" SET Transform position (860 5 -30)
"cars/car_187" SET active true
CREATE "Cars/ford_fiesta/ford_fiesta" FROM "cars" AS "cars/car_188"
"cars/car_188" ADD Segmentation.Class
"cars/car_188" SET Segmentation.Class className "Car"
"cars/car_188" SET Transform position (860 5 -10)
"cars/car_188" SET active true
CREATE "Cars/ford_fire_department/ford_fire_department" FROM "cars" AS "cars/car_189"
"cars/car_189" ADD Segmentation.Class
"cars/car_189" SET Segmentation.Class className "Car"
"cars/car_189" SET Transform position (860 5 10)
"cars/car_189" SET active true
CREATE "Cars/ford_focus/ford_focus" FROM "cars" AS "cars/car_190"
"cars/car_190" ADD Segmentation.Class
"cars/car_190" SET Segmentation.Class className "Car"
"cars/car_190" SET Transform position (860 5 30)
"cars/car_190" SET active true
CREATE "Cars/ford_mustang_gt_eleanor/ford_mustang_gt_eleanor" FROM "cars" AS "cars/car_191"
"cars/car_191" ADD Segmentation.Class
"cars/car_191" SET Segmentation.Class className "Car"
"cars/car_191" SET Transform position (880 5 -30)
"cars/car_191" SET active true
CREATE "Cars/ford_shelby_cobra/ford_shelby_cobra" FROM "cars" AS "cars/car_192"
"cars/car_192" ADD Segmentation.Class
"cars/car_192" SET Segmentation.Class className "Car"
"cars/car_192" SET Transform position (880 5 -10)
"cars/car_192" SET active true
CREATE "Cars/ford_transit_jumbo/ford_transit_jumbo" FROM "cars" AS "cars/car_193"
"cars/car_193" ADD Segmentation.Class
"cars/car_193" SET Segmentation.Class className "Car"
"cars/car_193" SET Transform position (880 5 10)
"cars/car_193" SET active true
CREATE "Cars/freightliner_aerodyne/freightliner_aerodyne" FROM "cars" AS "cars/car_194"
"cars/car_194" ADD Segmentation.Class
"cars/car_194" SET Segmentation.Class className "Car"
"cars/car_194" SET Transform position (880 5 30)
"cars/car_194" SET active true
CREATE "Cars/honda_civic_sedan/honda_civic_sedan" FROM "cars" AS "cars/car_195"
"cars/car_195" ADD Segmentation.Class
"cars/car_195" SET Segmentation.Class className "Car"
"cars/car_195" SET Transform position (900 5 -30)
"cars/car_195" SET active true
CREATE "Cars/hummer_h2/hummer_h2" FROM "cars" AS "cars/car_196"
"cars/car_196" ADD Segmentation.Class
"cars/car_196" SET Segmentation.Class className "Car"
"cars/car_196" SET Transform position (900 5 -10)
"cars/car_196" SET active true
CREATE "Cars/international_ambulance_fdny/international_ambulance_fdny" FROM "cars" AS "cars/car_197"
"cars/car_197" ADD Segmentation.Class
"cars/car_197" SET Segmentation.Class className "Car"
"cars/car_197" SET Transform position (900 5 10)
"cars/car_197" SET active true
CREATE "Cars/international_school_bus/international_school_bus" FROM "cars" AS "cars/car_198"
"cars/car_198" ADD Segmentation.Class
"cars/car_198" SET Segmentation.Class className "Car"
"cars/car_198" SET Transform position (900 5 30)
"cars/car_198" SET active true
CREATE "Cars/kenworth_t600/kenworth_t600" FROM "cars" AS "cars/car_199"
"cars/car_199" ADD Segmentation.Class
"cars/car_199" SET Segmentation.Class className "Car"
"cars/car_199" SET Transform position (920 5 -30)
"cars/car_199" SET active true
CREATE "spawner/city/nature/trees/container"
"spawner/city/nature/trees/container" SET active false
"spawner/city/nature/trees/container" ADD RandomProps.Torus
"spawner/city/nature/trees/container" ADD RandomProps.PropArea
"spawner/city/nature/trees/container" SET RandomProps.PropArea tags "tree"
"spawner/city/nature/trees/container" SET RandomProps.PropArea async false numberOfProps 250 collisionCheck false stickToGround false 
"spawner/city/nature/trees/container" SET RandomProps.Torus innerRadius 30
"spawner/city/nature/trees/container" SET RandomProps.Torus radius 80
"spawner/city/nature/trees/container" SET Transform position (0 10 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/city/nature/trees/container" SET active true
"spawner/city/nature/trees" SET active true
CREATE "spawner/city/signs/container"
"spawner/city/signs/container" SET active false
"spawner/city/signs/container" ADD RandomProps.Torus
"spawner/city/signs/container" ADD RandomProps.PropArea
"spawner/city/signs/container" SET RandomProps.PropArea tags "sign"
"spawner/city/signs/container" SET RandomProps.PropArea async false numberOfProps 100 collisionCheck true stickToGround false 
"spawner/city/signs/container" SET RandomProps.Torus innerRadius 0
"spawner/city/signs/container" SET RandomProps.Torus radius 35
"spawner/city/signs/container" SET Transform position (0 10 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/city/signs/container" SET active true
"spawner/city/signs" SET active true
CREATE "spawner/animals/container"
"spawner/animals/container" SET active false
"spawner/animals/container" ADD RandomProps.Torus
"spawner/animals/container" ADD RandomProps.PropArea
"spawner/animals/container" SET RandomProps.PropArea tags "animal"
"spawner/animals/container" SET RandomProps.PropArea async false numberOfProps 300 collisionCheck true stickToGround false 
"spawner/animals/container" SET RandomProps.Torus innerRadius 0
"spawner/animals/container" SET RandomProps.Torus radius 50
"spawner/animals/container" SET Transform position (0 10 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/animals/container" SET active true
"spawner/animals" SET active true
CREATE "spawner/city/buildings/container"
"spawner/city/buildings/container" SET active false
"spawner/city/buildings/container" ADD RandomProps.Torus
"spawner/city/buildings/container" ADD RandomProps.PropArea
"spawner/city/buildings/container" SET RandomProps.PropArea tags "building"
"spawner/city/buildings/container" SET RandomProps.PropArea async false numberOfProps 100 collisionCheck true stickToGround false 
"spawner/city/buildings/container" SET RandomProps.Torus innerRadius 80
"spawner/city/buildings/container" SET RandomProps.Torus radius 335
"spawner/city/buildings/container" SET Transform position (0 10 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/city/buildings/container" SET active true
"spawner/city/buildings" SET active true
CREATE "spawner/city/ground_0/container"
"spawner/city/ground_0/container" SET active false
"spawner/city/ground_0/container" ADD RandomProps.Torus
"spawner/city/ground_0/container" ADD RandomProps.PropArea
"spawner/city/ground_0/container" SET RandomProps.PropArea tags "ground"
"spawner/city/ground_0/container" SET RandomProps.PropArea async false numberOfProps 50 collisionCheck false stickToGround false 
"spawner/city/ground_0/container" SET RandomProps.Torus innerRadius 0
"spawner/city/ground_0/container" SET RandomProps.Torus radius 50
"spawner/city/ground_0/container" SET Transform position (0 0 0) eulerAngles (0 0 0) localScale (2 2 2)
"spawner/city/ground_0/container" SET active true
"spawner/city/ground_0" SET active true
CREATE "spawner/city/ground_1/container"
"spawner/city/ground_1/container" SET active false
"spawner/city/ground_1/container" ADD RandomProps.Torus
"spawner/city/ground_1/container" ADD RandomProps.PropArea
"spawner/city/ground_1/container" SET RandomProps.PropArea tags "ground"
"spawner/city/ground_1/container" SET RandomProps.PropArea async false numberOfProps 50 collisionCheck false stickToGround false 
"spawner/city/ground_1/container" SET RandomProps.Torus innerRadius 0
"spawner/city/ground_1/container" SET RandomProps.Torus radius 50
"spawner/city/ground_1/container" SET Transform position (0 1 0) eulerAngles (0 0 0) localScale (2 2 2)
"spawner/city/ground_1/container" SET active true
"spawner/city/ground_1" SET active true
CREATE "spawner/city/ground_2/container"
"spawner/city/ground_2/container" SET active false
"spawner/city/ground_2/container" ADD RandomProps.Torus
"spawner/city/ground_2/container" ADD RandomProps.PropArea
"spawner/city/ground_2/container" SET RandomProps.PropArea tags "ground"
"spawner/city/ground_2/container" SET RandomProps.PropArea async false numberOfProps 50 collisionCheck false stickToGround false 
"spawner/city/ground_2/container" SET RandomProps.Torus innerRadius 0
"spawner/city/ground_2/container" SET RandomProps.Torus radius 50
"spawner/city/ground_2/container" SET Transform position (0 2 0) eulerAngles (0 0 0) localScale (2 2 2)
"spawner/city/ground_2/container" SET active true
"spawner/city/ground_2" SET active true
CREATE "spawner/city/ground_3/container"
"spawner/city/ground_3/container" SET active false
"spawner/city/ground_3/container" ADD RandomProps.Torus
"spawner/city/ground_3/container" ADD RandomProps.PropArea
"spawner/city/ground_3/container" SET RandomProps.PropArea tags "ground"
"spawner/city/ground_3/container" SET RandomProps.PropArea async false numberOfProps 50 collisionCheck false stickToGround false 
"spawner/city/ground_3/container" SET RandomProps.Torus innerRadius 0
"spawner/city/ground_3/container" SET RandomProps.Torus radius 50
"spawner/city/ground_3/container" SET Transform position (0 3 0) eulerAngles (0 0 0) localScale (2 2 2)
"spawner/city/ground_3/container" SET active true
"spawner/city/ground_3" SET active true
CREATE "spawner/city/ground_4/container"
"spawner/city/ground_4/container" SET active false
"spawner/city/ground_4/container" ADD RandomProps.Torus
"spawner/city/ground_4/container" ADD RandomProps.PropArea
"spawner/city/ground_4/container" SET RandomProps.PropArea tags "ground"
"spawner/city/ground_4/container" SET RandomProps.PropArea async false numberOfProps 50 collisionCheck false stickToGround false 
"spawner/city/ground_4/container" SET RandomProps.Torus innerRadius 0
"spawner/city/ground_4/container" SET RandomProps.Torus radius 50
"spawner/city/ground_4/container" SET Transform position (0 4 0) eulerAngles (0 0 0) localScale (2 2 2)
"spawner/city/ground_4/container" SET active true
"spawner/city/ground_4" SET active true
CREATE "spawner/city/ground_5/container"
"spawner/city/ground_5/container" SET active false
"spawner/city/ground_5/container" ADD RandomProps.Torus
"spawner/city/ground_5/container" ADD RandomProps.PropArea
"spawner/city/ground_5/container" SET RandomProps.PropArea tags "ground"
"spawner/city/ground_5/container" SET RandomProps.PropArea async false numberOfProps 50 collisionCheck false stickToGround false 
"spawner/city/ground_5/container" SET RandomProps.Torus innerRadius 0
"spawner/city/ground_5/container" SET RandomProps.Torus radius 50
"spawner/city/ground_5/container" SET Transform position (0 5 0) eulerAngles (0 0 0) localScale (2 2 2)
"spawner/city/ground_5/container" SET active true
"spawner/city/ground_5" SET active true
CREATE "spawner/city/ground_6/container"
"spawner/city/ground_6/container" SET active false
"spawner/city/ground_6/container" ADD RandomProps.Torus
"spawner/city/ground_6/container" ADD RandomProps.PropArea
"spawner/city/ground_6/container" SET RandomProps.PropArea tags "ground"
"spawner/city/ground_6/container" SET RandomProps.PropArea async false numberOfProps 50 collisionCheck false stickToGround false 
"spawner/city/ground_6/container" SET RandomProps.Torus innerRadius 0
"spawner/city/ground_6/container" SET RandomProps.Torus radius 50
"spawner/city/ground_6/container" SET Transform position (0 6 0) eulerAngles (0 0 0) localScale (2 2 2)
"spawner/city/ground_6/container" SET active true
"spawner/city/ground_6" SET active true
CREATE "spawner/city/ground_7/container"
"spawner/city/ground_7/container" SET active false
"spawner/city/ground_7/container" ADD RandomProps.Torus
"spawner/city/ground_7/container" ADD RandomProps.PropArea
"spawner/city/ground_7/container" SET RandomProps.PropArea tags "ground"
"spawner/city/ground_7/container" SET RandomProps.PropArea async false numberOfProps 50 collisionCheck false stickToGround false 
"spawner/city/ground_7/container" SET RandomProps.Torus innerRadius 0
"spawner/city/ground_7/container" SET RandomProps.Torus radius 50
"spawner/city/ground_7/container" SET Transform position (0 7 0) eulerAngles (0 0 0) localScale (2 2 2)
"spawner/city/ground_7/container" SET active true
"spawner/city/ground_7" SET active true
CREATE "spawner/city/ground_8/container"
"spawner/city/ground_8/container" SET active false
"spawner/city/ground_8/container" ADD RandomProps.Torus
"spawner/city/ground_8/container" ADD RandomProps.PropArea
"spawner/city/ground_8/container" SET RandomProps.PropArea tags "ground"
"spawner/city/ground_8/container" SET RandomProps.PropArea async false numberOfProps 50 collisionCheck false stickToGround false 
"spawner/city/ground_8/container" SET RandomProps.Torus innerRadius 0
"spawner/city/ground_8/container" SET RandomProps.Torus radius 50
"spawner/city/ground_8/container" SET Transform position (0 8 0) eulerAngles (0 0 0) localScale (2 2 2)
"spawner/city/ground_8/container" SET active true
"spawner/city/ground_8" SET active true
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/segmentation" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/cameraRGB" SET Transform eulerAngles (90 0 0)
"cameras/segmentation" SET Transform eulerAngles (90 0 0)
