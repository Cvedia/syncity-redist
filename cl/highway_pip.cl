"Canvas/PIP" ADD RenderToTexture
"Canvas/PIP" SET RenderToTexture width 1920 height 1080
"Canvas/PIP" LISTEN RenderToTexture onRenderTexture TRIGGER "Canvas/PIP" UI.RawImage texture
"Canvas/PIP" LISTEN RenderToTexture onRenderTexture TRIGGER "Camera" Camera targetTexture
"Canvas/PIP" SET active true

"Canvas/FullScreen" ADD RenderToTexture
"Canvas/FullScreen" SET RenderToTexture width 1024 height 768
"Canvas/FullScreen" LISTEN RenderToTexture onRenderTexture TRIGGER "Canvas/FullScreen" UI.RawImage texture
// "Canvas/FullScreen" LISTEN RenderToTexture onRenderTexture TRIGGER "mainCar/LidarPlaceholder" Sensors.LidarComponents.TextureVisualizer outputTexture
"Canvas/FullScreen" SET active true
