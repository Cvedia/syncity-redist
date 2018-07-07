CREATE "camera"
"camera" ADD Camera
"camera" SET Transform position (25 6 -10) eulerAngles (22 -56 0)
"camera" SET active true

CREATE "light"
"light" SET Transform localEulerAngles (22.334 50.169 24.759)
"light" ADD Light
"light" SET Light shadows "Soft"
"light" SET Light type "Directional"
"light" SET active true

CREATE "Ground"
"Ground" SET Transform localPosition (0 0 0)
"Ground" ADD RandomProps.FillGrid
"Ground" SET RandomProps.FillGrid tags "ground"
"Ground" SET RandomProps.FillGrid size (100 100)
"Ground" SET RandomProps.FillGrid cellSize (10 10)
"Ground" SET active true

CREATE "camping"
"camping" ADD RandomProps.Rectangle RandomProps.PropArea
"camping" SET RandomProps.Rectangle size (50 50)
"camping" SET RandomProps.PropArea tags "camping" numberOfProps 100
"camping" EXECUTE SetActive true