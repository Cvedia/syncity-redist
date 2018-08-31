// ----- THERMAL CAMERAS -----

"Thermal.ProbeUpdateScheduler.instance" SET Thermal.ProbeUpdateScheduler disableProbesRendering true
"Vehicle Spawner" SET OSNetworkSpawner removeProbes false

[Thermal.Camera] CreateCamera "mainCar/cameras/Thermal1"
"mainCar/cameras/Thermal1" SET Transform localPosition (-0.1 0 0) localEulerAngles (0 0 0)
"mainCar/cameras/Thermal1" ADD UnityStandardAssets.ImageEffects.BloomOptimized
"mainCar/cameras/Thermal1" SET Thermal.ThermalCamera temperatureRange (-10 30)
"mainCar/cameras/Thermal1" SET Camera far 400
"mainCar/cameras/Thermal1" SET UnityStandardAssets.ImageEffects.BloomOptimized fastBloomShader "Hidden/FastBloom" threshold 0 intensity 0.3 blurSize 1.47 blurIterations 4


CREATE RenderTexture 640 512 24 "ARGB32" "Default" AS "Thermal1"
"mainCar/cameras/Thermal1" SET Camera targetTexture "Thermal1" 
"mainCar/cameras/Thermal1" SET active true

[UI.Window] ShowFromRenderTexture "Thermal1" AS "Thermal1"

"EnviroSky" EXECUTE EnviroSky AssignAndStart "mainCar/cameras/Thermal1" "mainCar/cameras/Thermal1"

"mainCar/cameras/Thermal1" ADD Thermal.ThermalNoise
"mainCar/cameras/Thermal1" SET Thermal.ThermalNoise spotsContrast 0.8
"mainCar/cameras/Thermal1" SET Thermal.ThermalNoise linesMaskIntensity 0.1
"mainCar/cameras/Thermal1" SET Thermal.ThermalNoise noiseIntensity 6
"mainCar/cameras/Thermal1" SET Thermal.ThermalNoise noiseContrast 0.9
"mainCar/cameras/Thermal1" SET Thermal.ThermalNoise noiseSize 0.1
"mainCar/cameras/Thermal1" SET Thermal.ThermalNoise noiseBlur 1
"mainCar/cameras/Thermal1" SET Thermal.ThermalNoise blendAmount 0.1
"mainCar/cameras/Thermal1" SET Thermal.ThermalNoise filterMode 2


[Thermal.Camera] CreateCamera "mainCar/cameras/Thermal2"
"mainCar/cameras/Thermal2" SET Transform localPosition (-0.1 0 0) localEulerAngles (0 0 0)
"mainCar/cameras/Thermal2" ADD UnityStandardAssets.ImageEffects.BloomOptimized EnviroSkyRendering EnviroLightShafts
"mainCar/cameras/Thermal2" SET Thermal.ThermalCamera temperatureRange (-10 30)
"mainCar/cameras/Thermal1" SET Camera far 400
"mainCar/cameras/Thermal2" SET UnityStandardAssets.ImageEffects.BloomOptimized fastBloomShader "Hidden/FastBloom" threshold 0 intensity 0.3 blurSize 1.47 blurIterations 4


CREATE RenderTexture 640 512 24 "ARGB32" "Default" AS "Thermal2"
"mainCar/cameras/Thermal2" SET Camera targetTexture "Thermal2" 
"mainCar/cameras/Thermal2" SET active true

[UI.Window] ShowFromRenderTexture "Thermal2" AS "Thermal2"

"mainCar/cameras/Thermal2" ADD Thermal.ThermalNoise
"mainCar/cameras/Thermal2" SET Thermal.ThermalNoise spotsContrast 0.8
"mainCar/cameras/Thermal2" SET Thermal.ThermalNoise linesMaskIntensity 0.1
"mainCar/cameras/Thermal2" SET Thermal.ThermalNoise noiseIntensity 6
"mainCar/cameras/Thermal2" SET Thermal.ThermalNoise noiseContrast 0.9
"mainCar/cameras/Thermal2" SET Thermal.ThermalNoise noiseSize 0.1
"mainCar/cameras/Thermal2" SET Thermal.ThermalNoise noiseBlur 1
"mainCar/cameras/Thermal2" SET Thermal.ThermalNoise blendAmount 0.1
"mainCar/cameras/Thermal2" SET Thermal.ThermalNoise filterMode 2