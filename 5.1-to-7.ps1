# On Windows Server 2016
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$destination = "$env:USERPROFILE"
$powershellVersion = '7.4.6'
$source = "https://github.com/PowerShell/PowerShell/releases/download/v$powershellVersion/PowerShell-$powershellVersion-win-x64.zip"
$powershellArchive = $destination + $(Split-Path -Path $source -Leaf)
Invoke-WebRequest -Uri $source -OutFile $powershellArchive
