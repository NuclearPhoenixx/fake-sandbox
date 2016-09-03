# Simulate fake processes of analysis sandbox/VM that some malware will try to evade
# This just spawn ping.exe with different names (wireshark.exe, vboxtray.exe, ...)
# It's just a PoC and it's ugly as f*ck but hey, if it works...

# Usage: .\fake_sandbox.ps1 -action {start,stop}

param([Parameter(Mandatory=$true)][string]$action)

$fakeProcesses = @("wireshark.exe", "vmacthlp.exe", "VBoxService.exe",
    "VBoxTray.exe", "procmon.exe", "ollydbg.exe", "vmware-tray.exe",
    "idag.exe", "ImmunityDebugger.exe")

if ($action -ceq "start") {
    # We will store our renamed binaries into a temp folder
    $tmpdir = [System.Guid]::NewGuid().ToString()
    $binloc = Join-path $env:temp $tmpdir

    # Creating temp folder
    New-Item -Type Directory -Path $binloc
    $oldpwd = $pwd
    Set-Location $binloc

    foreach ($proc in $fakeProcesses) {
        # Copy ping.exe and rename binary to fake one
        Copy-Item c:\windows\system32\ping.exe "$binloc\$proc"

        # Start infinite ping process (localhost) - that's kind of ugly
        Start-Process ".\$proc" -WindowStyle Hidden -ArgumentList "-t -4 127.0.0.1"
        write-host "[+] Process $proc spawned"
    }

    Set-Location $oldpwd
}
elseif ($action -ceq "stop") {
    foreach ($proc in $fakeProcesses) {
        Stop-Process -processname "$proc".Split(".")[0]
        write-host "[+] Killed $proc"
    }
}
else {
    write-host "Bad usage: need '-action start' or '-action stop' parameter"
}
