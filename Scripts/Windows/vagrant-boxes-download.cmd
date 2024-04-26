::
::
::	Vagrant BOXES download script
:: 
:: 	Version 1
::
:: 	APRIL 2024
::
::	John Tutert
::
::	For Personal or Educational Use ONLY !
::
:: 
::
::	################################### ALPINE ##############################################
::
::
:: 	Alpine 3.19
::
:: 	generic/alpine319
:: 
:: vagrant box add generic/alpine319 --clean --provider vmware_desktop
vagrant box add generic/alpine319 --clean --provider virtualbox
::
::
::
::	################################ Ubuntu LTS Versions ####################################
::
::
:: 	Ubuntu 24.04 LTS
:: 
::	generic/ubuntu2004
::	EOS:	April 2025
::	EOL:	April 2030
:: 	providers: vmware virtualbox hyper-v
::
::	Nog niet beschikbaar
:: 	Release 26 april 2024
::
:: vagrant box add generic/ubuntu2404 --clean --provider vmware_desktop
:: vagrant box add generic/ubuntu2404 --clean --provider virtualbox
::
::
::	Ubuntu 22.04 LTS
:: 
::	generic/ubuntu2204
::	EOS: April 2027
:: 	EOL: April 2032
:: 	providers: vmware virtualbox hyper-v
:: 
vagrant box add generic/ubuntu2204 --clean --provider vmware_desktop
vagrant box add generic/ubuntu2204 --clean --provider virtualbox
::
:: roboxes-x64/ubuntu2204
:: providers: vmware virtualbox hyper-v
::
:: vagrant box add roboxes-x64/ubuntu2204 --clean --provider vmware_desktop
::
::	alvistack/ubuntu-22.04
::	Ansible
::	providers: virtualbox
::
:: vagrant box add alvistack/ubuntu-22.04 --clean --provider virtualbox
::
::
:: 	Ubuntu 20.04 LTS
:: 
::	generic/ubuntu2004
::	EOS:	April 2025
::	EOL:	April 2030
:: 	providers: vmware virtualbox hyper-v
::
:: vagrant box add generic/ubuntu2004 --clean --provider vmware_desktop
:: vagrant box add generic/ubuntu2004 --provider virtualbox
::
::	gusztavvargadr/ubuntu-server
::	EOS:	April 2025
::	EOL:	April 2030
:: 	providers: vmware virtualbox hyper-v
:: 
:: vagrant box add gusztavvargadr/ubuntu-server --clean --provider vmware_desktop
:: vagrant box add gusztavvargadr/ubuntu-server --clean --provider virtualbox
:: 
::
::	################################ Ubuntu NON-LTS Versions ####################################
::
::
::	Ubuntu 23.04
::	maroskukan/ubuntu2304
::	providers: vmware virtualbox 
::
:: 	vagrant box add maroskukan/ubuntu2304 --provider vmware_desktop
:: 	vagrant box add maroskukan/ubuntu2304 --provider virtualbox
::
:: 
::	Ubuntu 22.10
::	generic/ubuntu2210
::	EOS/EOL:	January 2024
::	providers: vmware virtualbox hyper-v
::
:: vagrant box add generic/ubuntu2210 --provider vmware_desktop
:: vagrant box add generic/ubuntu2210 --provider virtualbox
::
::
::	Ubuntu 22.10
::	alvistack/kubernetes-1.28
::	providers: virtualbox
::
:: vagrant box add alvistack/kubernetes-1.28 --clean --provider virtualbox
::
