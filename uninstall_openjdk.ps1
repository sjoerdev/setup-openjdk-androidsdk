# this is a powershell script for uninstalling openjdk

$openjdk_prefered_location = "C:\jdk"

# remove the jdk installation directory
Remove-Item -Path $openjdk_prefered_location -Recurse -Force -ErrorAction Stop

# remove JAVA_HOME enviroment variable
[Environment]::SetEnvironmentVariable("JAVA_HOME", $null, "User")

# remove the jdk from the path
$path_value = [Environment]::GetEnvironmentVariable("Path", "User")
$path_parts = $path_value -split ';' | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' }
$jdk_bin = "$openjdk_prefered_location\bin"
$filtered_parts = $path_parts | Where-Object { $_ -ne $jdk_bin }
$new_path = ($filtered_parts -join ';').TrimEnd(';')
[Environment]::SetEnvironmentVariable("Path", $new_path, "User")