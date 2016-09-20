@echo off
::-------------------------------------------------------------------
:: THIS IS THE CURRENT VERSION
SET /p v=<"%appdata%\Fake-SandboxProcesses\current_version.txt"
SET uversion=3

::-------------------------------------------------------------------
TITLE Fake-sandbox processes updater

::-------------------------------------------------------------------
:: Download new uversion.txt
start /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Aperture-Diversion/fake-sandbox/master/updater/uversion', '%appdata%\Fake-SandboxProcesses\uversion.txt')"
ping -n 2 127.0.0.1>NUL

:: Look if the version code has changed
if exist %appdata%\Fake-SandboxProcesses\uversion.txt (
	SET /p "nuv"=<"%appdata%\Fake-SandboxProcesses\uversion.txt"
	if not "%nuv%"=="%uversion%" goto new_updater
	del "%appdata%\Fake-SandboxProcesses\uversion.txt"
) else exit
::-------------------------------------------------------------------
:: Download new version.txt
start /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Aperture-Diversion/fake-sandbox/master/updater/version', '%appdata%\Fake-SandboxProcesses\version.txt')"
ping -n 2 127.0.0.1>NUL

:: Look if the version code has changed
if exist %appdata%\Fake-SandboxProcesses\version.txt (
	SET /p "nv"=<"%appdata%\Fake-SandboxProcesses\version.txt"
	if "%nv%"=="%v%" goto ok
	goto new
) else exit
:: Ask to install the new version
:new
SET /p "version"=<"%appdata%\Fake-SandboxProcesses\version.txt"
del "%appdata%\Fake-SandboxProcesses\version.txt"
msg * A new version (%version%) of Fake Sandbox Processes is available!
cls
echo.
echo Version %version% is now available. Changelog: https://github.com/Aperture-Diversion/fake-sandbox/blob/master/Changelog.md
echo.
SET /P ANSWER=Would you like to download and install the update? (y/n): 
if /i %ANSWER%==y goto install
if /i %ANSWER%==n goto no
goto unrecog

:: If yes then download and install the new version
:install
del %appdata%\Fake-SandboxProcesses\fsp-installer_update.bat
cls
echo.
echo Installing new files...
start /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Aperture-Diversion/fake-sandbox/master/installer/fake-sandbox-installer.bat', '%appdata%\Fake-SandboxProcesses\fsp-installer_update.bat')"
echo Downloading...
ping -n 3 127.0.0.1>NUL

if exist %appdata%\Fake-SandboxProcesses\fsp-installer_update.bat goto continue
goto dlerror

:: If everything went fine, this will execute
:continue
cls
echo.
echo Download successful!
echo Starting installer now...
echo.
timeout 2
CALL %appdata%\Fake-SandboxProcesses\fsp-installer_update.bat
ping -n 1 127.0.0.1>NUL
del %appdata%\Fake-SandboxProcesses\fsp-installer_update.bat
exit

:: If there was an error downloading the update, this will show up.
:dlerror
cls
COLOR 0C
echo.
echo There was an error downloading the update.
echo Please try again later.
echo.
echo Press any key to exit...
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
del "%appdata%\Fake-SandboxProcesses\version.txt"
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

:new_updater
cls
echo Downloading new updater...
start /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Aperture-Diversion/fake-sandbox/master/updater/updater.bat', '%appdata%\Fake-SandboxProcesses\updater_new.bat')"
ping -n 2 127.0.0.1>NUL
if exist %appdata%\Fake-SandboxProcesses\updater_new.bat (
	start /min %appdata%\Fake-SandboxProcesses\update-installer.bat
	exit
)
exit