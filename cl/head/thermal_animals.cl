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
CREATE "cameras/thermal"
"cameras/thermal" SET active false
"cameras/thermal" ADD Camera Thermal.ThermalCamera UnityEngine.PostProcessing.PostProcessingBehaviour CameraFilterPack_Pixelisation_DeepOilPaintHQ CameraFilterPack_Blur_Noise Thermal.GlobalTreeSettings
"cameras/thermal" SET Camera near 0.3 far 10000 fieldOfView 60
"cameras/thermal" SET Thermal.ThermalCamera enabled false
"cameras/thermal" SET CameraFilterPack_Pixelisation_DeepOilPaintHQ enabled false
"cameras/thermal" SET CameraFilterPack_Pixelisation_DeepOilPaintHQ _FixDistance 10.6 _Distance 0.06 _Size 0.481 Intensity 0.6 enabled true
"cameras/thermal" SET CameraFilterPack_Blur_Noise Distance (2 1) enabled true
"cameras/thermal" SET Thermal.GlobalTreeSettings temperature 8 temperatureBandwidth 50 temperatureMedian 0 treeLeafsHeatVariance 10 enabled true 
"cameras/thermal" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile "Thermal"
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 15 temperatureRange (9 35) maxDistanceForProbeUpdate 100 useAGC true enabled true 
"cameras/thermal" SET UnityEngine.PostProcessing.PostProcessingBehaviour profile.grain.enabled false
"cameras/thermal" SET active true
[UI.Window] ShowFromCamera "cameras/thermal" AS "thermal" WITH 1024 768 24 "ARGB32" "Default"
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
CREATE "disk1/Cameras/thermal"
"disk1/Cameras/thermal" ADD Sensors.RenderTextureLink
"disk1/Cameras/thermal" SET Sensors.RenderTextureLink target "thermal"
"disk1/Cameras/thermal" SET active true
"disk1" SET active true
CREATE "spawner/animal___thermal/container"
"spawner/animal___thermal/container" SET active false
"spawner/animal___thermal/container" ADD RandomProps.Torus
"spawner/animal___thermal/container" ADD RandomProps.PropArea
"spawner/animal___thermal/container" SET RandomProps.PropArea tags "animal, +thermal"
"spawner/animal___thermal/container" SET RandomProps.PropArea async false numberOfProps 10 collisionCheck true stickToGround false 
"spawner/animal___thermal/container" SET RandomProps.Torus innerRadius 0
"spawner/animal___thermal/container" SET RandomProps.Torus radius 50
"spawner/animal___thermal/container" SET Transform position (0 0 0) eulerAngles (0 0 0) localScale (1 1 1)
"spawner/animal___thermal/container" SET active true
"spawner/animal___thermal" SET active true
"cameras/cameraRGB" SET EnviroCamera enabled false
"disk1/Cameras/camerargb" SET active true
"cameras" SET active true
"cameras/cameraRGB" SET active true
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 10
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 0
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 11
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 10
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 12
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 20
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 13
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 30
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 14
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 40
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 15
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 50
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 16
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 60
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 17
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 70
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 18
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 80
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 19
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 90
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 20
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 100
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 21
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 110
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 22
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 120
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 23
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 130
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 24
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 140
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 25
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 150
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 26
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 160
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 27
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 170
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 28
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 180
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 29
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 190
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 30
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 200
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 10
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 210
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 11
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 220
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 12
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 230
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 13
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 240
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 14
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 250
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 15
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 260
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 16
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 270
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 17
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 280
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 18
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 290
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 19
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 300
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 20
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 310
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 21
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 320
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 22
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 330
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 23
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 340
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
"cameras/thermal" SET Thermal.ThermalCamera ambientTemperature 24
"cameras" SET Orbit distance 55
"cameras" SET Orbit elevation 6.95
"cameras" SET Orbit azimuth 350
"cameras/cameraRGB" EXECUTE Sensors.RenderCamera RenderFrame
"cameras/thermal" EXECUTE Sensors.RenderCamera RenderFrame
"disk1" GET Sensors.Disk counter
"disk1" EXECUTE Sensors.Disk Snapshot
