// lidar visualizer ------------------------------------------------------------

[Cameras.Orbit] CreateAutoOrbit "lidarVirtualCamera" distance 12 elevation 14 speed 5
"lidarVirtualCamera" SET active true

[Cameras.RenderTexture] CreateNew "PCL texture" 1024 768

// lidar device ----------------------------------------------------------------

// [Sensors.Lidar] CreateLidar "mainCar/LidarPlaceholder/vlp_16" model "VLP_16" minAz -180 maxAz 180 minEl -30 maxEl 30 rpm 900 minimumIntensity 0 dataType "Segmentation" accuracy "HIGH" timingAccuracy "LOW" disableUDPBroadcast false
[Sensors.Lidar] CreateLidar "mainCar/LidarPlaceholder/vlp_16" model "VLP_16" minAz -180 maxAz 180 minEl -30 maxEl 30 rpm 300 minimumIntensity 0 accuracy "HIGH" timingAccuracy "LOW" disableUDPBroadcast true
"mainCar/LidarPlaceholder/vlp_16" ADD Sensors.LidarComponents.TextureVisualizer
"mainCar/LidarPlaceholder/vlp_16" SET Sensors.LidarComponents.TextureVisualizer outputTexture "PCL texture" virtualCamera "lidarVirtualCamera"
"mainCar/LidarPlaceholder/vlp_16" SET active true

// lidar ui hook ---------------------------------------------------------------

[UI.Window] ShowFromRenderTexture "PCL texture"
