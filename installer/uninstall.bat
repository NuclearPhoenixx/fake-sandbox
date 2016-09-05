@echo off
:: *---------------------------------------------------------------*
:: | This is the uninstaller for the fake-process-installer.       |
:: *---------------------------------------------------------------*

TITLE Fake-Sandbox Uninstaller

echo.
echo If you really want to uninstall the fake-sandbox scripts, click any button to continue (close this windows otherwise)...
echo.
pause > NUL

del "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\fake-sandbox.bat"
rmdir /s /q "%appdata%\Fake-Sandbox Processes\"
cls

echo.
echo Successfully removed everything. Please relogin to make sure, there aren't any of the old processes running.
echo They will be gone, whenever you restart anyways.
echo.
pause > NUL
exit