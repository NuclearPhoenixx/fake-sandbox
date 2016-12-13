@echo off
:start
::   *-----------------------------------------------------------------------------*
::   | This file is writing my optimized version of the fake-sandbox.ps1 script to |
::   | your autostart directory. After you log in to your user account this script |
::   | will launch automatically and start as ususal.                              |
::   |                                                                             |
::   | Like the original file, this script will simulate fake processes of analysis|
::   | sandbox/VM software some malware will try to evade. This just spawns        |
::   | ping.exe with different names (wireshark.exe, vboxtray.exe, etc...)         |
::   *-----------------------------------------------------------------------------*--------*                                                           
::   | Hint: This works only for the current user. It will start at login and there is no   |
::   | way to stop the processes but to download the ps1 file and execute the stop action.  |
::   *--------------------------------------------------------------------------------------*

::  Please enter some fake processes here:
SET @proc="WinDbg.exe","idaq.exe","wireshark.exe","vmacthlp.exe","VBoxService.exe","VBoxTray.exe","procmon.exe","ollydbg.exe","vmware-tray.exe","idag.exe","ImmunityDebugger.exe"

:: Title and Version code
TITLE Fake Sandbox Processes Installer
COLOR 0F
SET @v=1.6.1
SET path=%~dp0

:: Just some nice user interface things
cls
echo Fake-Sandbox installation script. Version %@v%, 2016.
echo Visit https://www.github.com/aperture-diversion/fake-sandbox/ for updates and fixes.
echo.
echo.
echo You are about to install the fake-sandbox script to your computer (autostart).
SET /P ANSWER=Would you like to continue? (y/n): 

if /i %ANSWER%==y (goto install)
if /i %ANSWER%==n (goto no)
goto unrecog

