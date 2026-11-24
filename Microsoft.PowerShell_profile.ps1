# =========================
# Oh My Posh - Kali Theme
# =========================

$Theme = "$HOME\powershell-terminal\kali.omp.json"

if (Test-Path $Theme) {
    oh-my-posh init pwsh --config $Theme | Invoke-Expression
}

# =========================
# Aliases
# =========================

Set-Alias open explorer.exe
Set-Alias grep findstr
Set-Alias ip ip-h

# =========================
# PSReadLine
# =========================

if (Get-Module -ListAvailable PSReadLine) {

    Set-PSReadLineOption -EditMode Windows

    # Command history
    Set-PSReadLineOption -MaximumHistoryCount 10000
    Set-PSReadLineOption -HistorySaveStyle SaveIncrementally
    Set-PSReadLineOption -HistorySearchCursorMovesToEnd

    # Predictions
    Set-PSReadLineOption -PredictionSource History
    Set-PSReadLineOption -PredictionViewStyle ListView

    # Up/Down arrows search history beginning with current text
    Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
    Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
}

# =========================
# Functions
# =========================

function ll {
    Get-ChildItem -Force |
        Select-Object `
            Name,
            @{
                Name = "Size"
                Expression = {
                    if ($_.PSIsContainer) {
                        "<DIR>"
                    }
                    else {
                        "{0:N0}" -f $_.Length
                    }
                }
            },
            @{
                Name = "Modified"
                Expression = {
                    $_.LastWriteTime.ToString("yyyy-MM-dd HH:mm")
                }
            } |
        Format-Table -AutoSize
}

function ip-h {
    ipconfig /all |
        findstr /R `
            /C:"^[A-Za-z].*:$" `
            /C:"192\.168" `
            /C:"169\.254" `
            /C:"172\." `
            /C:"DNS Servers" `
            /C:"^[ ]*[0-9][0-9]*\."
}

function la {
    Get-ChildItem -Force
}

function reload-profile {
    . $PROFILE
}

function edit-profile {
    notepad $PROFILE
}