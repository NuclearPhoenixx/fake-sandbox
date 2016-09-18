@echo off

:: THIS IS THE CURRENT VERSION
SET v=1.3

TITLE Fake-sandbox processes updater

del version.txt
start /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Aperture-Diversion/fake-sandbox/master/updater/version', '%appdata%\Fake-Sandbox Processes\version.txt')"
timeout /T 1>NUL

find /c "%v%" version.txt
if %errorlevel% equ 1 (goto new)
goto ok

:new
del version.txt
SET type version.txt=%version%
* msg A new version (%version%) of FSP (fake-sandbox processes) is available!
SET /P ANSWER=Would you like to install the update? (y/n): 
if /i %ANSWER%==y (goto install)
if /i %ANSWER%==n (goto no)
goto unrecog

:install
cls
echo.
echo Installing new files...
del "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\fake-sandbox.bat"
del "%appdata%\Fake-Sandbox Processes\fake-sandbox.ps1"
start /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Aperture-Diversion/fake-sandbox/master/updater/fake-sandbox.bat', '%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\fake-sandbox.bat')"
start /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Aperture-Diversion/fake-sandbox/master/updater/fake-sandbox.ps1', '%appdata%\Fake-Sandbox Processes\fake-sandbox.ps1')"
timeout /T 3>NUL
cls
COLOR 0A
echo.
echo Done. Please relogin for the changes to take effect. Click to close this window...
echo.
pause>NUL
exit

:no
cls
echo.
echo You chose not to install the update. Press any key to exit...
echo.
pause>NUL
exit

:ok
del version.txt
exit

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
