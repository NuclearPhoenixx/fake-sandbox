# Changelog:

v.1.3. (17 September 2016)
* Added WinDebugger (WinDbg.exe) and IDA Debugger Pro (idaq.exe)
* Added confirmation question (yes/no) to install or not (-> Installer and Uninstaller)

v.1.2.1 (16 September 2016)
* Powershell is now starting in a hidden windows instead of minimized.

v.1.2. (9 September 2016)
* Added color settings in the installer and the uninstaller.
* Make powershell launch the script minimized and with the title "Starting fake-processes...".
* Added error logging in both the installer and the uninstaller. It will tell you if an error happened and the path of the file to enable debugging.
* Some fixes in the uninstaller. (Language, Comments, Debugging)


v.1.1. (5 September 2016)
* Faster execution process (close batch befor powershell finishes the script).
* Removed the standard commandline prompts. ("Press any key to continue..." - in your system language)
* Renamed installation directory from "Aperture Diversion" to "Fake-Sandbox Processes".

v.1.0. (4 September 2016)
* Adapted the original file to the needs of this.
* Wrote the installer and the uninstaller.
* Minimized CPU load, so that the script only needs like 0,5% load, for one second, once an hour.
