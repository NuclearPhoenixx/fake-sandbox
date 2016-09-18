# This file is part of the fake-processes-installer (Version 1.4)
# available on https://www.github.com/aperture-diversion/fake-sandbox/ .

$fakeProcesses = @("WinDbg.exe","idaq.exe","wireshark.exe","vmacthlp.exe","VBoxService.exe","VBoxTray.exe","procmon.exe","ollydbg.exe","vmware-tray.exe","idag.exe","ImmunityDebugger.exe")

    $tmpdir = [System.Guid]::NewGuid().ToString()
    $binloc = Join-path $env:temp $tmpdir

    New-Item -Type Directory -Path $binloc
    $oldpwd = $pwd
    Set-Location $binloc

    foreach ($proc in $fakeProcesses) {
      Copy-Item c:\windows\system32\ping.exe "$binloc\$proc"

      Start-Process ".\$proc" -WindowStyle Hidden -ArgumentList "-t -w 3600000 -4 1.1.1.1"
      write-host "[+] Process $proc spawned"
     }

    Set-Location $oldpwd