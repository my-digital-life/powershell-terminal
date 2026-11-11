# PowerShell Terminal Setup

This repository contains my personal PowerShell configuration and customizations.

## Features

- Oh My Posh with Kali theme
- PowerShell 7 support
- Windows PowerShell 5.1 support
- Linux-style `ll` command
- Quick network information via `ip`
- `grep` alias using `findstr`
- PowerShell command prediction and history
- Shared profile across multiple Windows PCs
- GitHub-based configuration backup

---

# New Computer Setup

## 1. Install Applications

Open **Windows PowerShell as Administrator** and run:

```powershell
winget install Git.Git
winget install Microsoft.PowerShell
winget install JanDeDobbeleer.OhMyPosh

Install-Module PSReadLine -Force -SkipPublisherCheck
```

---

## 2. Clone Repository

```powershell
cd $HOME

git clone https://github.com/my-digital-life/powershell-terminal.git

cd powershell-terminal
```

---

## 3. Create PowerShell Profile Folders

```powershell
mkdir "$HOME\Documents\PowerShell" -Force
mkdir "$HOME\Documents\WindowsPowerShell" -Force
```

---

## 4. Copy Profile

```powershell
Copy-Item `
"$HOME\powershell-terminal\Microsoft.PowerShell_profile.ps1" `
"$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" `
-Force

Copy-Item `
"$HOME\powershell-terminal\Microsoft.PowerShell_profile.ps1" `
"$HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" `
-Force
```

---

## 5. Restart PowerShell

Close all PowerShell windows and open a new PowerShell session.

---

## 6. Verify Installation

Check versions:

```powershell
$PSVersionTable.PSVersion

oh-my-posh version
```

Test aliases:

```powershell
ll

ip

grep
```

Confirm profile location:

```powershell
$PROFILE
```

---

# Profile Locations

## PowerShell 7

```text
C:\Users\<username>\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
```

## Windows PowerShell 5.1

```text
C:\Users\<username>\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
```

---

# Updating the Configuration

After modifying the profile:

```powershell
git add .
git commit -m "Update PowerShell profile"
git push
```

On another PC:

```powershell
cd $HOME\powershell-terminal

git pull
```

Re-copy the profile files:

```powershell
Copy-Item `
"$HOME\powershell-terminal\Microsoft.PowerShell_profile.ps1" `
"$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" `
-Force

Copy-Item `
"$HOME\powershell-terminal\Microsoft.PowerShell_profile.ps1" `
"$HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" `
-Force
```

Restart PowerShell.

---

# Included Customizations

## Open File Explorer

```powershell
open
```

## List Files

```powershell
ll
```

Displays:

- Name
- Size
- Last Modified Date

## Network Information

```powershell
ip
```

Displays:

- IPv4 addresses
- DNS servers
- Gateways
- DHCP information

## Search Text

```powershell
grep
```

Mapped to Windows `findstr`.

---

# Notes

- The Kali theme (`kali.omp.json`) is stored in this repository.
- The profile is configured to work with both PowerShell 7 and Windows PowerShell 5.1.
- If command history suggestions stop working, update PSReadLine:

```powershell
Install-Module PSReadLine -Force -SkipPublisherCheck
```

- After updating PSReadLine, restart PowerShell.
