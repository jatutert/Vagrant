#
#	Windows Server 2022 Active Directory Domain Services Domain Controller Installer
#	Created by John Tutert for TutSOFT
#
#	For personal or educational use 
#
#	Changelog
#	11 mei	Aanmaken bestand		V001
#	12 mei	Verbeteren				V002
#	17 mei 	Domain en Forest Mode	V003

#
#	Domainname 					homelab.net
#	Wachtwoord Administrator 	!@WACHTwoord#$
#

Write-Host "Installeer AD DS rol"
Install-WindowsFeature -Name AD-Domain-Services -IncludeAllSubFeature -IncludeManagementTools

Write-Host "Importeer de ADDSDeployment module"
Import-Module ADDSDeployment

Write-Host "Promoveer de server tot een domeincontroller"

# https://learn.microsoft.com/en-us/powershell/module/addsdeployment/install-addsforest?view=windowsserver2022-ps

Install-ADDSForest `
    -CreateDnsDelegation:$false `
    -DatabasePath "C:\Windows\NTDS" `
    -DomainMode Win2022 `
    -DomainName "homelab.net" `
    -DomainNetbiosName "homelab" `
    -ForestMode Win2022 `
    -InstallDns:$true `
    -LogPath "C:\Windows\NTDS" `
    -NoRebootOnCompletion:$false `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "!@WACHTwoord#$" -AsPlainText -Force) `
    -SysvolPath "C:\Windows\SYSVOL" `
    -Force:$true

# Herstart de server om de promotie te voltooien
Restart-Computer -Force -ComputerName localhost -Confirm:$false


#
#	Thats all Folks
#