# -*- mode: ruby -*-
# vi: set ft=ruby :
#
#
#
#
=begin

Vagrant SLIM Configuratie for Oracle Virtualbox and VMware Workstation/Fusion PRO hypervisors
Vagrant is copyrighted by Hashicorp (www.vagrantup.com)

(C) Copyright 2023,2024 JA Tutert

This configuration may only be used for private use or education use. Business/commercial use is prohibited. 
It is intended for use with virtual machines on a hypervisor and thus not for configuration of bare-metal or cloud machines.

Linux boxes tested with Vagrant version 2.3.7 (and higher) and Vagrant VMware Utility 1.0.22 
Windows boxes only run with Vagrant version 2.4.0 (security error with Vagrant version 2.3.7)

Legenda Boxes:

Linux

Distro
A	=	Alpine
D	=	Debian
U	=	Ubuntu

Distro Versie 
U20-LTS		=	Ubuntu 20.04 LTS
U22-LTS		=	Ubuntu 22.04 LTS
U24-LTS		=	Ubuntu 24.04 LTS

Distro Editie 
D			=	Desktop
S			=	Server

POV		provider	Oracle Virtualbox
BCV		provider	Broadcom (VMWare) Workstation / Fusion PRO
PDR		provider	Docker
PMH		provider	Microsoft Hyper-V

S		Small			2 GB
M		Medium			4 GB
L		Large			8 GB
XL		Extra Large		16 GB

DBMS		=	Database Management System (DBMS)
WSRV		=	Webserver

Windows
W10			=	Windows 10
W11			=	Windows 11
W19			=	Windows Server 2019
W22			=	Windows Server 2022

EDU			=	Education 
EDN			=	Education N
ENT			=	Enterprise
ENN			=	Enterprise N
HME			=	Home
PRO			=	PRO
PED			=	PRO Education

AS	=	Alvistack Box
GC 	= 	Generic Box
GR 	= 	Gusztavvargadr Box
MN 	= 	Maroskukan Box

A	=	Ansible
D	=	Docker-CE en Docker Compose 
K	=	Kubernetes

