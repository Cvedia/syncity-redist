// lidar device ----------------------------------------------------------------

[Sensors.Lidar] CreateLidar "mainCar/LidarPlaceholder/vlp_16" model "VLP_16" minAz -180 maxAz 180 minEl -30 maxEl 30 rpm 900 minimumIntensity 0 dataType "Segmentation" accuracy "HIGH" timingAccuracy "LOW" disableUDPBroadcast false
"mainCar/LidarPlaceholder/vlp_16" SET active true
