function Test-IsAdmin
{
    $currentIdentity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($currentIdentity)
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

if (-not (Test-IsAdmin))
{
    Write-Host "Not running as admin. Requesting elevation..."

    $process = New-Object System.Diagnostics.ProcessStartInfo
    $process.FileName = "powershell.exe"
    $process.Arguments = "-ExecutionPolicy Bypass -File `"$PSCommandPath`""
    $process.Verb = "runas"
    $process.UseShellExecute = $true

    try
    {
        [System.Diagnostics.Process]::Start($process) | Out-Null
    } 
    catch
    {
        Write-Host "Admin permission denied. Exiting..."
    }

    exit
}

Write-Host "you are now running as admin"