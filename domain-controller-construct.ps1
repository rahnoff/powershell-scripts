$FEATUREHT = @{
    Name                   = 'AD-Domain-Services'
    IncludeManagementTools = $True
    WarningAction          = 'SilentlyContinue'
}
Install-WindowsFeature @FEATUREHT
