@echo off
:: This file is part of the fake-processes-installer (Version 1.4.01)
:: available on https://www.github.com/aperture-diversion/fake-sandbox/ .
TITLE Fake-Sandbox is starting...


start /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -File "%appdata%\Fake-Sandbox Processes\fake-sandbox.ps1"
del "%appdata%\Fake-SandboxProcesses\updater.bat"
start /MIN powershell -executionpolicy remotesigned -WindowStyle Hidden -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Aperture-Diversion/fake-sandbox/master/updater/updater.bat', '%appdata%\Fake-SandboxProcesses\updater.bat')"

ping -n 1 127.0.0.1>NUL
echo Starting updater.bat....
start /MIN %appdata%\Fake-SandboxProcesses\updater.bat
exit