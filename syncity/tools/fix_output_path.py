from .. import common, helpers, settings_manager

settings = settings_manager.Singleton()

def run():
	common.sendData([
		'"disk1" SET Sensors.Disk path "{}"'.format(settings.output_path),
		'NOOP'
	], read=True)
