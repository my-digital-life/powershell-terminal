# History file
$HistoryFile = (Get-PSReadLineOption).HistorySavePath

# Output folder
$OutputDir = "C:\Users\Owner\powershell-terminal\history"

# Create folder if missing
New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null

# Commands worth keeping
$KeepPatterns = @(
    '^ssh '
    '^scp '
    '^adb '
    '^scrcpy'
    '^docker '
    '^docker-compose'
    '^winget '
    '^ollama '
    '^git '
    '^ping '
    '^nslookup '
    '^ipconfig'
    '^curl '
    '^wget '
    '^robocopy '
    '^tailscale'
    '^iperf3'
    '^nvidia-smi'
    '^Get-'
    '^Set-'
    '^New-'
    '^Start-'
    '^Stop-'
    '^Remove-'
    '^Test-'
    '^Resolve-'
    '^Install-'
    '^Import-'
    '^Export-'
    '^Update-'
    '^history$'
    '^Get-History'
    '^cd '
    '^pwd$'
    '^ls$'
    '^ll$'
    '^dir$'
    '^clear$'
    '^cls$'
    '^wsl'
    '^smartctl'
    '^chkdsk'
    '^winsat'
)

# Track duplicates
$Seen = @{}

# Cleaned command list
$Clean = foreach ($Line in Get-Content $HistoryFile)
{
    $Line = $Line.Trim()

    if ([string]::IsNullOrWhiteSpace($Line))
    {
        continue
    }

    $Keep = $false

    foreach ($Pattern in $KeepPatterns)
    {
        if ($Line -match $Pattern)
        {
            $Keep = $true
            break
        }
    }

    if (-not $Keep)
    {
        continue
    }

    if (-not $Seen.ContainsKey($Line))
    {
        $Seen[$Line] = $true
        $Line
    }
}

# Master file
$Clean | Set-Content "$OutputDir\history-clean.txt"

# Categories
$Clean | Where-Object {$_ -match '^ssh|^scp'} | Set-Content "$OutputDir\ssh.txt"

$Clean | Where-Object {$_ -match '^adb|^scrcpy'} | Set-Content "$OutputDir\adb.txt"

$Clean | Where-Object {$_ -match '^docker'} | Set-Content "$OutputDir\docker.txt"

$Clean | Where-Object {$_ -match '^winget'} | Set-Content "$OutputDir\winget.txt"

$Clean | Where-Object {$_ -match '^ollama'} | Set-Content "$OutputDir\ollama.txt"

$Clean | Where-Object {$_ -match '^ping|^nslookup|^ipconfig|^tailscale'} | Set-Content "$OutputDir\network.txt"

$Clean | Where-Object {$_ -match '^Get-|^Set-|^New-|^Start-|^Stop-|^Remove-|^Test-|^Resolve-'} | Set-Content "$OutputDir\powershell.txt"

Write-Host ""
Write-Host "Done." -ForegroundColor Green
Write-Host ""
Write-Host "Created:"
Write-Host "history-clean.txt"
Write-Host "ssh.txt"
Write-Host "adb.txt"
Write-Host "docker.txt"
Write-Host "winget.txt"
Write-Host "ollama.txt"
Write-Host "network.txt"
Write-Host "powershell.txt"