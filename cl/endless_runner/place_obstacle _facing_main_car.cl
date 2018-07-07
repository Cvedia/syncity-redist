CREATE "cars/audi s3/audi s3" FROM "thermal_cars" AS "obstacle"
//PlaceObjectAheadOf <car> <obstacle> <distance_ahead_of_main_car> <rotation_angle>
"TrafficEvents" EXECUTE TrafficEvents PlaceObjectAheadOf "mainCar" "obstacle" 150 180