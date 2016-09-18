@echo off
::-------------------------------------------------------------------
:: THIS IS THE CURRENT VERSION
SET /p v=<"%appdata%\Fake-SandboxProcesses\current_version.txt"

::-------------------------------------------------------------------
TITLE Fake-sandbox processes updater

::-------------------------------------------------------------------
:: Delete old version.txt
del "%appdata%\Fake-SandboxProcesses\current_version.txt"
cls
:: Download new version.txt
start /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Aperture-Diversion/fake-sandbox/master/updater/version', '%appdata%\Fake-SandboxProcesses\version.txt')"
ping -n 2 127.0.0.1>NUL

:: Look if the version code has changed
findstr /m "%v%" "%appdata%\Fake-SandboxProcesses\version.txt"
if %errorlevel%==0 (goto ok)
goto new

:: Ask to install the new version
:new
SET /p version=<"%appdata%\Fake-SandboxProcesses\version.txt"
del "%appdata%\Fake-SandboxProcesses\current_version.txt"
msg * A new version (%version%) of Fake Sandbox Processes is available!
echo.
SET /P ANSWER=Would you like to install the update? (y/n): 
if /i %ANSWER%==y (goto install)
if /i %ANSWER%==n (goto no)
goto unrecog

:: If yes then download and install the new version
:install
cls
echo.
echo Installing new files...
del "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\fake-sandbox.bat"
del "%appdata%\Fake-SandboxProcesses\fake-sandbox.ps1"
start /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Aperture-Diversion/fake-sandbox/master/updater/fake-sandbox.bat', '%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\fake-sandbox.bat')"
start /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Aperture-Diversion/fake-sandbox/master/updater/fake-sandbox.ps1', '%appdata%\Fake-SandboxProcesses\fake-sandbox.ps1')"
ping -n 3 127.0.0.1>NUL
cls
COLOR 0A
echo.
echo Done. Please relogin for the changes to take effect. Click to close this window...
echo.
pause>NUL
exit

:: If no then close the updater
:no
cls
echo.
echo You chose not to install the update. Press any key to exit...
echo.
pause>NUL
exit

:: If there is no new version, delete the version.txt and exit
:ok
del "%appdata%\Fake-SandboxProcesses\current_version.txt"
exit

:: If you didn't type in "y" for yes or "n" for no then this will start
:unrecog
COLOR 0C
cls
echo.
echo An error occured!
echo Unrecognized command. You have to choose "y" for yes and "n" for no.
echo.
echo Press any key to exit...
echo.
pause > NUL
exit
