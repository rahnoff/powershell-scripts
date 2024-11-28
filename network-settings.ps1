$index = (Get-NetAdapter).ifIndex
New-NetIPAddress -InterfaceIndex $index -IPAddress 'number' -PrefixLength 24 -DefaultGateway 'number'
Set-DnsClientServerAddress -InterfaceIndex $index -ServerAddresses 'number'
Rename-Computer -NewName 'name'
