// change temperature.value to get trees colder/hotter
"ThermalBehaviour/Trees" SET temperature.value 15 temperature.bandwidth 3 temperature.median 0.95 ambientOffset.value -25 heatiness.value 0 reflectivity.value 0 variance.value 2.4

// change heatiness.value to get buildings colder / hotter
"ThermalBehaviour/Buildings" SET temperature.value 25 temperature.bandwidth 11.61 temperature.median 0.3 ambientOffset.value 3.7 heatiness.value 4.2 reflectivity.value 0 variance.value 1.5

// change ambientOffset.value to get street props, such as fire hydrants and benches colder / hotter
"ThermalBehaviour/Props" SET temperature.value -20 temperature.bandwidth 7 temperature.median 0.23 ambientOffset.value 16.8 heatiness.value 0 reflectivity.value 0 variance.value 0

// change ambientOffset.value to get roads colder / hotter
"ThermalBehaviour/Roads" SET temperature.value -20 temperature.bandwidth 14 temperature.median 0 ambientOffset.value 13.8 heatiness.value 0 reflectivity.value 0 variance.value 0

// change ambientOffset.value to get roads props, such as rails and road intersections colder / hotter
"ThermalBehaviour/RoadsProps" SET temperature.value -20 temperature.bandwidth 5 temperature.median 0.25 ambientOffset.value 9.8 heatiness.value 0 reflectivity.value 0.0 variance.value 0

// change heatiness.value to get terrain in general colder/hotter
"ThermalBehaviour/Terrain" SET temperature.value 10 temperature.bandwidth 1 temperature.median 0.574 ambientOffset.value 3.6 heatiness.value 14.8 reflectivity.value 0 variance.value 0
