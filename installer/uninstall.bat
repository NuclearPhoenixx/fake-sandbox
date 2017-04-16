@echo off
:: *-----------------------------------------------------------*
:: | This is the uninstaller for Fake Sandbox Processes (FSP)  |
:: *-----------------------------------------------------------*

TITLE FSP Uninstaller
SET path=%~dp0
COLOR 0F

:start
cls
echo.
echo # You are about to uninstall Fake Sandbox Processes from your computer.
SET /P ANSWER=# Are you sure you want to continue? (y/n): 
if /i %ANSWER%==y goto uninstall
if /i %ANSWER%==n goto no
goto unrecog

:: Delete the autostart script and the whole "Fake-SandboxProcesses" directory
:uninstall
del "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\fake-sandbox.bat"
rmdir /s /q "%appdata%\Fake-SandboxProcesses\"
cls

:: -------------------------------------------------------------------------::
:: ##>>DEBUGGING<<##														::
:: <---- delete this line and add "pause" instead to enable debugging.		::
:: -------------------------------------------------------------------------::

:: Look for any error
if errorlevel 1 goto error
COLOR 0A
echo.
echo Successfully removed FSP. All remaining processes will be gone once you relogin or reboot your PC.
echo.
echo # Sorry to see you go. Got any feedback? Please submit it here:
echo # https://github.com/aperture-diversion/fake-sandbox/issues
echo.
echo.
echo Press any key to exit...
pause>NUL
exit

:: If there was an error, the following commands will be used
:error
COLOR 0C
echo.
echo An error occured!
echo The uninstaller encountered a strange, unknown error. Please enable debugging in this script, which is located here: 
echo %path:~0,-1%
echo.
echo Press any key to exit...
pause>NUL
exit

:: If you chose not to uninstall this will execute
:no
cls
echo.
echo You chose not to uninstall Fake-Sandbox-Processes. Press any key to exit...
pause>NUL
exit

:: If you did not choose "n" nor "y" this will appear
:unrecog
COLOR 0C
cls
echo.
echo An error occured!
echo Unrecognized command. You have to choose 'y' for yes or 'n' for no.
echo.
echo Press any key to restart...
pause>NUL
goto start