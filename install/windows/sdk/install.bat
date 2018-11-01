@echo off

:: windows python usually is called python.exe, regardless of the version
:: so we check for the binary then try to match it's version

cd ..\..\..
where /q python

if errorlevel 1 (
	echo It looks like you don't have python3 installed or it's not on the PATH
	echo You can download python3 for windows here: https://www.python.org/downloads/windows/
	echo If you already have it installed make sure it's present on the PATH variable
	
	pause
	exit /b
)

setlocal enableextensions

for /f "tokens=*" %%a in (
	'python --version'
) do (
	set pyv=%%a
)

if not x%pyv:Python 3.=%==x%pvy% (
	REM this shouldn't fail, as python for windows comes with pip by default
	echo Installing required modules...
	python -m pip install -r requirements.txt
	
	if errorlevel 1 (
		echo Failed
	) else (
		echo Completed
	)
) ELSE (
	echo It looks like you have a version of python that's not compatible with the SDK.
	echo Make sure you have python 3 installed and on the PATH
	echo You can download python3 for windows here: https://www.python.org/downloads/windows/
	
	pause
	exit /b
)

pause
endlocal
