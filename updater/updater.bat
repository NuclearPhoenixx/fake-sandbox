@echo off

:: Start by setting some version numbers and the title
COLOR 0F
SET /p v=<"%appdata%\Fake-SandboxProcesses\current_version.txt"
SET uversion=9
TITLE FSP Updater v%uversion%
ping -n 5 127.0.0.1>NUL

:: Download updater version number
echo [*] Getting latest updater version number...
start /wait /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Phoenix1747/fake-sandbox/master/updater/uversion', '%appdata%\Fake-SandboxProcesses\uversion.txt')"
ping -n 2 127.0.0.1>NUL

:: Has the version code changed?
SET /p nuv=<"%appdata%\Fake-SandboxProcesses\uversion.txt"
if not "%nuv%"=="%uversion%" goto new_updater
del %appdata%\Fake-SandboxProcesses\uversion.txt

:: Download FSP version number
echo [*] Getting latest FSP version number...
start /wait /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Phoenix1747/fake-sandbox/master/updater/version', '%appdata%\Fake-SandboxProcesses\version.txt')"
ping -n 2 127.0.0.1>NUL

:: Has the version code changed?
SET /p nv=<"%appdata%\Fake-SandboxProcesses\version.txt"
if "%nv%"=="%v%" goto ok

:: Ask to install the new version
SET /p version=<"%appdata%\Fake-SandboxProcesses\version.txt"
del "%appdata%\Fake-SandboxProcesses\version.txt"
msg * A new version (v%version%) of Fake-Sandbox-Processes is available!
cls
echo.
echo Version %version% is now available!
echo Changelog: https://github.com/Phoenix1747/fake-sandbox/blob/master/Changelog.md
echo.
SET /P ANSWER=# Would you like to download and install the update? (y/n): 
if /i %ANSWER%==y goto install
if /i %ANSWER%==n goto no
goto unrecog

:: If yes then download and install the new version
:install
del %appdata%\Fake-SandboxProcesses\fsp-installer_update.bat
cls
echo.
echo [*] Downloading...
start /wait /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Phoenix1747/fake-sandbox/master/installer/fake-sandbox-installer.bat', '%appdata%\Fake-SandboxProcesses\fsp-installer_update.bat')"
ping -n 2 127.0.0.1>NUL
if exist %appdata%\Fake-SandboxProcesses\fsp-installer_update.bat goto continue
goto dlerror

:: If everything went fine this will execute
:continue
echo [*] Download successful!
echo [*] Starting installer...
echo.
CALL %appdata%\Fake-SandboxProcesses\fsp-installer_update.bat
ping -n 1 127.0.0.1>NUL
del %appdata%\Fake-SandboxProcesses\fsp-installer_update.bat
exit

:: If there was an error downloading the update this will show up
:dlerror
cls
COLOR 0C
echo.
echo An error occured while downloading the update!
echo Please try to download the new version manually.
echo.
echo Press any key to exit...
pause>NUL
exit

:: If no then close the updater
:no
cls
echo.
echo You chose not to install the update. Press any key to exit...
pause>NUL
exit

:: If there is no new version, delete the version.txt and exit
:ok
echo  No new version found, cleaning up...
del "%appdata%\Fake-SandboxProcesses\version.txt"
echo [*] Closing...
exit

:: If you didn't type in "y" for yes or "n" for no then this will start
:unrecog
COLOR 0C
cls
echo.
echo An error occured!
echo Unrecognized command. You have to choose 'y' for yes or 'n' for no.
echo.
echo Press any key to exit...
pause>NUL
exit

:new_updater
cls
echo [*] New updater version found!
echo [*] Downloading new updater...
start /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Phoenix1747/fake-sandbox/master/updater/updater.bat', '%appdata%\Fake-SandboxProcesses\updater_new.bat')"
ping -n 2 127.0.0.1>NUL
if exist %appdata%\Fake-SandboxProcesses\updater_new.bat (
	start /min %appdata%\Fake-SandboxProcesses\update-installer.bat
	exit
)
echo ERROR downloading the new updater. Closing...
exit
