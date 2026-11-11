@'
# PowerShell Terminal Setup

This repository contains my personal PowerShell configuration.

## Features

- Oh My Posh with Kali theme
- PowerShell 7 support
- Windows PowerShell 5.1 support
- Linux-style `ll` command
- Quick network information via `ip`
- `grep` alias using `findstr`
- Command history suggestions in PowerShell 7
- Shared profile across multiple PCs

---

# New Computer Setup

## Install Applications

Open PowerShell as Administrator and run:

```powershell
winget install Git.Git
winget install Microsoft.PowerShell
winget install JanDeDobbeleer.OhMyPosh
Install-Module PSReadLine -Force -SkipPublisherCheck

## Create profile folders:

```powershell
mkdir "$HOME\Documents\PowerShell" -Force
mkdir "$HOME\Documents\WindowsPowerShell" -Force

## Copy profile:

```powershell
Copy-Item `
"$HOME\powershell-terminal\Microsoft.PowerShell_profile.ps1" `
"$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" `
-Force

