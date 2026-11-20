 # Useful Commands and Notes

## PowerShell Profiles

### Show active profile

```powershell
$PROFILE
```

Displays the profile currently being used.

---

### Shared Profile Setup

Windows PowerShell profile:

```text
C:\Users\<user>\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
```

Contains only:

```powershell
. "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
```

Main profile:

```text
C:\Users\<user>\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
```

Edit only the main profile.

---

### Open profile in Notepad++

```powershell
notepad++ "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
```

Reload profile:

```powershell
. $PROFILE
```

---

# Notepad++ PATH Configuration

## Find Notepad++

Check common location:

```powershell
Test-Path "C:\Program Files\Notepad++\notepad++.exe"
```

Check x86 location:

```powershell
Test-Path "C:\Program Files (x86)\Notepad++\notepad++.exe"
```

Search entire machine:

```powershell
Get-ChildItem C:\ -Filter notepad++.exe -Recurse -ErrorAction SilentlyContinue
```

---

## Add Notepad++ To Current Session

If installed in Program Files:

```powershell
$env:PATH += ";C:\Program Files\Notepad++"
```

Test:

```powershell
notepad++ $PROFILE
```

---

## Add Notepad++ Permanently

If installed in Program Files:

```powershell
[Environment]::SetEnvironmentVariable(
    "Path",
    $env:Path + ";C:\Program Files\Notepad++",
    "User"
)
```

Open a new PowerShell window.

Verify:

```powershell
where.exe notepad++
```

---

# Git Workflow

## Check Status

```powershell
git status
```

---

## View Recent Commits

```powershell
git log --oneline -5
```

---

## Pull Latest Changes

```powershell
git pull
```

or

```powershell
git pull --rebase origin master
```

---

## Push Changes

Example for README.md:

```powershell
git add README.md

git commit -m "Update README"

git push
```

---

## Pull On Other Computers

```powershell
cd $HOME\powershell-terminal

git pull
```

---

# Profile Deployment

## Copy GitHub Profile To Local Profile

```powershell
Copy-Item `
"$HOME\powershell-terminal\Microsoft.PowerShell_profile.ps1" `
"$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" `
-Force
```

Reload:

```powershell
. $PROFILE
```

---

# Useful Profile Commands

## Directory Listing

```powershell
ll
```

---

## Network Information

```powershell
ip
```

---

## Open File Explorer

```powershell
open
```

---

## Search Text

```powershell
grep
```

Uses Windows `findstr`.

---

# SSH PowerShell Login

Configure OpenSSH to launch PowerShell automatically:

```powershell
New-Item "HKLM:\SOFTWARE\OpenSSH" -Force

New-ItemProperty `
-Path "HKLM:\SOFTWARE\OpenSSH" `
-Name DefaultShell `
-Value "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" `
-PropertyType String `
-Force
```

Verify:

```powershell
Get-ItemProperty "HKLM:\SOFTWARE\OpenSSH"
```

Reconnect SSH:

```bash
ssh user@host
```

You should land directly in PowerShell instead of CMD.

---

# Windows Terminal Size

Current settings file:

```powershell
notepad "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
```

Recommended values:

```json
"initialCols": 105,
"initialRows": 20
```

PowerShell font:

```json
"font": {
    "size": 14,
    "weight": "normal"
}
```