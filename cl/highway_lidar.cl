// original lidar
// "mainCar/LidarPlaceholder" SET active false
// "mainCar/LidarPlaceholder" ADD Sensors.Lidar
// "mainCar/LidarPlaceholder" SET Sensors.Lidar model "VLP_16" dataType "Intensity" accuracy "HIGH" timingAccuracy "LOW"
// "mainCar/LidarPlaceholder" ADD Sensors.LidarComponents.TextureVisualizer
// "mainCar/LidarPlaceholder" SET Sensors.LidarComponents.TextureVisualizer virtualCamera "lidarVirtualCamera" targetFps 20

"mainCar/LidarPlaceholder" SET active false
"mainCar/LidarPlaceholder" ADD Sensors.Lidar
"mainCar/LidarPlaceholder" SET Sensors.Lidar model "VLP_16" minAz -180 maxAz 180 minEl -30 maxEl 30 rpm 900 minimumIntensity 0 timingAccuracy "ULTRA" accuracy "HIGH" ipAddressOverride "192.168.1.100" disableUDPBroadcast false

// CRASH!
// "mainCar/LidarPlaceholder" ADD Sensors.LidarComponents.TextureVisualizer
// "mainCar/LidarPlaceholder" SET Sensors.LidarComponents.TextureVisualizer virtualCamera "lidarVirtualCamera" targetFps 20

"mainCar/LidarPlaceholder" SET active true
