#
#	Vagrant Virtuele Windows Machine voorzien van Static IPV4 Adres voor Ethernet1 NetAdapter
#	Created by John Tutert for TutSOFT
#
#	Datum 11 mei 2025
#
#	## LET OP ##
#	VM heeft NetAdapter1 en NetAdapter2
#	Alleen NetAdapter1 aanpassen naar Statisch IPv4 Adres
#	NetAdapter2 NIET aanpassen anders werkt Vagrant WinRM Service niet meer
#
#	Changelog
#
#	V100	Basisversie
#	V101	DB01 en DC01 
#	V102	Opmerkingen NetAdapter1 en NetAdapter2
#
#
# Controleer of de hostname gelijk is aan DB01
$hostname = (Get-ComputerInfo).CsName
if ($hostname -eq "DB01") {
    # Stel de netwerkadapter Ethernet1 in met een statisch IP-adres
    $interfaceAlias = "Ethernet1"
    $ipAddress = "10.1.10.21"
    $prefixLength = 24
    $defaultGateway = "10.1.10.1"
    $dnsServers = @("8.8.8.8", "8.8.4.4")

    # Stel het statische IP-adres in
    New-NetIPAddress -InterfaceAlias $interfaceAlias -IPAddress $ipAddress -PrefixLength $prefixLength -DefaultGateway $defaultGateway

    # Stel de DNS-servers in
    Set-DnsClientServerAddress -InterfaceAlias $interfaceAlias -ServerAddresses $dnsServers

    Write-Output "Netwerkadapter $interfaceAlias is voorzien van een statisch IP-adres."
} else {
    Write-Output "Hostname is niet gelijk aan DB01. Geen wijzigingen aangebracht."
}


# Controleer of de hostname gelijk is aan DC01
$hostname = (Get-ComputerInfo).CsName
if ($hostname -eq "DC01") {
    # Stel de netwerkadapter Ethernet1 in met een statisch IP-adres
    $interfaceAlias = "Ethernet1"
    $ipAddress = "10.1.10.11"
    $prefixLength = 24
    $defaultGateway = "10.1.10.1"
    $dnsServers = @("8.8.8.8", "8.8.4.4")

    # Stel het statische IP-adres in
    New-NetIPAddress -InterfaceAlias $interfaceAlias -IPAddress $ipAddress -PrefixLength $prefixLength -DefaultGateway $defaultGateway

    # Stel de DNS-servers in
    Set-DnsClientServerAddress -InterfaceAlias $interfaceAlias -ServerAddresses $dnsServers

    Write-Output "Netwerkadapter $interfaceAlias is voorzien van een statisch IP-adres."
} else {
    Write-Output "Hostname is niet gelijk aan DC01. Geen wijzigingen aangebracht."
}


#
#	Thats all Folks
#