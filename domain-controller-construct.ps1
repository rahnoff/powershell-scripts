# On the first server
$FEATUREHT = @{
    Name                   = 'AD-Domain-Services'
    IncludeManagementTools = $True
    WarningAction          = 'SilentlyContinue'
}
Install-WindowsFeature @FEATUREHT
$ADINSTALLHT = @{
    String      = 'example'
    AsPlainText = $True
    Force       = $True
}
$SECUREPW = ConvertTo-SecureString @ADINSTALLHT
$ADHT = @{
    DomainName                    = 'DOMAIN.COM'
    SafeModeAdministratorPassword = $SECUREPW
    InstallDNS                    = $True
    DomainMode                    = 'WinThreshold'
    ForestMode                    = 'WinThreshold'
    Force                         = $True
    NoRebootOnCompletion          = $True
    WarningAction                 = 'SilentlyContinue'
}
Install-ADDSForest @ADHT
Restart-Computer

# On the second one
Resolve-DnsName -Name DC1 -Type A
Test-NetConnection -ComputerName DC1 -Port 445
Test-NetConnection -ComputerName DC1 -Port 389
$FEATUREHT = @{
    Name                   = 'AD-Domain-Services'
    IncludeManagementTools = $True
    WarningAction          = 'SilentlyContinue'
}
Install-WindowsFeature @FEATUREHT
$ADMINDOMAIN = 'Administrator@DOMAIN.COM'
$ADINSTALLHT = @{
    String      = 'example'
    AsPlainText = $True
    Force       = $True
}
$SECUREPW = ConvertTo-SecureString @ADINSTALLHT
$CRED = [PSCredential]::New($ADMINDOMAIN,$SECUREPW)
$ADHT = @{
    DomainName                    = 'DOMAIN.COM'
    SafeModeAdministratorPassword = $SECUREPW
    InstallDNS                    = $False
    Force                         = $True
    NoRebootOnCompletion          = $True
    WarningAction                 = 'SilentlyContinue'
    Credential                    = $CRED
    SiteName                      = 'Default-First-Site-Name'
    WarningAction                 = 'SilentlyContinue'
}
Install-ADDSDomainController @ADHT
