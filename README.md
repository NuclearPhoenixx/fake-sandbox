# fake-sandbox processes

This small script will simulate fake processes of analysis sandbox/VM software that some malware will try to evade.
You can download the original script by x0rz in the ```orig```  directory.

You can also download my slightly optimized script in the main directory named ```fake-sandbox.ps1```.

----------------------------------------

### Script-Features

* Most (good) Spyware (NOT the Hitler-Ransomware) won't spy on you, as long as the processes run which are created by this script.
* No requirements (you need to have Powershell, but it is already preinstalled on most Windows versions)
* Runs on every Windows since Vista
* Minmal size
* No CPU load
* Easy-to-use

### Installer-Features

* Install the script to your autostart directory
* More easy-to-use than the original script (you only have to install it once, it's literally just pressing two random keys)
* Easy uninstaller
* No requirements either
* Minimal size


### Usage:

If you are using the command line, this is your command:

```
.\fake_sandbox.ps1 -action {start,stop}
```
Start will obviously start all the commands, stop will to the opposite.

If you want to use it within the explorer, just follow these steps:

1. Right-click on the file
2. Choose "Run with Powershell"
3. Choose parameter "start" to start and "stop" to kill all processes

### Autostart

If you launch the powershell script with the above commands, you have to rerun it every relogin or startup.
In order to autostart the script, I made an easy-to-use installer.

1. Download the ```installer.bat``` from the ```installer``` directory.
2. Double-Click it.
3. Now you will see this cmd window.

![install](http://www.aperturegds.tk/host/install.png)

  Don't mind the last line in German, this will appear in your language.
Now click any key to start the installation.

4. You can now close the windows or press any key to close it. The installation is complete.

#### Uninstall

If you no longer want to run this program, just download the ```uninstall.bat``` file from the ```installer``` directory.
Then run it and follow the instructions (well, there arent any. You just have to press any key twice.)

![uninstall](http://www.aperturegds.tk/host/uninstall.png)

----------------------------------------

Tested on following Windows versions:

* Win 10 Professional
* Win 8.1 Home
* Win 7 Professional

(c) Aperture Diversion, Phoenix1747. 2016.
