CREATE "ThermalCamera"
"ThermalCamera" ADD Camera
"ThermalCamera" SET Camera nearClipPlane 0.1
"ThermalCamera" SET Camera renderingPath "Forward"
"ThermalCamera" SET Camera allowMSAA False
"ThermalCamera" SET Camera forceIntoRenderTexture True
"ThermalCamera" SET Camera backgroundColor "#000000FF"
"ThermalCamera" SET Camera tag "MainCamera"
"ThermalCamera" SET Camera hideFlags "HideInHierarchy"
"ThermalCamera" ADD AudioListener
"ThermalCamera" SET AudioListener hideFlags "HideInHierarchy"
"ThermalCamera" ADD FlyCamera
"ThermalCamera" SET FlyCamera hideFlags "HideInHierarchy"
"ThermalCamera" SET FlyCamera isColliding False
"ThermalCamera" ADD Thermal.ThermalCamera
"ThermalCamera" SET Thermal.ThermalCamera hideFlags "HideInHierarchy"
"ThermalCamera" SET Thermal.ThermalCamera temperatureRange (-10 40)
"ThermalCamera" SET Thermal.ThermalCamera skyboxBackgroundTemperature -100
"ThermalCamera" SET Thermal.ThermalCamera skyboxTemperatureRange (-23 15)
"ThermalCamera" ADD UnityStandardAssets.CinematicEffects.AmbientOcclusion
"ThermalCamera" SET UnityStandardAssets.CinematicEffects.AmbientOcclusion settings.intensity 0.14
"ThermalCamera" SET UnityStandardAssets.CinematicEffects.AmbientOcclusion settings.radius 0.25
"ThermalCamera" SET UnityStandardAssets.CinematicEffects.AmbientOcclusion settings.sampleCount "High"
"ThermalCamera" SET UnityStandardAssets.CinematicEffects.AmbientOcclusion settings.sampleCountValue 24
"ThermalCamera" SET UnityStandardAssets.CinematicEffects.AmbientOcclusion settings.occlusionSource "DepthNormalsTexture"
"ThermalCamera" ADD UnityStandardAssets.ImageEffects.BloomOptimized
"ThermalCamera" SET UnityStandardAssets.ImageEffects.BloomOptimized threshold 0.16
"ThermalCamera" SET UnityStandardAssets.ImageEffects.BloomOptimized intensity 0.8
"ThermalCamera" SET UnityStandardAssets.ImageEffects.BloomOptimized blurSize 0.25
"ThermalCamera" ADD UnityStandardAssets.CinematicEffects.TonemappingColorGrading
"ThermalCamera" ADD Thermal.ThermalNoise
"ThermalCamera" SET Thermal.ThermalNoise spotsContrast 0.8
"ThermalCamera" SET Thermal.ThermalNoise linesMaskIntensity 0.15
"ThermalCamera" SET Thermal.ThermalNoise noiseIntensity 6
"ThermalCamera" SET Thermal.ThermalNoise noiseContrast 0.4
"ThermalCamera" SET Thermal.ThermalNoise noiseSize 0.1
"ThermalCamera" SET Thermal.ThermalNoise noiseBlur 2
"ThermalCamera" SET Thermal.ThermalNoise filterMode "Trilinear"
"ThermalCamera" SET Thermal.ThermalNoise blendAmount 0.05
"ThermalCamera" SET active true