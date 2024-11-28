$FEATUREHT = @{
    Name                   = 'AD-Domain-Services'
    IncludeManagementtoo;s = $True
    WarningAction          = 'SilentlyContinue'
}
Install-WindowsFeature @FEATUREHT
