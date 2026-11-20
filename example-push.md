# GitHub Workflow Example

This document shows how to manage and synchronize the PowerShell configuration across all computers.

Repository location:

```powershell
$HOME\powershell-terminal
```

Examples:

```text
C:\Users\Owner\powershell-terminal
C:\Users\Scott\powershell-terminal
C:\Users\rem\powershell-terminal
```

Using `$HOME` makes the commands portable between systems.

---

# Master Computer

Current master computer:

```text
micro
```

All profile changes should be made on the master computer first.

---

# Edit PowerShell Profile

Open the shared profile:

```powershell
notepad++ "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
```

Reload the profile:

```powershell
. $PROFILE
```

Test:

```powershell
ll

ip
```

---

# Update Repository Copy

Copy the current profile into the GitHub repository:

```powershell
Copy-Item `
"$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" `
"$HOME\powershell-terminal\Microsoft.PowerShell_profile.ps1" `
-Force
```

---

# Check Repository Status

```powershell
cd "$HOME\powershell-terminal"

git status
```

View recent commits:

```powershell
git log --oneline -5
```

---

# Commit Changes

Example: profile update

```powershell
git add Microsoft.PowerShell_profile.ps1

git commit -m "Update PowerShell profile"
```

Example: README update

```powershell
git add README.md

git commit -m "Update README"
```

Example: new file

```powershell
git add example-push.md

git commit -m "Add example push workflow"
```

---

# Push Changes To GitHub

Always update from GitHub first:

```powershell
git pull --rebase origin master
```

Push:

```powershell
git push
```

---

# Update Another Computer

Go to the repository:

```powershell
cd "$HOME\powershell-terminal"
```

Download newest changes:

```powershell
git pull
```

---

# Deploy Updated Profile

Copy repository profile to active profile:

```powershell
Copy-Item `
"$HOME\powershell-terminal\Microsoft.PowerShell_profile.ps1" `
"$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" `
-Force
```

Reload profile:

```powershell
. $PROFILE
```

---

# Verify

Check active profile:

```powershell
$PROFILE
```

Test aliases:

```powershell
ll

ip

grep
```

Test history suggestions:

Type:

```text
i
```

Press:

```text
Down Arrow
```

History should appear.

---

# Profile Layout

Windows PowerShell profile:

```text
$HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
```

Contents:

```powershell
. "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
```

Main profile:

```text
$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
```

Only edit the main profile.

---

# Useful Commands

Reload profile:

```powershell
. $PROFILE
```

Open profile:

```powershell
notepad++ "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
```

Check status:

```powershell
git status
```

View recent commits:

```powershell
git log --oneline -5
```

Pull latest changes:

```powershell
git pull
```

Push latest changes:

```powershell
git push
```