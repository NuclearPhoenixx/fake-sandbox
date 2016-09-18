@echo off
:: This file is part of the fake-processes-installer (Version 1.3)
:: available on https://www.github.com/aperture-diversion/fake-sandbox/ .
TITLE Fake-Sandbox is starting...

start /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -File "C:\Users\Matthias\AppData\Roaming\Fake-Sandbox Processes\fake-sandbox.ps1"
del "C:\Users\Matthias\AppData\Roaming\Fake-Sandbox Processes\updater.bat"
start /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Aperture-Diversion/fake-sandbox/master/updater/updater.bat', 'C:\Users\Matthias\AppData\Roaming\Fake-Sandbox Processes\updater.bat')"

ping -n 0.5 localhost>NUL
if exist "C:\Users\Matthias\AppData\Roaming\Fake-Sandbox Processes\updater.bat" (goto start)
goto exit

:start
start /MIN "C:\Users\Matthias\AppData\Roaming\Fake-Sandbox Processes\updater.bat"
echo Starting updater.bat....
exit

:exit
echo Did not find updater.bat; exiting....
exit
