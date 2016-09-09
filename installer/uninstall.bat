@echo off

:: *-----------------------------------------------------------*
:: | This is the uninstaller for the fake-process-installer.   |
:: *-----------------------------------------------------------*

TITLE Fake-Sandbox Uninstaller
SET path=%~dp0
COLOR 0F
:: -------------------------------------------------------------------------------------------------------------------------------
echo.
echo If you really want to uninstall the fake-sandbox scripts, press any button to continue (close this windows otherwise)...
echo.
pause > NUL
:: -------------------------------------------------------------------------------------------------------------------------------
:: Delete the autostart file and the whole "Fake-Sandbox Processes" directory.
del "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\fake-sandbox.bat"
rmdir /s /q "%appdata%\Fake-Sandbox Processes\"
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