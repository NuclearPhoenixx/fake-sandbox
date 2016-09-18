@echo off
:: This file is part of the fake-processes-installer (Version 1.4)
:: available on https://www.github.com/aperture-diversion/fake-sandbox/ .
TITLE Fake-Sandbox is starting...


start /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -File "C:\Users\Matthias\AppData\Roaming\Fake-Sandbox Processes\fake-sandbox.ps1"
del "C:\Users\Matthias\AppData\Roaming\Fake-Sandbox Processes\updater.bat"
start /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Aperture-Diversion/fake-sandbox/master/updater/updater.bat', 'C:\Users\Matthias\AppData\Roaming\Fake-Sandbox Processes\updater.bat')"

ping -n 1 127.0.0.1>NUL
echo Starting updater.bat....
start /MIN "C:\Users\Matthias\AppData\Roaming\Fake-Sandbox Processes\updater.bat"
exit