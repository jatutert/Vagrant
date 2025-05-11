# Installeer de AD DS rol
Install-WindowsFeature -Name AD-Domain-Services -IncludeAllSubFeature -IncludeManagementTools

# Importeer de ADDSDeployment module
Import-Module ADDSDeployment

# Promoveer de server tot een domeincontroller

# https://learn.microsoft.com/en-us/powershell/module/addsdeployment/install-addsforest?view=windowsserver2022-ps

Install-ADDSForest `
    -CreateDnsDelegation:$false `
    -DatabasePath "C:\Windows\NTDS" `
    -DomainMode WinThreshold `
    -DomainName "homelab.net" `
    -DomainNetbiosName "homelab" `
    -ForestMode WinThreshold `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "ComplexPassword123!" -AsPlainText -Force) `
    -InstallDns:$true `
    -LogPath "C:\Windows\NTDS" `
    -SysvolPath "C:\Windows\SYSVOL" `
    -Force

# Herstart de server om de promotie te voltooien
Restart-Computer
