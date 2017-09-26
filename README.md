# Fake Sandbox Processes (FSP)
![latest version](https://img.shields.io/github/release/Phoenix1747/fake-sandbox.svg) ![issues](https://img.shields.io/github/issues/Phoenix1747/fake-sandbox.svg) ![Downloads](https://img.shields.io/github/downloads/Phoenix1747/fake-sandbox/latest/total.svg)

This small script will simulate fake processes of analysis, sandbox and/or VM software that some malware will try to avoid.
You can download the original script (made by @x0rz ) in the ```orig```  directory.

You can also download my slightly optimized script in the main directory. The file is named ```fsp.ps1```.

---

### Script-Features

* Some (good) spyware will stop spying on you as long as the processes run, which are created by this script.
* Requirements: Powershell (preinstalled on Win 7 and newer)
* Runs on every Windows since Vista
* Tiny size
* No CPU load
* Easy to use
* No network connection required

### Installer-Features

* Automatically install the script to your autostart directory
* Extremely easy to install
* Uninstaller to purge all files
* NO requirements
* Tiny size
* Offline package
* Automatic updater included - only if you want!

---

### Usage:

Open the command line and paste this command (don't forget to adjust the path!):

``` Powershell -executionpolicy remotesigned -File "Your\Path\fsp.ps1" ```

After pressing ENTER you will be asked to either start or stop all processes.

### Autostart

If you execute the powershell script with the above command, you will have to rerun it after every login or startup.
In order to autostart the script I made an easy-to-use installer.

<ol>
  <li>Download the ```fsp-installer.bat``` file from the release section.</li>
  <li>Double-click it.</li>
  <li>Now you will see this cmd window:</li>
  
	<br><img src="https://apertured.tk/host/install.png"><br>
		
  <li>Choose "i" to start the installer.</li>
  <li>Now enter "y" to start installing or "n" to abort.</li>
  <li>If you entered "y" this image will now pop up:</li>

	<br><img src="https://apertured.tk/host/install2.png"><br>

  <li>Enter "y" to install the auto-updater or "n" to not install it (it'll work anyways, but it is recommended to install the updater).</li>
</ol>

---> You can now close the window or press any key to close it. The (un)installation is complete.

#### Uninstall

If you no longer want this program on your computer, you'll need the ```fsp-installer.bat``` file again.
Run it and chose "u" to start the uninstallation process. Then enter "y" if you are ready to uninstall it.

![uninstall](https://www.apertured.tk/host/uninstall.png)

If the process was successful, you'll see a confirmation screen.

---

Successfully tested on the following Windows versions:

* Win 10 Professional
* Win 8.1 Home
* Win 7 Professional

2017, Phoenix1747.
