"disk1" SET Sensors.Disk counter 1
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"Buildings" SET active false
"Trees" SET active false
"Humans" SET active false
"Buildings" SET active true
"Trees" SET active true
"Humans" SET active true
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"Buildings" SET active false
"Trees" SET active false
"Humans" SET active false
"Buildings" SET active true
"Trees" SET active true
"Humans" SET active true
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"Buildings" SET active false
"Trees" SET active false
"Humans" SET active false
"Buildings" SET active true
"Trees" SET active true
"Humans" SET active true
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"Buildings" SET active false
"Trees" SET active false
"Humans" SET active false
"Buildings" SET active true
"Trees" SET active true
"Humans" SET active true
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"Buildings" SET active false
"Trees" SET active false
"Humans" SET active false
"Buildings" SET active true
"Trees" SET active true
"Humans" SET active true
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"Buildings" SET active false
"Trees" SET active false
"Humans" SET active false
"Buildings" SET active true
"Trees" SET active true
"Humans" SET active true
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"Buildings" SET active false
"Trees" SET active false
"Humans" SET active false
"Buildings" SET active true
"Trees" SET active true
"Humans" SET active true
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"Buildings" SET active false
"Trees" SET active false
"Humans" SET active false
"Buildings" SET active true
"Trees" SET active true
"Humans" SET active true
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"Buildings" SET active false
"Trees" SET active false
"Humans" SET active false
"Buildings" SET active true
"Trees" SET active true
"Humans" SET active true
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"Buildings" SET active false
"Trees" SET active false
"Humans" SET active false
"Buildings" SET active true
"Trees" SET active true
"Humans" SET active true
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"Buildings" SET active false
"Trees" SET active false
"Humans" SET active false
"Buildings" SET active true
"Trees" SET active true
"Humans" SET active true
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"Buildings" SET active false
"Trees" SET active false
"Humans" SET active false
"Buildings" SET active true
"Trees" SET active true
"Humans" SET active true
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"Buildings" SET active false
"Trees" SET active false
"Humans" SET active false
"Buildings" SET active true
"Trees" SET active true
"Humans" SET active true
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"Buildings" SET active false
"Trees" SET active false
"Humans" SET active false
"Buildings" SET active true
"Trees" SET active true
"Humans" SET active true
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"Buildings" SET active false
"Trees" SET active false
"Humans" SET active false
"Buildings" SET active true
"Trees" SET active true
"Humans" SET active true
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"Buildings" SET active false
"Trees" SET active false
"Humans" SET active false
"Buildings" SET active true
"Trees" SET active true
"Humans" SET active true
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"Buildings" SET active false
"Trees" SET active false
"Humans" SET active false
"Buildings" SET active true
"Trees" SET active true
"Humans" SET active true
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"Buildings" SET active false
"Trees" SET active false
"Humans" SET active false
"Buildings" SET active true
"Trees" SET active true
"Humans" SET active true
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"Buildings" SET active false
"Trees" SET active false
"Humans" SET active false
"Buildings" SET active true
"Trees" SET active true
"Humans" SET active true
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"disk1" EXECUTE Sensors.Disk Snapshot
"Camera/Segmentation" GET Segmentation.Output.FilteredBoundingBoxes filteredBoundingBoxes
NOOP
"Camera" SET Transform localPosition (-3~3 0.5~2 -20~-15)
"Camera" SET Transform localEulerAngles (-2~0 -20~20 -3~3)
"Humans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"BicycleHumans" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 36~90
"Trees" SET Thermal.ThermalObjectBehaviour profile.temperature.value -10~10
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.heatiness.value 0~100
"Trafficlights" SET Thermal.ThermalObjectBehaviour profile.variance.value 0~50
"Cars" SET Thermal.Spawners.ReplaceThermalProfiles profile.reflectivity.value 0~0.8
"Camera/Thermal" SET Thermal.ThermalCamera temperatureRange (-30~0 24~30)
[RandomProps.Spawner] ShuffleAll "Buildings" "Cars" "Trees" "Signs" "Grounds" "Trafficlights" "Misc" "Humans" "Bicycles"
"Buildings" SET active false
"Trees" SET active false
"Humans" SET active false
"Buildings" SET active true
"Trees" SET active true
"Humans" SET active true
