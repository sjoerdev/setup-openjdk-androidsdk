# this is a powershell script for installing the android command line tools

$tools_version = "14742923"
$tools_preferred_home = "C:\Android"
$tools_preferred_location = "$($tools_preferred_home)\cmdline-tools\latest"
$tools_download_link = "https://dl.google.com/android/repository/commandlinetools-win-$($tools_version)_latest.zip"
$temp = $env:TEMP

# download tools as zip from the official website
Start-BitsTransfer -Source $tools_download_link -Destination "$($temp)\tools.zip"

# extract the zip
Expand-Archive -Path "$($temp)\tools.zip" -DestinationPath "$($temp)\tools"

# move the tools files into the preferred ANDROID_HOME location
New-Item -ItemType Directory -Path $tools_preferred_location | Out-Null
Move-Item -Path "$($temp)\tools\cmdline-tools\*" -Destination $tools_preferred_location -Force

# clean up temp folder
Remove-Item -Path "$($temp)\tools.zip"
Remove-Item -Path "$($temp)\tools" -Recurse

# create the ANDROID_HOME enviroment variable as C:\Android
[Environment]::SetEnvironmentVariable("ANDROID_HOME", $tools_preferred_home, "User")

# add tools to the path
$old_path = [Environment]::GetEnvironmentVariable("Path", "User")
$new_path = "$($old_path);$($tools_preferred_location)\bin"
[Environment]::SetEnvironmentVariable("Path", $new_path, "User")