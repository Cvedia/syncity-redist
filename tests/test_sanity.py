import pytest
import pytest_dependency
import tcommon

@pytest.mark.first
def test_assert():
	assert True

def test_connect():
	assert tcommon.telnet() == True
