::
::
::	VAGRANT 
::
::	BOXES Initialisatie
::
::	Versie 4
::	2025
::
::	Auteur: John Tutert
::
::
::
@echo off
@cls
::	::::	Opschonen	::::
::
::	Linux
::
@vagrant box remove generic/alpine319 --all --all-providers
@vagrant box remove generic/ubuntu2004 --all --all-providers
@vagrant box remove generic/ubuntu2204 --all --all-providers
@vagrant box remove gusztavvargadr/ubuntu-server-2404-lts --all --all-providers
::
::	Windows Client
::
@vagrant box remove gusztavvargadr/windows-10 --all --all-providers
@vagrant box remove gusztavvargadr/windows-11 --all --all-providers
::
::	Windows Server
::
@vagrant box remove gusztavvargadr/windows-server-2022-standard --all --all-providers
::
::
::	::::	TOEVOEGEN	::::
::
::	LINUX
::
::	vagrant box add generic/alpine319 --clean --provider virtualbox
::	vagrant box add generic/alpine319 --clean --provider vmware_desktop
::
::	vagrant box add generic/debian12 --clean --provider virtualbox
::	vagrant box add generic/debian12 --clean --provider vmware_desktop
::
::	vagrant box add generic/ubuntu2204 --clean --provider vmware_desktop
::	vagrant box add generic/ubuntu2204 --clean --provider virtualbox
::
::	1,3 GB
::	vagrant box add gusztavvargadr/ubuntu-server-2404-lts --clean --provider virtualbox
::	3,6 GB
::	vagrant box add gusztavvargadr/ubuntu-server-2404-lts --clean --provider vmware_desktop
::
::	WINDOWS CLIENT
::
:: vagrant box add gusztavvargadr/windows-10 --clean --provider virtualbox 
@vagrant box add gusztavvargadr/windows-10 --clean --provider vmware_desktop
:: 
::	vagrant box add gusztavvargadr/windows-11 --clean --provider virtualbox
@vagrant box add gusztavvargadr/windows-11 --clean --provider vmware_desktop
::
::	WINDOWS SERVER 
::
::	14 GB
:: vagrant box add gusztavvargadr/windows-server-2022-standard --clean --provider virtualbox 
@vagrant box add gusztavvargadr/windows-server-2022-standard --clean --provider vmware_desktop
::
:: 
::	Thats all folks
::