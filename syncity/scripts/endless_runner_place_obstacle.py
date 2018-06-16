import random
import json
import sys
from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def help():
	return ''

def run():
	common.sendData(['CREATE "Props/Props_002/Bus Stop Bench/Bus Stop Bench" FROM "props" AS "obstacle"',
					 '"TrafficEvents" EXECUTE TrafficEvents PlaceObjectAheadOf "mainCar" "obstacle" 150'])
