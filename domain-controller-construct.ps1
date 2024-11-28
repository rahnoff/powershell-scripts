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
