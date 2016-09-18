@echo off
TITLE Fake-sandbox processes updater


start /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Aperture-Diversion/fake-sandbox/master/updater/version', '%appdata%\Fake-Sandbox Processes\version.txt')"
ping -n 2 localhost>NUL

if version.txt == 1.3 (goto ok)
goto new

:new
nircmd win activate Fake-sandbox processes updater
del version.txt
if /i %ANSWER%==y (goto install)
if /i %ANSWER%==n (goto no)
goto unrecog

:install
start /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Aperture-Diversion/fake-sandbox/master/updater/fake-sandbox.bat', '%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\fake-sandbox.bat')"
start /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Aperture-Diversion/fake-sandbox/master/updater/fake-sandbox.ps1', '%appdata%\Fake-Sandbox Processes\fake-sandbox.ps1')"
exit

:ok
del version.txt
exit
