:: AUTO_UPDATER
@echo off
COLOR 0F
SET /p v=<"%appdata%\FakeSandboxProcesses\current_version.txt"
SET uversion=14
TITLE FSP Updater v%uversion%

:: Wait for internet connection
SET five=5
SET count=1

:ping
ping -n 1 127.0.0.1>NUL
ping -n 1 8.8.8.8 | find "TTL=">NUL
SET /A count=count+1
if %count% GTR %five% exit
if errorlevel==1 goto ping

:: Download updater version number
echo [*] Getting latest updater version number...
start /wait /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/NuclearPhoenixx/fake-sandbox/master/updater/uversion', '%appdata%\FakeSandboxProcesses\uversion.txt')"

:: Has the version code changed?
SET /p nuv=<"%appdata%\FakeSandboxProcesses\uversion.txt"
if not "%nuv%"=="%uversion%" goto new_updater
del %appdata%\FakeSandboxProcesses\uversion.txt

:: Download FSP version number
echo [*] Getting latest FSP version number...
start /wait /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/NuclearPhoenixx/fake-sandbox/master/updater/version', '%appdata%\FakeSandboxProcesses\version.txt')"

:: Has the version code changed?
SET /p nv=<"%appdata%\FakeSandboxProcesses\version.txt"
if "%nv%"=="%v%" goto ok

:: Ask to install the new version
SET /p version=<"%appdata%\FakeSandboxProcesses\version.txt"
del "%appdata%\FakeSandboxProcesses\version.txt"
:: Msg only works in Windows 7 but it's no deal to just leave the code in here for the other windows versions.
msg * A new version (%version%) of Fake Sandbox Processes is available!
cls
echo.
echo Version %version% is now available!
echo Changelog: https://github.com/NuclearPhoenixx/fake-sandbox/blob/master/Changelog.md
echo.
SET /P ANSWER=# Would you like to download and install the update? (y/n): 
if /i %ANSWER%==y goto install
if /i %ANSWER%==n goto no
goto unrecog

:new_updater
echo [*] New updater version found!
echo [*] Downloading latest updater...
start /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/NuclearPhoenixx/fake-sandbox/master/updater/updater.bat', '%appdata%\FakeSandboxProcesses\updater_new.bat')"
if exist %appdata%\FakeSandboxProcesses\updater_new.bat (
	start /min %appdata%\FakeSandboxProcesses\updater-installer.bat
	exit
)
echo An ERROR occured while downloading the new updater. Closing...
exit

:: If yes then download and install the new version
:install
del %appdata%\FakeSandboxProcesses\fsp-installer_update.bat
cls
echo [*] Downloading...
start /wait /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/NuclearPhoenixx/fake-sandbox/master/installer/fsp-installer.bat', '%appdata%\FakeSandboxProcesses\fsp-installer_update.bat')"
if exist %appdata%\FakeSandboxProcesses\fsp-installer_update.bat goto continue
goto dlerror

:: If everything went fine this will execute
:continue
echo [*] Download successful!
echo [*] Starting installer...
echo.
echo FSP>%appdata%\FakeSandboxProcesses\updateinprogress.txt
CALL %appdata%\FakeSandboxProcesses\fsp-installer_update.bat
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
echo  -^> No new version found, cleaning up...
del "%appdata%\FakeSandboxProcesses\version.txt"
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
