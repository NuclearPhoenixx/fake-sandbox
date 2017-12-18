# Changelog:

v.1.7.6 (18 December 2017)
* Final fix for updater bug: not removing downloaded files after installing an update.

v.1.7.5 (17 December 2017)
* Fixed updater bug: not removing downloaded files after installing an update.

v.1.7.4 (15 December 2017)
* Fixed many linguistic mistakes and sentences that did not make any sense.
* Small text changes at some prompts.
* More info about the updater.

v.1.7.3 (19 November 2017)
* Removed unnecessary ping timeouts - the scripts run much faster now.
* Fixed updater not deleting downloaded files after update.

v.1.7.2 (17 November 2017)
* Fixed critical issue #4 by @steel9, thanks!

v.1.7.1 (26 September 2017)
* Smaller optimizations and fixes.

v.1.7 (25 September 2017)
* Changed installation path.
* Smaller file size.
* Cleaned up code.
* Uninstaller now directly included in the installer.
* Smaller changes and optimizations.
* Bug fixes.

v.1.6.4 (15 August 2017)
* Replaced dead links.

v.1.6.3 (29 May 2017)
* Fixed user path mistake.

v.1.6.2 (16 April 2017)
* Some general improvements to the updater and installer.
* Fixes.

v.1.6.1 (12 December 2016)
* The comments were rewritten completely.
* Some visual changes to the installer and updater.
* Reduced the size of all scripts by removing unnecessary stuff.

v.1.6 (1 October 2016)
* You can now choose to install FSP with or without the auto updater!
* Restart instead of exit after typing in an unrecognized command.

v.1.5.1 (1 October 2016)
* Stability improvements.
* Bugfixes.

v.1.5 (19 September 2016)
* Some updater improvements and fixes.

v.1.4 (18 September 2016)
* Added an automatic updater to search for updates on every start.
* Changed installation path from "%appdata%\Fake-Sandbox Processes\" to "%appdata%\Fake-SandboxProcesses\".

v.1.3 (17 September 2016)
* Added WinDebugger (WinDbg.exe) and IDA Debugger Pro (idaq.exe).
* Added confirmation question (yes/no) to install or not (-> Installer and Uninstaller).

v.1.2.1 (16 September 2016)
* Powershell is now starting in a hidden windows instead of minimized.

v.1.2 (9 September 2016)
* Added color settings in the installer and the uninstaller.
* Make powershell launch the script minimized and with the title "Starting fake-processes...".
* Added error logging in both the installer and the uninstaller. It will tell you if an error happened and the path of the file to enable debugging.
* Some fixes in the uninstaller. (Language, Comments, Debugging)


v.1.1 (5 September 2016)
* Faster execution process (close batch befor powershell finishes the script).
* Removed the standard commandline prompts. ("Press any key to continue..." - in your system language)
* Renamed installation directory from "Aperture Diversion" to "Fake-Sandbox Processes".

v.1.0. (4 September 2016)
* Adapted the original file to the needs of this.
* Wrote the installer and the uninstaller.
* Minimized CPU load, so that the script only needs like 0,5% load, for one second, once an hour.
