# this is a powershell script for installing openjdk

$openjdk_version = "26.0.1"
$openjdk_prefered_location = "C:\jdk"
$openjdk_download_link = "https://download.java.net/java/GA/jdk$($openjdk_version)/458fda22e4c54d5ba572ab8d2b22eb83/8/GPL/openjdk-$($openjdk_version)_windows-x64_bin.zip"
$temp = $env:TEMP

# download openjdk as zip from the official website
Start-BitsTransfer -Source $openjdk_download_link -Destination "$($temp)\openjdk.zip"

# extract the zip
Expand-Archive -Path "$($temp)\openjdk.zip" -DestinationPath "$($temp)\openjdk"

# move the openjdk files into the preferred JAVA_HOME location
New-Item -ItemType Directory -Path $openjdk_prefered_location | Out-Null
Move-Item -Path "$($temp)\openjdk\jdk-$($openjdk_version)\*" -Destination $openjdk_prefered_location -Force

# clean up temp folder
Remove-Item -Path "$($temp)\openjdk.zip"
Remove-Item -Path "$($temp)\openjdk" -Recurse

# create the JAVA_HOME enviroment variable as $openjdk_prefered_location
[Environment]::SetEnvironmentVariable("JAVA_HOME", $openjdk_prefered_location, "User")

# add openjdk to the path
$java_home = [Environment]::GetEnvironmentVariable("JAVA_HOME", "User")
$old_path = [Environment]::GetEnvironmentVariable("Path", "User")
$new_path = "$($old_path);$($java_home)\bin"
[Environment]::SetEnvironmentVariable("Path", $new_path, "User")