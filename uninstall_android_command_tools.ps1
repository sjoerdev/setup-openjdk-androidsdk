# this is a powershell script for uninstalling cmdline_tools

$tools_preferred_home = "C:\Android"
$tools_preferred_location = "$($tools_preferred_home)\cmdline-tools\latest"

# remove the android home installation directory
Remove-Item -Path $tools_preferred_home -Recurse -Force -ErrorAction Stop

# remove ANDROID_HOME enviroment variable
[Environment]::SetEnvironmentVariable("ANDROID_HOME", $null, "User")

# remove the cmdline_tools from the path
$path_value = [Environment]::GetEnvironmentVariable("Path", "User")
$path_parts = $path_value -split ';' | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' }
$tools_bin = "$($tools_preferred_location)\bin"
$filtered_parts = $path_parts | Where-Object { $_ -ne $tools_bin }
$new_path = ($filtered_parts -join ';').TrimEnd(';')
[Environment]::SetEnvironmentVariable("Path", $new_path, "User")