=end
#
#
# ############################################ [Vullen Variabelen] ##########################################
#
#	Variable versie Vagrantfile 
versie_vagrantfile = "2024-10-18"
#
#
#	Variabele huidige datum
require 'date'
cur_date = Date.today
#
#
#
#
# ############################################ [Weergeven melding] ##########################################
#
puts "Using VAGRANTFILE SLIM version #{versie_vagrantfile} by John Tutert (for private or educational use only!)"
#
# ###########################################################################################################
#
#
# ############################################ [Declaratie Virtuele Machines] ##########################################
#
linux_machines=[
	#
	#	Ubuntu 24.04.x LTS Jammy Jellyfish (release xx xx 2024) (EOS April 2028) (EOL April 20xx) 
	#
	#	Provider VMware
	#
    {
        :hostname => 		"U24-LTS-S-BCV-S-001",
		:weergavenaam => 	"U24-LTS-S-BCV-S-001",
        :box => 			"gusztavvargadr/ubuntu-server-2404-lts",
		:os => 				"ubuntu",
		:osedition => 		"server",
		:osversie => 		2404, 
		:aanbieder => 		"VMware",
        :ram => 			2048,
        :cpu => 			2,
    },
	{
        :hostname => 		"U24-LTS-S-BCV-M-001",
		:weergavenaam => 	"U24-LTS-S-BCV-M-001",
        :box => 			"gusztavvargadr/ubuntu-server-2404-lts",
		:os => 				"ubuntu",
		:osedition => 		"server",
		:osversie => 		2404, 
		:aanbieder => 		"VMware",
        :ram => 			4096,
        :cpu => 			2,
    },	
	{
		:hostname => 		"U24-LTS-S-BCV-L-001",
		:weergavenaam => 	"U24-LTS-S-BCV-L-001",
		:box => 			"gusztavvargadr/ubuntu-server-2404-lts",
		:os => 				"ubuntu",
		:osedition => 		"server",
		:osversie => 		2404, 
		:aanbieder => 		"VMware",
		:ram => 			8192,
		:cpu => 			2,
    },
	{
		:hostname => 		"U24-LTS-S-BCV-XL-001",
		:weergavenaam => 	"U24-LTS-S-BCV-XL-001",
		:box => 			"gusztavvargadr/ubuntu-server-2404-lts",
		:os => 				"ubuntu",
		:osedition => 		"desktop",
		:osversie => 		2404, 
		:aanbieder => 		"VMware",
		:ram => 			16384,
		:cpu => 			2,
	}
	#
]
#
windows_machines=[
	#
	#
	#	################################
	#	Windows 11 Enterprise Evaluation
	#	################################
	#
	#
	#	##############
	#	gusztavvargadr
	#	##############
	#
	#
	{
		:hostname => 		"W11-ENT-D-EVAL-BV1",
		:weergavenaam => 	"W11-ENT-D-EVAL-BV1",
		:box => 			"gusztavvargadr/windows-11",
		:os => 				"windows",
		:osedition => 		"desktop",
		:osversie => 		11, 
		:aanbieder => 		"VMware",
		:ram => 			8192,
		:cpu => 			2,
	},
	#
	#
	#	################################
	#	Windows Server 2022 Standard Evaluation
	#	################################
	#
	#
	#	##############
	#	gusztavvargadr
	#	##############
	#
	#
	{
		:hostname => 		"W22-STD-S-EVAL-BV1",
		:weergavenaam => 	"W22-STD-S-EVAL-BV1",
		:box => 			"gusztavvargadr/windows-server-2022-standard",
		:os => 				"windows",
		:osedition => 		"server",
		:osversie => 		22, 
		:aanbieder => 		"VMware",
		:ram => 			8192,
		:cpu => 			2,
	}
	#
]
#
#
# ############################################ [Declaratie Scripts] ##########################################
#
#
# ############################################################################################################
#
#
# ############################################ [Virtuele Machines] ##########################################
#
#
Vagrant.configure("2") do |config|
	#
	#
	#
	#
	# ############################################ [Oracle / VMware] ##########################################
	#
	#
	#
	#
	#
	# ####################################
	#              UBUNTU LINUX
	# ####################################
	#
	#
	#
	#
	linux_machines.each do |machine|
		config.vm.define machine[:hostname] do |ulxnode|
			#
			ulxnode.vm.box = machine[:box]
			ulxnode.vm.box_check_update = false
			ulxnode.vm.hostname = "#{machine[:hostname].downcase}"
			#
			#
			# ####################################################################	
			#
			#						Virtuele Netwerken 
			#
			# ####################################################################	
			#
			#
			#	Adapter 2 Host-Only | Oracle Virtualbox fixed IP-address
			#
			#
			if machine[:aanbieder] == "Oracle"
				ulxnode.vm.network "private_network", ip: "#{machine[:ip]}", netmask: "255.255.255.0"
			end
			#
			#	Adapter 2 Host-Only | VMware Workstation / Fusion PRO DHCP IP-address
			#
			if machine[:aanbieder] == "VMware"
				ulxnode.vm.network "private_network", type: "dhcp"
				# NIET private network met ip e.d. gebruiken. Dan start VM niet meer op ! 
			end
			#
			#
			# 	Adapter 3 Bridged
			# 	ulxnode.vm.network "public_network", bridge: "VMware Virtual Ethernet Adapter for VMnet8"
			# 	ulxnode.vm.network "public_network", bridge: "Ethernet"
			#
			#	Port Forwarding
			# 
			#	ulxnode.vm.network :forwarded_port, guest: 80, host: 80, auto_correct: true, id: "webserver".
			#
			# ####################################################################
			#
			#						SYNCED FOLDERS
			#
			# ####################################################################
			#
			#
			#	Staat uit om opstarttijd te besparen
			#
			#	if #{ENV['OS']} == "Windows_NT" 
					#
					#	Algemeen
					#
					#	ulxnode.vm.synced_folder "#{ENV['USERPROFILE']}",            "/home/#{ENV['USERNAME']}/userprofile"
					#	ulxnode.vm.synced_folder "#{ENV['USERPROFILE']}//Downloads", "/home/#{ENV['USERNAME']}/downloads"
					#	ulxnode.vm.synced_folder "#{ENV['USERPROFILE']}//Documents", "/home/#{ENV['USERNAME']}/documents"
					#	ulxnode.vm.synced_folder "#{ENV['TMP']}",                    "/home/#{ENV['USERNAME']}/tmp"
					#	ulxnode.vm.synced_folder "#{ENV['PUBLIC']}",                 "/home/#{ENV['USERNAME']}/public"
					# 
					#	OneDrive
					#
					# 	demo_node.vm.synced_folder "#{ENV['OneDriveCommercial']}",     "/home/#{ENV['USERNAME']}/OneDriveCommercial"
					# 	demo_node.vm.synced_folder "#{ENV['OneDriveConsumer']}",       "/home/#{ENV['USERNAME']}/OneDriveConsumer"
			#	end 
			#
			#
			# ####################################################################
			#
			#						POST UP MESSAGE
			#
			# ####################################################################
			#
			ulxnode.vm.post_up_message = "// ETH0 is NAT // ETH1 is Host-Only // Verdere config in /home/vagrant/netplan"
			#
			# ####################################################################
			#
			#						PROVIDERS
			#
			# ####################################################################
			#
			#	[P1] 	PROVIDER: ORACLE VIRTUALBOX
			#
			if machine[:aanbieder] == "Oracle"
				ulxnode.vm.provider "virtualbox" do |ulxnode_pvd_ovbvm|
					#
					ulxnode_pvd_ovbvm.gui = true
					ulxnode_pvd_ovbvm.linked_clone = false
					#
					ulxnode_pvd_ovbvm.cpus = "#{machine[:cpu]}"
					ulxnode_pvd_ovbvm.memory = "#{machine[:ram]}"
					ulxnode_pvd_ovbvm.name = "#{machine[:hostname]}"
					#
					ulxnode_pvd_ovbvm.customize ["modifyvm", :id, "--vram", "128"]
					ulxnode_pvd_ovbvm.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
					ulxnode_pvd_ovbvm.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
					ulxnode_pvd_ovbvm.customize ["modifyvm", :id, "--description", "#{machine[:os]} #{machine[:osversie]} \r\n Used box is #{machine[:box]} \r\n Created on #{cur_date} by Vagrant \r\n Username/Password = vagrant \r\n Use VAGRANT up #{machine[:hostname]} to boot this virtual machine"]
					#
				end
			end	
			#
			#	[P2] 	PROVIDER: VMware Workstation / Fusion PRO
			#
			if machine[:aanbieder] == "VMware"
				ulxnode.vm.provider "vmware_desktop" do |ulxnode_pvd_vmwvm|
					#
					ulxnode_pvd_vmwvm.gui = true
					ulxnode_pvd_vmwvm.linked_clone = false
					#
					ulxnode_pvd_vmwvm.cpus = "#{machine[:cpu]}"
					ulxnode_pvd_vmwvm.memory = "#{machine[:ram]}"
					# vmwvm.nat_device 	= "VMnet8"
					#
					# Aanpassen VMware Workstation/Fusion Pro VMX 
					#
					ulxnode_pvd_vmwvm.vmx["tools.syncTime"]	= "TRUE"
					ulxnode_pvd_vmwvm.vmx["displayName"]	= "#{machine[:hostname]}"
					ulxnode_pvd_vmwvm.vmx["annotation"]		= "#{machine[:os]} #{machine[:osversie]} |0D|0AUsed box is #{machine[:box]} |0D|0ACreated on #{cur_date} by Vagrant |0D|0AUsername/Password = vagrant |0D|0AUse VAGRANT up #{machine[:hostname]} to boot this virtual machine"
					#
				end
			end	
			#
			#
			# #############################################################
			#
			#						Provision
			#
			#						Aanpassen DNS-Settings ivm EduRoam
			#
			# #############################################################
			#
			#
			#
			#
			if machine[:os] == "ubuntu" 
			#
			#
				if machine[:oseditie] == 2204
					#
					#
					ulxnode.vm.provision "shell", inline: <<-SHELL
						#	AANPASSEN /etc/netplan/01-netcfg.yaml naar de juiste settings IVM EduROAM
						#
						#
						#	DNS Server 1 aanpassen naar ns1.saxion.nl
						sed "s@4.2.2.1@145.76.2.75@" -i /etc/netplan/01-netcfg.yaml
						#
						#	DNS Server 2 aanpassen naar ns2.saxion.nl
						sed "s@4.2.2.2@145.76.2.85@" -i /etc/netplan/01-netcfg.yaml
						#
						# 	Overige DNS servers toevoegen (o.a. d-hk-mer-ib02.infra.saxion.net = 145.2.14.10) 
						#	sed "s@208.67.220.220@145.2.14.10@" -i /etc/netplan/01-netcfg.yaml
						sed "s@208.67.220.220@145.2.14.10, 8.8.8.8, 8.8.4.4@" -i /etc/netplan/01-netcfg.yaml
						#
						#	Doorvoeren van wijzigingen 
						netplan apply 
					SHELL
				end
				#
				#
				if machine[:oseditie] == 2404
					#
					#
					ulxnode.vm.provision "shell", inline: <<-SHELL
						#
						#
						#
						#
					SHELL
				end
				#
			end
			#
			#
			#
			#
			# #############################################################
			#
			#						Provision
			#
			#						UBUNTU CONFIG SCRIPTS (GITHUB)
			#
			# #############################################################
			#
			ulxnode.vm.provision "shell", inline: <<-SHELL
				#	Versie 3 (status ontwikkeling)
				sudo curl -s -o /home/vagrant/ubuntu-config-V3-latest.sh https://raw.githubusercontent.com/jatutert/Ubuntu-Config/main/ubuntu-config-V3-latest.sh				
				sudo chmod +x /home/vagrant/ubuntu-config-V3-latest.sh
				#
			SHELL
		#
		end
	end
	#
	#
	#
	#
	# #########################################
	# ###             Windows               ###
	# #########################################
	# 
	#
	#
	#
	windows_machines.each do |machine|
		config.vm.define machine[:hostname] do |winnode|
			#
			winnode.vm.box 				= 	machine[:box]
			winnode.vm.box_check_update = 	false
			#
			winnode.vm.hostname 		= 	"Vagrant-#{machine[:hostname]}"
			winnode.vm.guest 			= 	:windows
			winnode.winssh.shell 		= 	"powershell" 		# The shell to use when executing SSH commands from Vagrant. By default this is powershell. Valid values are "cmd" or "powershell".		
			#
			# ####################################################################	
			#
			#	Network
			#
			#	Adapters
			#
			#	Adapter 2 Host-Only	
			winnode.vm.network "private_network", type: "dhcp"
			#	node.vm.network "private_network", ip: "192.168.56.220", netmask: "255.255.255.0"
			#
			# 	Adapter 3 Bridged
			# 	node.vm.network "public_network", bridge: "VMware Virtual Ethernet Adapter for VMnet8"
			# 	node.vm.network "public_network", bridge: "Ethernet"
			#
			#	Port-Forwarding
			#
			#	Remote Desktop Protocol (RDP) 	[uitgezet 18 augustus 2024]
			#	winnode.vm.network :forwarded_port, guest: 3389, host: 53389, auto_correct: true
			#
			#	Naslag
			# 	node.vm.network "forwarded_port", guest: 3389, host: 3389, id: "rdp", auto_correct: true  [automatisch aan]
			# 	node.vm.network "forwarded_port", guest: 5985, host: 5985, id: "winrm", auto_correct: true [automatisch aan]
			#
			# ####################################################################
			#
			#
			# ####################################################################	
			#	WinRM
			#
			winnode.vm.communicator 	= 	"winrm" 		# standaard is ssh windows moet naar winrm
			#
			#
			# ####################################################################	
			#
			#
			winnode.vm.post_up_message = "Start scripts in /home/vagrant voor verdere configuratie"
			#	
			#
			#	Oracle Virtualbox
			#
			#
			if machine[:aanbieder] == "Oracle"
				#
				# https://developer.hashicorp.com/vagrant/docs/providers/virtualbox
				#
				winnode.vm.provider "virtualbox" do |win_node_ovbvm|
					#
					win_node_ovbvm.gui 				= 	true
					win_node_ovbvm.linked_clone 	= 	false
					#
					win_node_ovbvm.cpus 			= 	"#{machine[:cpu]}"
					win_node_ovbvm.memory 			= 	"#{machine[:ram]}"
					win_node_ovbvm.name 			= 	"Vagrant-#{machine[:hostname]}"
					#
					win_node_ovbvm.customize ["modifyvm", :id, "--vram", "128"]
					win_node_ovbvm.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
					win_node_ovbvm.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
					win_node_ovbvm.customize ["modifyvm", :id, "--description", "Ubuntu 22.04 LTS Gebruiker en Password: vagrant"] 
					#
				end
			end	
			#
			#
			#	VMware Workstation / Fusion PRO
			#
			#
			if machine[:aanbieder] == "VMware"
				#
				# https://developer.hashicorp.com/vagrant/docs/providers/vmware
				#			
				winnode.vm.provider "vmware_desktop" do |win_node_vmwvm|
					#
					win_node_vmwvm.gui 						= 	true
					win_node_vmwvm.linked_clone				= 	false
					#
					win_node_vmwvm.cpus 					= 	"#{machine[:cpu]}"
					win_node_vmwvm.memory 					= 	"#{machine[:ram]}"
					# vmwvm.nat_device 	= "VMnet8"
					#
					win_node_vmwvm.vmx["tools.syncTime"]	= 	"TRUE"
					win_node_vmwvm.vmx["displayName"] 		= 	"#{machine[:weergavenaam]}"
					win_node_vmwvm.vmx["annotation"] 		= 	"#{machine[:os]} #{machine[:osversie]} |0D|0AUsed box is #{machine[:box]} |0D|0ACreated on #{cur_date} by Vagrant |0D|0AUsername/Password = vagrant |0D|0AUse VAGRANT up #{machine[:hostname]} to boot this virtual machine"
				end
			end	
			#
			#	Windows Desktop initialisatie
			#
			if machine[:os] == "windows" && machine[:osedition] == "desktop"
				#	Installatie WinGET
				winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/jatutert/Windows-Config/main/Powershell/asheroto-412-winget-install.ps1"
				#	Stoppen en disabelen services
				winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/jatutert/Windows-Config/main/Powershell/VM-OOBE-Config-Services-V002.ps1"
			end
			#
			#	Windows Server initialisatie
			#
			if machine[:os] == "windows" && machine[:osedition] == "server"
				#	Installatie WinGET
				winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/jatutert/Windows-Config/main/Powershell/asheroto-412-winget-install.ps1"
				#	Stoppen en disabelen services
				winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/jatutert/Windows-Config/main/Powershell/VM-OOBE-Config-Services-V002.ps1"
			end
			#
			winnode.vm.provision "shell", privileged: "true", inline: <<-SHELL
				#
				#
				#
				#
			SHELL
		end
	end
	#
	#
	#
	#
	#
	# ############################################ [VMware Workstation/Fusion PRO] ##########################################
	#
	#
	#
	#	Geen specifieke boxes aanwezig
	#
	#
	#
	# 
	# ############################################ [Oracle Virtualbox] ######################################################
	#
	#
	#
	#	Geen specifieke boxes aanwezig
	#
	#
	#
	# 
	# ############################################ [Einde Boxes] ######################################################	
	#
	#
end