# fake sandbox processes (FSP)
![latest version](https://img.shields.io/github/release/aperture-diversion/fake-sandbox.svg) ![issues](https://img.shields.io/github/issues/aperture-diversion/fake-sandbox.svg) ![Downloads](https://img.shields.io/github/downloads/aperture-diversion/fake-sandbox/latest/total.svg)

This small script will simulate fake processes of analysis sandbox/VM software that some malware will try to avoid.
You can download the original script (made by @x0rz ) in the ```orig```  directory.

You can also download my slightly optimized script in the main directory. The file is named ```fake-sandbox.ps1```.

----------------------------------------

### Script-Features

* Most (good) Spyware (NOT the Hitler-Ransomware) won't spy on you, as long as the processes run which are created by this script.
* No requirements (you need to have Powershell, but it is already preinstalled on all Windows versions since Win 7)
* Runs on every Windows since Vista
* Minmal size
* No CPU load
* Easy-to-use
* Offline package - no internet connection required

### Installer-Features

* Install the script to your autostart directory
* More easy-to-use than the original script (you only have to install it once, it's literally just pressing two random keys)
* Easy uninstaller
* No requirements either
* Minimal size
* Offline package - no internet connection required
* Automatic updater included, if you want!

----------------------------------------

### Usage:

If you are using the command line, this is your command:

```
Powershell -File "C:\Full\Path\To\File\fake-sandbox.ps1" -action {start,stop}
```
Start will obviously start all the commands, stop will do the opposite.

If you are using the explorer, just follow these steps:

* Right-click on the file
* Choose "Run with Powershell"
* Choose parameter "start" to start and "stop" to kill all processes

### Autostart

If you execute the powershell script with the above commands, you have to rerun it every relogin or startup.
In order to autostart the script, I made an easy-to-use installer.

<ol>
  <li>Download the ```fake-sandbox-installer.bat``` from the ```installer``` directory.</li>
  <li>Double-Click it.</li>
  <li>Now you will see this cmd window:</li>

<br>
<img src="https://apertured.tk/host/install.png">
<br>

  <li>Now press "y" to start the installation or "n" to abort it.</li>
  <li>Now this image will pop up:</li>

<br>
<img src="https://apertured.tk/host/install2.png">
<br>

  <li>Press "y" to install the auto-updater or "n" to not install it (it will work anyways, I just recommended you to install the updater).</li>
</ol>

---> You can now close the windows or press any key to close it. The installation is complete.

#### Uninstall

If you no longer want to run this program, just download the ```uninstall.bat``` file from the ```installer``` directory.
Then run it and follow the instructions (well, there basically arent any. You just have to press a key twice.)

![uninstall](http://www.apertured.tk/host/uninstall.png)

----------------------------------------

Successfully tested on following Windows versions:

* Win 10 Professional
* Win 8.1 Home
* Win 7 Professional

2017, Phoenix1747
