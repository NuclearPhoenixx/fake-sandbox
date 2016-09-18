@echo off

start /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/Aperture-Diversion/fake-sandbox/archive/master.zip', 'C:\Users\Matthias\AppData\Roaming\Fake-Sandbox Processes\update.zip')"
timeout 2

pause