:: Creation of the fake-sandbox.ps1 script in the new directory %appdata%\Fake-SanboxProcesses\
:install
del "%appdata%\Fake-SandboxProcesses\fake-sandbox.ps1"
del "%appdata%\Fake-SandboxProcesses\current_version.txt"
if not exist %appdata%\Fake-SandboxProcesses\ (md "%appdata%\Fake-SandboxProcesses\")

echo # This file is part of Fake Sandbox Processes (Version %@v%)>"%appdata%\Fake-SandboxProcesses\fake-sandbox.ps1"
echo # available on https://www.github.com/aperture-diversion/fake-sandbox/ .>>"%appdata%\Fake-SandboxProcesses\fake-sandbox.ps1"
echo.>>"%appdata%\Fake-SandboxProcesses\fake-sandbox.ps1"
echo $fakeProcesses = @(%@proc%)>>"%appdata%\Fake-SandboxProcesses\fake-sandbox.ps1"
echo.>>"%appdata%\Fake-SandboxProcesses\fake-sandbox.ps1"
echo     $tmpdir = [System.Guid]::NewGuid().ToString()>>"%appdata%\Fake-SandboxProcesses\fake-sandbox.ps1"
echo     $binloc = Join-path $env:temp $tmpdir>>"%appdata%\Fake-SandboxProcesses\fake-sandbox.ps1"
echo.>>"%appdata%\Fake-SandboxProcesses\fake-sandbox.ps1"
echo     New-Item -Type Directory -Path $binloc>>"%appdata%\Fake-SandboxProcesses\fake-sandbox.ps1"
echo     $oldpwd = $pwd>>"%appdata%\Fake-SandboxProcesses\fake-sandbox.ps1"
echo     Set-Location $binloc>>"%appdata%\Fake-SandboxProcesses\fake-sandbox.ps1"
echo.>>"%appdata%\Fake-SandboxProcesses\fake-sandbox.ps1"
echo     foreach ($proc in $fakeProcesses) {>>"%appdata%\Fake-SandboxProcesses\fake-sandbox.ps1"
echo       Copy-Item c:\windows\system32\ping.exe "$binloc\$proc">>"%appdata%\Fake-SandboxProcesses\fake-sandbox.ps1"
echo.>>"%appdata%\Fake-SandboxProcesses\fake-sandbox.ps1"
echo       Start-Process ".\$proc" -WindowStyle Hidden -ArgumentList "-t -w 3600000 -4 1.1.1.1">>"%appdata%\Fake-SandboxProcesses\fake-sandbox.ps1"
echo       write-host "[+] Process $proc spawned">>"%appdata%\Fake-SandboxProcesses\fake-sandbox.ps1"
echo      }>>"%appdata%\Fake-SandboxProcesses\fake-sandbox.ps1"
echo.>>"%appdata%\Fake-SandboxProcesses\fake-sandbox.ps1"
echo     Set-Location $oldpwd>>"%appdata%\Fake-SandboxProcesses\fake-sandbox.ps1"

:: Creation of the file that will execute the Powershell script upon login
del "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\fake-sandbox.bat"

echo @echo off>"%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\fake-sandbox.bat"
echo :: This file is part of Fake Sandbox Processes (Version %@v%)>>"%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\fake-sandbox.bat"
echo :: available on https://www.github.com/aperture-diversion/fake-sandbox/ .>>"%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\fake-sandbox.bat"
echo TITLE Fake-Sandbox is starting...>>"%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\fake-sandbox.bat"
echo.>>"%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\fake-sandbox.bat"
echo.>>"%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\fake-sandbox.bat"
echo echo [*] Starting FSP script....>>"%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\fake-sandbox.bat"
echo start /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -File "C:\Users\Matthias\AppData\Roaming\Fake-SandboxProcesses\fake-sandbox.ps1">>"%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\fake-sandbox.bat"
echo.>>"%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\fake-sandbox.bat"

cls
echo.
COLOR 0E
echo Would you like to enable the auto-updater to search and install updates regularly? (recommended)
SET /p asw=Choose (y/n): 
COLOR 0F
if /i %asw%==y (goto updater)
if /i %asw%==n (
	echo exit>>"%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\fake-sandbox.bat"
	goto done
	)
goto unrecog

:: This writes some stuff to the execution file and the FSP directory to allow auto-updates
:updater
echo %@v%>"%appdata%\Fake-SandboxProcesses\current_version.txt"

echo echo [*] Starting updater....>>"%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\fake-sandbox.bat"
echo start /MIN %appdata%\Fake-SandboxProcesses\updater.bat>>"%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\fake-sandbox.bat"
echo exit>>"%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\fake-sandbox.bat"

:: Creation of the updater-updater (lol) script in the same directory
echo :: This file is part of Fake Sandbox Processes (Version %@v%)>"%appdata%\Fake-SandboxProcesses\update-installer.bat"
echo :: available on https://www.github.com/aperture-diversion/fake-sandbox/ .>>"%appdata%\Fake-SandboxProcesses\update-installer.bat"
echo @echo off>>"%appdata%\Fake-SandboxProcesses\update-installer.bat"
echo.>>"%appdata%\Fake-SandboxProcesses\update-installer.bat"
echo TITLE Installing latest version of FSP updater...>>"%appdata%\Fake-SandboxProcesses\update-installer.bat"
echo.>>"%appdata%\Fake-SandboxProcesses\update-installer.bat"
echo ping -n 1 127.0.0.1^>NUL>>"%appdata%\Fake-SandboxProcesses\update-installer.bat"
echo.>>"%appdata%\Fake-SandboxProcesses\update-installer.bat"
echo del %appdata%\Fake-SandboxProcesses\uversion.txt>>"%appdata%\Fake-SandboxProcesses\update-installer.bat"
echo move /y %appdata%\Fake-SandboxProcesses\updater_new.bat %appdata%\Fake-SandboxProcesses\updater.bat>>"%appdata%\Fake-SandboxProcesses\update-installer.bat"
echo ping -n 1 127.0.0.1^>NUL>>"%appdata%\Fake-SandboxProcesses\update-installer.bat"
echo del %appdata%\Fake-SandboxProcesses\updater_new.bat>>"%appdata%\Fake-SandboxProcesses\update-installer.bat"
echo start /MIN %appdata%\Fake-SandboxProcesses\updater.bat>>"%appdata%\Fake-SandboxProcesses\update-installer.bat"
echo exit>>"%appdata%\Fake-SandboxProcesses\update-installer.bat"

:: Creation of the updater.bat script in the install directory
echo @echo off>"%appdata%\Fake-SandboxProcesses\updater.bat"
echo echo [*] Downloading new updater...>>"%appdata%\Fake-SandboxProcesses\updater.bat"
echo start /wait /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Aperture-Diversion/fake-sandbox/master/updater/updater.bat', '%appdata%\Fake-SandboxProcesses\updater_new.bat')">>"%appdata%\Fake-SandboxProcesses\updater.bat"
echo ping -n 1 127.0.0.1^>NUL>>"%appdata%\Fake-SandboxProcesses\updater.bat">>"%appdata%\Fake-SandboxProcesses\updater.bat"
echo	if exist %appdata%\Fake-SandboxProcesses\updater_new.bat (>>"%appdata%\Fake-SandboxProcesses\updater.bat"
echo		start /min %appdata%\Fake-SandboxProcesses\update-installer.bat>>"%appdata%\Fake-SandboxProcesses\updater.bat"
echo		exit>>"%appdata%\Fake-SandboxProcesses\updater.bat"
echo	)>>"%appdata%\Fake-SandboxProcesses\updater.bat"
echo exit>>"%appdata%\Fake-SandboxProcesses\updater.bat"

:: -------------------------------------------------------------------------------------------------------------------------------
:: End of file installation
:: ##>>DEBUGGING<<##
:: <---- delete this line and add "pause" instead to enable debugging.
:: -------------------------------------------------------------------------------------------------------------------------------

:: Look for any error
:done
if errorlevel 1 goto error
COLOR 0A
cls
echo.
echo Done, all files have been created. This should work after you relogin. Press any key to exit...
echo.  
pause>NUL
exit

:: If there was an error the following commands will be used
:error
COLOR 0C
cls
echo.
echo An error occured!
echo If you already had a previous version installed and tried to update it, ignore this error - everything went fine. 
echo If this is your first installation, please try it again or enable debugging in this script.
echo.
echo The file can be found here:
echo %path:~0,-1%
echo.
echo Press any key to exit...
echo.  
pause>NUL
exit

:: If you chose not to install this will execute
:no
cls
echo.
echo You chose not to install fake-sandbox processes. Press any key to exit...
echo.
pause>NUL
exit

:: If you did not choose "n" nor "y" this will appear
:unrecog
COLOR 0C
cls
echo.
echo An error occured!
echo Unrecognized command. You have to choose 'y' for yes and 'n' for no.
echo.
echo Press any key to restart...
echo.
pause>NUL
goto start
