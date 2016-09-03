@echo off
:: *---------------------------------------------------------------*
:: | This is the uninstaller for the fake-process-installer.       |
:: *---------------------------------------------------------------*

echo.
echo If you really want to uninstall the fake-sandbox scripts, click any button to continue (close this windows if you dont't want to)...
echo.
pause

del "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\fake-sandbox.bat"
rmdir /s /q "%appdata%\Aperture Diversion\"
cls

echo.
echo Successfully removed everything. Please relogin to make sure, there aren't any of the old processes running.
echo They will be gone, whenever you restart anyways.
echo.
pause
exit