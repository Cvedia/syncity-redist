import pytest
import pytest_dependency
import tcommon
from syncity import common, settings_manager

@pytest.mark.first
def test_assert():
	assert True

def test_connect():
	assert tcommon.telnet() == True

@pytest.mark.last
def test_config():
	assert common.sendData('"Config.instance" SET assetBundlesCache "/tmp/"') == ["OK"]
	assert common.sendData('"Config.instance" SET databaseFolderPath "/tmp/"') == ["OK"]
	assert common.sendData('"Config.instance" SET physicsEnabled false') == ["OK"]
