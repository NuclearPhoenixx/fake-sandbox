@echo off

:: *-----------------------------------------------------------*
:: | This is the uninstaller for the fake-process-installer.   |
:: *-----------------------------------------------------------*

TITLE Fake-Sandbox Uninstaller
SET path=%~dp0
COLOR 0F
:: -------------------------------------------------------------------------------------------------------------------------------
echo.
echo You are about to uninstall the fake-sandbox scripts from your computer.
SET /P ANSWER=Are you sure you want to continue? (y/n): 

if /i %ANSWER%==y goto uninstall
if /i %ANSWER%==n goto no
goto unrecog

:: -------------------------------------------------------------------------------------------------------------------------------
:: Delete the autostart file and the whole "Fake-Sandbox Processes" directory.
:uninstall
del "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\fake-sandbox.bat"
rmdir /s /q "%appdata%\Fake-SandboxProcesses\"
cls

:: -------------------------------------------------------------------------------------------------------------------------------
:: <---- delete this line and add "pause" instead to enable debugging.
:: -------------------------------------------------------------------------------------------------------------------------------

:: Look for any error:
if errorlevel 1 goto error
COLOR 0A
echo.
echo Successfully removed everything. Please relogin to make sure, there aren't any of the old processes running.
echo They will be gone, whenever you restart anyways. Press any key to exit...
echo.
pause > NUL
exit

:: If there was an error, the following commands will be used:
:error
COLOR 0C
echo.
echo An error occured!
echo The uninstaller encountered a strange and unknown error. Please enable debugging in this script - it can be found here: 
echo %path:~0,-1%
echo.
echo Press any key to exit...
echo.
pause > NUL
exit

:: -------------------------------------------------------------------------------------------------------------------------------
:: If you chose not to uninstall this will execute:
:no
cls
echo.
echo You chose not to uninstall fake-sandbox processes. Press any key to exit...
echo.
pause > NUL
exit

:: If you did not choose "n" nor "y" this will appear:
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