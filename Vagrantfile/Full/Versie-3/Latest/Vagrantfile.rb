# -*- mode: ruby -*-
# vi: set ft=ruby :
#
#
#
#
=begin

Vagrant Configuratie for Oracle Virtualbox and VMware Workstation/Fusion PRO hypervisors
Vagrant is copyrighted by Hashicorp (www.vagrantup.com)

(C) Copyright 2023/2024/2025 JA Tutert

This configuration may only be used for private use or education use. Business/commercial use is prohibited. 
It is intended for use with virtual machines on a hypervisor and thus not for configuration of bare-metal or cloud machines.

Linux boxes tested with Vagrant version 2.3.7 (and higher) and Vagrant VMware Utility 1.0.22 
Windows boxes only run with Vagrant version 2.4.0 (security error with Vagrant version 2.3.7)

Legenda Boxes:

Linux
=============================================================

ALPINE
A19
A22

Debian
D19

Ubuntu
U20			=	Ubuntu 20.04.x LTS
U22			=	Ubuntu 22.04.x LTS
U24			=	Ubuntu 24.04.x LTS

Non-LTS		=	10
LTS			=	LTS

D			=	Desktop
S			=	Server

H		provider	Microsoft Hyper-V
D		provider	Docker
O		provider	Oracle Virtualbox
B		provider	VMWare Workstation / Fusion PRO

AS	=	Alvistack Box
GC 	= 	Generic Box
GR 	= 	Gusztavvargadr Box
MN 	= 	Maroskukan Box

DBMS		=	Database Management System (DBMS)
WSRV		=	Webserver

Windows
==============================================================

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

D			=	Desktop
S			=	Server

H		provider	Microsoft Hyper-V
D		provider	Docker
O		provider	Oracle Virtualbox
B		provider	VMWare Workstation / Fusion PRO

AS	=	Alvistack Box
GC 	= 	Generic Box
GR 	= 	Gusztavvargadr Box
MN 	= 	Maroskukan Box

S		Small			2 GB
M		Medium			4 GB
L		Large			8 GB
XL		Extra Large		16 GB

A	=	Ansible
D	=	Docker-CE en Docker Compose 
K	=	Kubernetes

=end
#
#
=begin

Changelog
08/05/2025		Nieuwe structuur Vagrantfile
10/05/2025		Nieuwe naamstructuur Variabelen + Netwerkconfigurie Netwerkkaart 2 van DC en DB Powershell

=end
#
#
# ############################################ [Vullen Variabelen] ##########################################
#
#	Variable versie Vagrantfile 
VersieVagrantfile = "19-05-2025"
#
#	Variable auteur Vagrantfile 
AuteurVagrantfile = "John Tutert"
#
#	Variabele huidige datum
require 'date'
cur_date = Date.today
#
#
#	In C:\Program Files\Vagrant\embedded\mingw64\bin>
#	gem.cmd
# 
#	gem install sys 
#
#
#	require 'sys'
#	total_memory = Sys::Memory.total
#
#
#
#
# ############################################ [Weergeven melding] ##########################################
#
puts "Using VAGRANTFILE version #{VersieVagrantfile} by #{AuteurVagrantfile} (for private or educational use only!)"
#
#
#	#############################################################################################
#	Declaratie Virtuele Machines
#	#############################################################################################
#
#
#	############################################
#	Linux Virtuele Machines
#	############################################
#
#
linux_machines=[
	#
	#
	#	############################################
	#	Algemene Linux Virtuele Machines
	#	############################################
	#
	#
	#	############################################
	#	Provider Oracle 
	#	############################################
	#
	# 
	#	########################################################################################
	#	Ubuntu 24.04.x LTS Jammy Jellyfish (release xx xx 2024) (EOS April 2028) (EOL April 20xx) 
	#	########################################################################################
	#
	#
	{
		:HostNameVM => "U24-LTS-S-B-GR-S001",
		:DisplayName => "U24-LTS-S-B-GR-S001",
		:VagrantBoxName => "gusztavvargadr/ubuntu-server-2404-lts",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 2404, 
		:HypervisorVM => "Oracle",
		:MemoryVM => 2048,
		:CPUCoresVM => 2,
	},
	{
		:HostNameVM => "U24-LTS-S-B-GR-M001",
		:DisplayName => "U24-LTS-S-B-BR-M001",
		:VagrantBoxName => "gusztavvargadr/ubuntu-server-2404-lts",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 2404, 
		:HypervisorVM => "Oracle",
		:MemoryVM => 4096,
		:CPUCoresVM => 2,
	},
	{
		:HostNameVM => "U24-LTS-S-B-GR-L001",
		:DisplayName => "U24-LTS-S-B-GR-L001",
		:VagrantBoxName => "gusztavvargadr/ubuntu-server-2404-lts",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 2404, 
		:HypervisorVM => "Oracle",
		:MemoryVM => 8192,
		:CPUCoresVM => 2,
	},
	{
		:HostNameVM => "U24-LTS-S-B-GR-XL01",
		:DisplayName => "U24-LTS-S-B-GR-XL01",
		:VagrantBoxName => "gusztavvargadr/ubuntu-server-2404-lts",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "desktop",
		:VagrantBoxNameOSVersion => 2404, 
		:HypervisorVM => "Oracle",
		:MemoryVM => 16384,
		:CPUCoresVM => 2,
	},
	#
	#
	#	############################################
	#	Provider Broadcom/VMWare
	#	############################################
	#
	#
	#	########################################################################################
	#	Ubuntu 20.04.x LTS Focal Fossa (release 23 april 2020) (EOS April 2025) (EOL April 2030)
	#	########################################################################################
	#
	#
	{
		:HostNameVM => "U20-LTS-S-B-GC-S001",
		:DisplayName =>	"U20-LTS-S-B-GC-S001",
		:VagrantBoxName => "generic/ubuntu2004",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 2004, 
		:HypervisorVM => "VMware",
		:MemoryVM => 2048,
		:CPUCoresVM => 2,
	},
	{
		:HostNameVM => "U20-LTS-S-B-GC-M001",
		:DisplayName =>	"U20-LTS-S-B-GC-M001",
		:VagrantBoxName => "generic/ubuntu2004",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 2004, 
		:HypervisorVM => "VMware",
		:MemoryVM => 4096,
		:CPUCoresVM => 2,
	},
	{
		:HostNameVM => "U20-LTS-S-B-GC-L001",
		:DisplayName =>	"U20-LTS-S-B-GC-L001",
		:VagrantBoxName => "generic/ubuntu2004",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 2004, 
		:HypervisorVM => "VMware",
		:MemoryVM => 8192,
		:CPUCoresVM => 2,
	},
	{
		:HostNameVM => "U20-LTS-S-B-GC-XL01",
		:DisplayName =>	"U20-LTS-S-B-GC-XL01",
		:VagrantBoxName => "generic/ubuntu2004",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 2004, 
		:HypervisorVM => "VMware",
		:MemoryVM => 16384,
		:CPUCoresVM => 2,
	},
	#
	#
	#	########################################################################################
	#	Ubuntu 22.04.x LTS Jammy Jellyfish (release 23 februari 2023) (EOS April 2027) (EOL April 2032)
	#	########################################################################################
	#
	#
	{
		:HostNameVM => "U22-LTS-S-B-GC-S001",
		:DisplayName =>	"U22-LTS-S-B-GC-S001",
		:VagrantBoxName => "generic/ubuntu2204",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 2204, 
		:HypervisorVM => "VMware",
		:MemoryVM => 2048,
		:CPUCoresVM => 2,
	},
	{
		:HostNameVM => "U22-LTS-S-B-GC-M001",
		:DisplayName =>	"U22-LTS-S-B-GC-M001",
		:VagrantBoxName => "generic/ubuntu2204",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 2204, 
		:HypervisorVM => "VMware",
		:MemoryVM => 4096,
		:CPUCoresVM => 2,
	},	
	{
		:HostNameVM => "U22-LTS-S-B-GC-L001",
		:DisplayName =>	"U22-LTS-S-B-GC-L001",
		:VagrantBoxName => "generic/ubuntu2204",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 2204, 
		:HypervisorVM => "VMware",
		:MemoryVM => 8192,
		:CPUCoresVM => 2,
	},
	{
		:HostNameVM => "U22-LTS-S-B-GC-XL01",
		:DisplayName =>	"U22-LTS-S-B-GC-XL01",
		:VagrantBoxName => "generic/ubuntu2204",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "desktop",
		:VagrantBoxNameOSVersion => 2204, 
		:HypervisorVM => "VMware",
		:MemoryVM => 16384,
		:CPUCoresVM => 2,
	},
	#
	#
	#	########################################################################################
	#	Ubuntu 24.04.x LTS Jammy Jellyfish (release xx xx 2024) (EOS April 2028) (EOL April 20xx) 
	#	########################################################################################
	#
	#
	{
		:HostNameVM => "U24-LTS-S-B-GR-S001",
		:DisplayName => "U24-LTS-S-B-GR-S001",
		:VagrantBoxName => "gusztavvargadr/ubuntu-server-2404-lts",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 2404, 
		:HypervisorVM => "VMware",
		:MemoryVM => 2048,
		:CPUCoresVM => 2,
	},
	{
		:HostNameVM => "U24-LTS-S-B-GR-M001",
		:DisplayName => "U24-LTS-S-B-BR-M001",
		:VagrantBoxName => "gusztavvargadr/ubuntu-server-2404-lts",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 2404, 
		:HypervisorVM => "VMware",
		:MemoryVM => 4096,
		:CPUCoresVM => 2,
	},
	{
		:HostNameVM => "U24-LTS-S-B-GR-L001",
		:DisplayName => "U24-LTS-S-B-GR-L001",
		:VagrantBoxName => "gusztavvargadr/ubuntu-server-2404-lts",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 2404, 
		:HypervisorVM => "VMware",
		:MemoryVM => 8192,
		:CPUCoresVM => 2,
	},
	{
		:HostNameVM => "U24-LTS-S-B-GR-XL01",
		:DisplayName => "U24-LTS-S-B-GR-XL01",
		:VagrantBoxName => "gusztavvargadr/ubuntu-server-2404-lts",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "desktop",
		:VagrantBoxNameOSVersion => 2404, 
		:HypervisorVM => "VMware",
		:MemoryVM => 16384,
		:CPUCoresVM => 2,
	},
	#
	#
	#	############################################
	#	Demo Linux Virtuele Machines
	#	############################################
	#
	#
	#	############################################
	#	Provider Oracle 
	#	############################################
	#
	#
	#	Geen Virtuele Machines
	#
	#
	#	############################################
	#	Provider Broadcom/VMWare
	#	############################################
	#
	#
	#	########################################################################################
	#	Ubuntu 22.04.x LTS Jammy Jellyfish (release 23 februari 2023) (EOS April 2027) (EOL April 2032)
	#	########################################################################################
	#
	#
	#	############################################
	#	Docker Demo 
	#	############################################
	#
	#
	{
		:HostNameVM => "U22-LTS-S-B-GC-LDD1",
		:DisplayName =>	"U22-LTS-S-B-GC-LDD1",
		:VagrantBoxName => "generic/ubuntu2204",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 2204, 
		:HypervisorVM => "VMware",
		:MemoryVM => 8192,
		:CPUCoresVM => 2,
    },
	#
	#
	#	############################################
	#	Kubernetes / K8S / Minikube demo
	#	############################################
	#
	#
	{
		:HostNameVM => "U22-LTS-S-B-GC-XLK1",
		:DisplayName => "U22-LTS-S-B-GC-XLK1",
		:VagrantBoxName => "generic/ubuntu2204",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 2204, 
		:HypervisorVM => "VMware",
		:MemoryVM => 16384,
		:CPUCoresVM => 2,
    },
	#
	#
	#	############################################
	#	Ansible demo
	#	############################################
	#
	#
	#	Controller 001
	#
	#
	{
		:HostNameVM => "U22-LTS-S-B-GC-LAC1",
		:DisplayName =>	"U22-LTS-S-B-GC-LAC1",
		:VagrantBoxName => "generic/ubuntu2204",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "desktop",
		:VagrantBoxNameOSVersion => 2204, 
		:HypervisorVM => "VMware",
		:MemoryVM => 8192,
		:CPUCoresVM => 2,
	},
	#
	#
	#	Slave #1 (010)
	#
	#
	{
		:HostNameVM => "U22-LTS-S-B-GC-LAS1",
		:DisplayName =>	"U22-LTS-S-B-GC-LAS1",
		:VagrantBoxName => "generic/ubuntu2204",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "desktop",
		:VagrantBoxNameOSVersion => 2204, 
		:HypervisorVM => "VMware",
		:MemoryVM => 8192,
		:CPUCoresVM => 2,
    },
	#
	#
	#	Slave #2 (011) 
	#
	#
	{
		:HostNameVM => "U22-LTS-S-B-GC-LAS2",
		:DisplayName =>	"U22-LTS-S-B-GC-LAS2",
		:VagrantBoxName => "generic/ubuntu2204",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "desktop",
		:VagrantBoxNameOSVersion => 2204, 
		:HypervisorVM => "VMware",
		:MemoryVM => 8192,
		:CPUCoresVM => 2,
    },	
	#
	#
	#	########################################################################################
	#	Ubuntu 24.04.x LTS Jammy Jellyfish (release xx xx 2024) (EOS April 2028) (EOL April 20xx) 
	#	########################################################################################
	#
	#
	#	############################################
	#	Docker Demo 
	#	############################################
	#
	#
	{
		:HostNameVM => "U24-LTS-S-B-GR-LDD1",
		:DisplayName => "U24-LTS-S-B-GR-LDD1",
		:VagrantBoxName => "gusztavvargadr/ubuntu-server-2404-lts",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 2404, 
		:HypervisorVM => "VMware",
		:MemoryVM => 8192,
		:CPUCoresVM => 2,
	},
	#
	#
	#	############################################
	#	Kubernetes / K8S / Minikube demo
	#	############################################
	#
	#
	{
		:HostNameVM => "U24-LTS-S-B-GR-LMD1",
		:DisplayName => "U24-LTS-S-B-GR-LMD1",
		:VagrantBoxName => "gusztavvargadr/ubuntu-server-2404-lts",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 2404, 
		:HypervisorVM => "VMware",
		:MemoryVM => 8192,
		:CPUCoresVM => 2,
	},
	#
	#
	#	############################################
	#	Ansible demo
	#	############################################
	#
	#
	#	Controller 001
	#
	#
	{
		:HostNameVM => "U24-LTS-S-B-GR-LAC1",
		:DisplayName => "U24-LTS-S-B-GR-LAC1",
		:VagrantBoxName => "gusztavvargadr/ubuntu-server-2404-lts",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 2404, 
		:HypervisorVM => "VMware",
		:MemoryVM => 8192,
		:CPUCoresVM => 2,
	},
	#
	#
	#	Slave #1 (010)
	#
	#
	{
		:HostNameVM => "U24-LTS-S-B-GR-LAS1",
		:DisplayName => "U24-LTS-S-B-GR-LAS1",
		:VagrantBoxName => "gusztavvargadr/ubuntu-server-2404-lts",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 2404, 
		:HypervisorVM => "VMware",
		:MemoryVM => 8192,
		:CPUCoresVM => 2,
	},
	#
	#
	#	Slave #2 (011)
	#
	#
	{
		:HostNameVM => "U24-LTS-S-B-GR-LAS2",
		:DisplayName => "U24-LTS-S-B-GR-LAS2",
		:VagrantBoxName => "gusztavvargadr/ubuntu-server-2404-lts",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 2404, 
		:HypervisorVM => "VMware",
		:MemoryVM => 8192,
		:CPUCoresVM => 2,
	},
	#
	#
	#	############################################
	#	Onderwijs Linux Virtuele Machines
	#	############################################
	#
	#
	#	############################################
	#	Provider Oracle 
	#	############################################
	#
	#
	#	Geen virtuele machines
	#
	#
	#	############################################
	#	Provider Broadcom/VMWare
	#	############################################
	#
	#
	#	########################################################################################
	#	Ubuntu 22.04.x LTS Jammy Jellyfish (release 23 februari 2023) (EOS April 2027) (EOL April 2032)
	#	########################################################################################
	#
	#
	#	Geen virtuele machines
	#
	#
	#	########################################################################################
	#	Ubuntu 24.04.x LTS Jammy Jellyfish (release xx xx 2024) (EOS April 2028) (EOL April 20xx) 
	#	########################################################################################
	#
	#
	#	############################################
	#	Jaar 1
	#	############################################
	#
	#
	#	############################################
	#	Introductie Infrastructuren 
	#	############################################
	#
	#
	#	Database Management Systeem (DBMS)
	#
	#
	{
		:HostNameVM => "U24-LTS-S-B-GR-SD01",
		:DisplayName => "U24-LTS-S-B-GR-SD01",
		:VagrantBoxName => "gusztavvargadr/ubuntu-server-2404-lts",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 2404, 
		:HypervisorVM => "VMware",
		:MemoryVM => 2048,
		:CPUCoresVM => 2,
	},
	{
		:HostNameVM => "U24-LTS-S-B-GR-LD01",
		:DisplayName => "U24-LTS-S-B-GR-LD01",
		:VagrantBoxName => "gusztavvargadr/ubuntu-server-2404-lts",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 2404, 
		:HypervisorVM => "VMware",
		:MemoryVM => 4096,
		:CPUCoresVM => 2,
	},
	{
		:HostNameVM => "U24-LTS-S-B-GR-XLD1",
		:DisplayName => "U24-LTS-S-B-GR-XLD1",
		:VagrantBoxName => "gusztavvargadr/ubuntu-server-2404-lts",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 2404, 
		:HypervisorVM => "VMware",
		:MemoryVM => 8192,
		:CPUCoresVM => 2,
	},
	#
	#
	#	WEBServer
	#
	#
	{
		:HostNameVM => "U24-LTS-S-B-GR-SWS1",
		:DisplayName => "U24-LTS-S-B-GR-SWS1",
		:VagrantBoxName => "gusztavvargadr/ubuntu-server-2404-lts",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 2404, 
		:HypervisorVM => "VMware",
		:MemoryVM => 2048,
		:CPUCoresVM => 2,
	},
	{
		:HostNameVM => "U24-LTS-S-B-GR-LWS1",
		:DisplayName => "U24-LTS-S-B-GR-LWS1",
		:VagrantBoxName => "gusztavvargadr/ubuntu-server-2404-lts",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 2404, 
		:HypervisorVM => "VMware",
		:MemoryVM => 4096,
		:CPUCoresVM => 2,
	},
	{
		:HostNameVM => "U24-LTS-S-B-GR-XLW1",
		:DisplayName => "U24-LTS-S-B-GR-XLW1",
		:VagrantBoxName => "gusztavvargadr/ubuntu-server-2404-lts",
		:VagrantBoxNameOSType => "ubuntu",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 2404, 
		:HypervisorVM => "VMware",
		:MemoryVM => 8192,
		:CPUCoresVM => 2,
	}
	#
	#
	#
	#
]
#
#
#	############################################
#	Windows Virtuele Machines
#	############################################
#
#
windows_machines=[
	#
	#
	#	############################################
	#	Algemene Windows Virtuele Machines
	#	############################################
	#
	#
	#	############################################
	#	############################################
	#			Provider Oracle 
	#	############################################
	#	############################################
	#
	#
	#		#####
	#	##############
	#	gusztavvargadr
	#	##############
	#		#####
	#
	#
	#	################################
	#	Windows 10
	#	################################
	#
	#
	#	################################
	#	Windows 10 Enterprise (Evaluation)
	#	################################ 
	#
	#
	{
		:HostNameVM => "W10-ENT-D-EVAL-VB1",
		:DisplayName => "W10-ENT-D-EVAL-VB1",
		:VagrantBoxName => "gusztavvargadr/windows-10",
		:VagrantBoxNameOSType => "windows",
		:VagrantBoxNameOSEdition => "desktop",
		:VagrantBoxNameOSVersion => 10, 
		:HypervisorVM => "Oracle",
		:MemoryVM => 8192,
		:CPUCoresVM =>	2,
	},
	#
	#
	#	################################
	#	Windows 11
	#	################################
	#
	#
	#	################################
	#	Windows 11 Enterprise (Evaluation)
	#	################################ 
	#
	#
	{
		:HostNameVM => "W11-ENT-D-EVAL-VB1",
		:DisplayName => "W11-ENT-D-EVAL-VB1",
		:VagrantBoxName => "gusztavvargadr/windows-11",
		:VagrantBoxNameOSType => "windows",
		:VagrantBoxNameOSEdition => "desktop",
		:VagrantBoxNameOSVersion => 11, 
		:HypervisorVM => "Oracle",
		:MemoryVM => 8192,
		:CPUCoresVM => 2,
	},
	#
	#
	#	################################
	#	Windows Server 2019
	#	################################
	#
	#
	#	################################
	#	Windows Server 2019 (Evaluation)
	#	################################ 
	#
	#
	{
		:HostNameVM => "W19-STD-S-EVAL-VB1",
		:DisplayName => "W19-STD-S-EVAL-VB1",
		:VagrantBoxName => "gusztavvargadr/windows-server-2019-standard",
		:VagrantBoxNameOSType => "windows",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 19, 
		:HypervisorVM => "Oracle",
		:MemoryVM => 8192,
		:CPUCoresVM => 2,
	}, 
	#
	#
	#	############################################
	#	############################################
	#			Provider Broadcom/VMWare
	#	############################################
	#	############################################
	#
	#
	#		#####
	#	################################
	#	gusztavvargadr
	#	################################
			#####
	#
	#
	#	################################
	#	Windows 10
	#	################################
	#
	#
	#	################################
	#	Windows 10 Enterprise (Evaluation)
	#	################################ 
	#
	#
	{
		:HostNameVM => "W10-ENT-D-B-GR-0001",
		:DisplayName => "W10-ENT-D-B-GR-0001",
		:VagrantBoxName => "gusztavvargadr/windows-10",
		:VagrantBoxNameOSType => "windows",
		:VagrantBoxNameOSEdition => "desktop",
		:VagrantBoxNameOSVersion => 10, 
		:HypervisorVM => "VMware",
		:MemoryVM => 8192,
		:CPUCoresVM => 2,
	},
	#
	#
	#	################################
	#	Windows 11
	#	################################
	#
	#
	#	################################
	#	Windows 11 Enterprise (Evaluation)
	#	################################ 
	#
	#
	{
		:HostNameVM => "W11-ENT-D-B-GR-0001",
		:DisplayName => "W11-ENT-D-B-GR-0001",
		:VagrantBoxName => "gusztavvargadr/windows-11",
		:VagrantBoxNameOSType => "windows",
		:VagrantBoxNameOSEdition => "desktop",
		:VagrantBoxNameOSVersion => 11, 
		:HypervisorVM => "VMware",
		:MemoryVM => 8192,
		:CPUCoresVM => 2,
	},
	#
	#
	#	################################
	#	Windows Server 2019
	#	################################
	#
	#
	#	################################
	#	Windows Server 2019 (Evaluation)
	#	################################ 
	#
	#
	{
		:HostNameVM => "W19-STD-S-B-GR-0001",
		:DisplayName => "W19-STD-S-B-GR-0001",
		:VagrantBoxName => "gusztavvargadr/windows-server-2019-standard",
		:VagrantBoxNameOSType => "windows",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 19, 
		:HypervisorVM => "VMware",
		:MemoryVM => 8192,
		:CPUCoresVM => 2,
	},
	#
	#
	#	################################
	#	Windows Server 2022
	#	################################
	#
	#
	#	################################
	#	Windows Server 2022 (Evaluation)
	#	################################ 
	#
	#
	{
		:HostNameVM => "W22-STD-S-B-GR-L001",
		:DisplayName => "W22-STD-S-B-GR-L001",
		:VagrantBoxName => "gusztavvargadr/windows-server-2022-standard",
		:VagrantBoxNameOSType => "windows",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 22, 
		:HypervisorVM => "VMware",
		:MemoryVM => 8192,
		:CPUCoresVM => 2,
	},
	#
	#
	#		#####
	#	################################
	#	Xenov
	#	################################
			#####
	#
	#
	#	################################
	#	Windows 10
	#	################################
	#
	#
	#	################################
	#	Windows 10 Enterprise (Evaluation)
	#	################################ 
	#
	#
	#	box-version 2202.1740574724
	#	TEST 14/04/2025
	#	PASS
	#
	#	DEZE GEBRUIKEN / VOORKEURSBOX
	#
	{
		:HostNameVM => "W10-ENT-D-B-XV-L001",
		:DisplayName => "W10-ENT-D-B-XV-L001",
		:VagrantBoxName => "xenov/windows-10",
		:VagrantBoxNameOSType => "windows",
		:VagrantBoxNameOSEdition => "desktop",
		:VagrantBoxNameOSVersion => 10, 
		:HypervisorVM => "VMware",
		:MemoryVM => 8192,
		:CPUCoresVM => 2,
	},
	#
	#
	#	################################
	#	Windows Server 2022
	#	################################
	#
	#
	#	################################
	#	Windows Server 2022 (Evaluation)
	#	################################ 
	#
	#	Box-version 2022.1740574721
	#	TEST 14/04/2025
	#	FAIL
	#	WinRM error message 
	#
	{
		:HostNameVM => "W22-STD-S-B-XV-L001",
		:DisplayName => "W22-STD-S-B-XV-L001",
		:VagrantBoxName => "xenov/windows-server-2022",
		:VagrantBoxNameOSType => "windows",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 22, 
		:HypervisorVM => "VMware",
		:MemoryVM => 8192,
		:CPUCoresVM => 2,
	},
	#
	#
	#	############################################
	#	Onderwijs Windows Virtuele Machines
	#	############################################
	#
	#
	#	################################
	#	gusztavvargadr
	#	################################
	#
	#
	#	################################
	#	Windows 10
	#	################################
	#
	#
	#	################################
	#	Windows 10 Enterprise (Evaluation)
	#	################################ 
	#
	#
	#	Introductie Infrastucturen
	#
	#
	{
		:HostNameVM => "W10-ENT-D-B-GR-OST1",
		:DisplayName => "W10-ENT-D-B-GR-OST1",
		:VagrantBoxName => "gusztavvargadr/windows-10",
		:VagrantBoxNameOSType => "windows",
		:VagrantBoxNameOSEdition => "desktop",
		:VagrantBoxNameOSVersion => 10, 
		:HypervisorVM => "VMware",
		:MemoryVM => 4096,
		:CPUCoresVM => 2,
	},
	#
	#
	#	################################
	#	Windows 11
	#	################################
	#
	#
	#	################################
	#	Windows 11 Enterprise (Evaluation)
	#	################################ 
	#
	#
	#	Introductie Infrastucturen
	#
	#
	{
		:HostNameVM => "W11-ENT-D-B-GR-OST1",
		:DisplayName => "W11-ENT-D-B-GR-OST1",
		:VagrantBoxName => "gusztavvargadr/windows-11",
		:VagrantBoxNameOSType => "windows",
		:VagrantBoxNameOSEdition => "desktop",
		:VagrantBoxNameOSVersion => 11, 
		:HypervisorVM => "VMware",
		:MemoryVM => 4096,
		:CPUCoresVM => 2,
	},
	#
	#
	#	################################
	#	Windows Server 2022
	#	################################
	#
	#
	#	################################
	#	Windows Server 2022 (Evaluation)
	#	################################ 
	#
	#
	#	Introductie Infrastucturen
	#
	#
	{
		:HostNameVM => "W22-STD-S-B-GR-MRT1",
		:DisplayName => "W22-STD-S-B-GR-MRT1",
		:VagrantBoxName => "gusztavvargadr/windows-server-2022-standard",
		:VagrantBoxNameOSType => "windows",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 22, 
		:HypervisorVM => "VMware",
		:MemoryVM => 4096,
		:CPUCoresVM => 2,
	},
	#
	#
	#	Scripting met Powershell
	#
	#
	#	Domain Controller DC01
	#
	#
	{
		:HostNameVM => "DC01",
		:DisplayName => "W22-STD-S-B-GR-DC01",
		:VagrantBoxName => "gusztavvargadr/windows-server-2022-standard",
		:VagrantBoxNameOSType => "windows",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 22, 
		:HypervisorVM => "VMware",
		:MemoryVM => 4096,
		:CPUCoresVM => 2,
	},
	#
	#
	#	DBMS DB01
	#
	#
	{
		:HostNameVM => "DB01",
		:DisplayName => "W22-STD-S-B-GR-DB01",
		:VagrantBoxName => "gusztavvargadr/windows-server-2022-standard",
		:VagrantBoxNameOSType => "windows",
		:VagrantBoxNameOSEdition => "server",
		:VagrantBoxNameOSVersion => 22, 
		:HypervisorVM => "VMware",
		:MemoryVM => 4096,
		:CPUCoresVM => 2,
	},
	#
	#
	#	################################
	#	Xenov
	#	################################
	#
	#
	#	################################
	#	Windows 10
	#	################################
	#
	#
	#	################################
	#	Windows 10 Enterprise (Evaluation)
	#	################################ 
	#
	#
	#	Introductie Infrastucturen
	#
	#
	{
		:HostNameVM => "W10-ENT-D-B-XV-OST1",
		:DisplayName => "W10-ENT-D-B-XV-OST1",
		:VagrantBoxName => "xenov/windows-10",
		:VagrantBoxNameOSType => "windows",
		:VagrantBoxNameOSEdition => "desktop",
		:VagrantBoxNameOSVersion => 10, 
		:HypervisorVM => "VMware",
		:MemoryVM => 4096,
		:CPUCoresVM => 2,
	},
	#
	#
	#	Scripting met Powershell
	#
	#
	{
		:HostNameVM => "WS01",
		:DisplayName => "W10-ENT-D-B-XV-WS01",
		:VagrantBoxName => "xenov/windows-10",
		:VagrantBoxNameOSType => "windows",
		:VagrantBoxNameOSEdition => "desktop",
		:VagrantBoxNameOSVersion => 10, 
		:HypervisorVM => "VMware",
		:MemoryVM => 4096,
		:CPUCoresVM => 2,
	}
	#
	#
	#
	#
	#
    ]
#
#
# 	############################################ [Declaratie Scripts] ##########################################
#
#
#	##########################
#	[1]		Linux
#	##########################
#
#
#
#
#	Script staan op GitHub JATutert
#
#
#
#
#	######################
# 	[2]	WINDOWS
#	######################
#
#
# [2a] Scripts die ALTIJD uitgevoerd worden bij eerste start van VM
#
#
# [2a-1] Installatie WinGET
#
#
$windows_winget_install = <<SCRIPT
	#	Niet in gebruik
SCRIPT
#
#
# [2a-2] Services stoppen
#
$windows_services_config = <<SCRIPT
	#	Niet in gebruik 
SCRIPT
#
#
# [2b] Scripts die aangemaakt worden, maar later handmatig gestart moeten worden
#
$win_script_aanmaak = <<SCRIPT
	# REM powershell -ExecutionPolicy Unrestricted 
	# REM powershell -file ps-winget.ps1
SCRIPT
#
#
#
#
#
# ############################################ [Virtuele Machines] ##########################################
#
#
#
#
Vagrant.configure("2") do |config|
	#
	#
	#
	#
	# ####################################################################
	#              LINUX VIRTUELE MACHINES
	# ####################################################################
	#
	#
	#
	#
	linux_machines.each do |machine|
		config.vm.define machine[:HostNameVM] do |ulxnode|
			#
			#   ####################################################################
			#   Algemeen
			#
			ulxnode.vm.box 					= machine[:VagrantBoxName]
			ulxnode.vm.box_check_update		= false
			ulxnode.vm.hostname 			= "#{machine[:HostNameVM].downcase}"
			#
			#
			#   ####################################################################	
			#   Netwerken
			#
			#	Adapter 2 Host-Only | Oracle Virtualbox fixed IP-address
			#
			if machine[:HypervisorVM] == "Oracle"
				ulxnode.vm.network "private_network", ip: "#{machine[:ip]}", netmask: "255.255.255.0"
			end
			#
			#	Adapter 2 Host-Only | VMware Workstation / Fusion PRO DHCP IP-address
			#
			if machine[:HypervisorVM] == "VMware"
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
			#	11 december 2023 uitgezet
			# 
			#	ulxnode.vm.network :forwarded_port, guest: 80, host: 80, auto_correct: true, id: "webserver"
			#	ulxnode.vm.network :forwarded_port, guest: 1234, host: 1234, auto_correct: true, id: "cockpit"
			#	ulxnode.vm.network :forwarded_port, guest: 8080, host: 8080, auto_correct: true, id: "webserver"
			#	ulxnode.vm.network :forwarded_port, guest: 8888, host: 8888, auto_correct: true, id: "nextcloud"
			#	ulxnode.vm.network :forwarded_port, guest: 9000, host: 9000, auto_correct: true, id: "minio-api"
			#	ulxnode.vm.network :forwarded_port, guest: 9001, host: 9001, auto_correct: true, id: "minio-console`"
			#	ulxnode.vm.network :forwarded_port, guest: 9090, host: 9090, auto_correct: true, id: "minio-operator"
			#
			#   ####################################################################
			#   Synced Folders
			#
			#
			#	12 augustus 2024 uitgezet om tijd te besparen
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
			if machine[:HypervisorVM] == "Oracle"
				ulxnode.vm.provider "virtualbox" do |ulxnode_pvd_ovbvm|
					#
					ulxnode_pvd_ovbvm.gui = true
					ulxnode_pvd_ovbvm.linked_clone = false
					#
					ulxnode_pvd_ovbvm.cpus =	"#{machine[:CPUCoresVM]}"
					ulxnode_pvd_ovbvm.memory =	"#{machine[:MemoryVM]}"
					ulxnode_pvd_ovbvm.name =	"#{machine[:HostNameVM]}"
					#
					ulxnode_pvd_ovbvm.customize	["modifyvm", :id, "--vram", "128"]
					ulxnode_pvd_ovbvm.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
					ulxnode_pvd_ovbvm.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
					ulxnode_pvd_ovbvm.customize ["modifyvm", :id, "--description", "#{machine[:VagrantBoxNameOSType]} #{machine[:VagrantBoxNameOSVersion]} \r\n Used box is #{machine[:VagrantBoxName]} \r\n Created on #{cur_date} by Vagrant \r\n Username/Password = vagrant \r\n Use VAGRANT up #{machine[:HostNameVM]} to boot this virtual machine"]
					#
				end
			end	
			#
			#	[P2] 	PROVIDER: VMware Workstation / Fusion PRO
			#
			if machine[:HypervisorVM] == "VMware"
				ulxnode.vm.provider "vmware_desktop" do |ulxnode_pvd_vmwvm|
					#
					#	[1]	Algemene settings aanpassen 
					#
					ulxnode_pvd_vmwvm.gui = 			true
					ulxnode_pvd_vmwvm.linked_clone = 	false
					#
					ulxnode_pvd_vmwvm.cpus =	"#{machine[:CPUCoresVM]}"
					ulxnode_pvd_vmwvm.memory =	"#{machine[:MemoryVM]}"
					#
					#	Buiten gebruik
					#	vmwvm.nat_device 	= "VMnet8"
					#
					#
					# 	[2]	Aanpassen VMware Workstation/Fusion Pro VMX 
					#
					#
					ulxnode_pvd_vmwvm.vmx["tools.syncTime"]	= "TRUE"
					ulxnode_pvd_vmwvm.vmx["displayName"]	= "#{machine[:DisplayName]}"
					ulxnode_pvd_vmwvm.vmx["annotation"]		= "#{machine[:VagrantBoxNameOSType]} #{machine[:VagrantBoxNameOSVersion]} |0D|0AUsed box is #{machine[:VagrantBoxName]} |0D|0ACreated on #{cur_date} by Vagrant |0D|0AUsername/Password = vagrant |0D|0AUse VAGRANT up #{machine[:HostNameVM]} to boot this virtual machine"
					#
					#
					#	[3]	Aanpassen VMX naar juiste VMNet
					#
					#
					# 	[3a]	Ansible Demo
					#
					#	Master/Controller
					if machine[:HostNameVM].include? "LTS-S-B-GC-LAC"
						ulxnode_pvd_vmwvm.vmx["ethernet1.connectiontype"] 	= "custom"
						ulxnode_pvd_vmwvm.vmx["ethernet1.vnet"] 			= "VMnet4"
						ulxnode_pvd_vmwvm.vmx["ethernet1.displayName"]		= "VMnet4"
					end 
					#	Slave
					if machine[:HostNameVM].include? "LTS-S-B-GC-LAS"
						ulxnode_pvd_vmwvm.vmx["ethernet1.connectiontype"] 	= "custom"
						ulxnode_pvd_vmwvm.vmx["ethernet1.vnet"] 			= "VMnet4"
						ulxnode_pvd_vmwvm.vmx["ethernet1.displayName"]		= "VMnet4"
					end
					#
					#	[3b]	DOCKER Demo
					#
					if machine[:HostNameVM].include? "LTS-S-B-GR-LDD1"
						ulxnode_pvd_vmwvm.vmx["ethernet1.connectiontype"] 	= "custom"
						ulxnode_pvd_vmwvm.vmx["ethernet1.vnet"] 			= "VMnet4"
						ulxnode_pvd_vmwvm.vmx["ethernet1.displayName"]		= "VMnet4"
					end
					#
					#	[3c]	MiniKube Demo
					#
					if machine[:HostNameVM].include? "LTS-S-B-GR-LMD1"
						ulxnode_pvd_vmwvm.vmx["ethernet1.connectiontype"] 	= "custom"
						ulxnode_pvd_vmwvm.vmx["ethernet1.vnet"] 			= "VMnet4"
						ulxnode_pvd_vmwvm.vmx["ethernet1.displayName"]		= "VMnet4"
					end
					#
					#	[3d]	Introductie Intrastructuren
					#
					#	[3d1]	DBMS
					#
					#	include? doet check of string bepaalde tekens bevat
					#
					if machine[:HostNameVM].include? "LTS-S-B-GR-SD01"
						ulxnode_pvd_vmwvm.vmx["ethernet1.connectiontype"] 	= "custom"
						ulxnode_pvd_vmwvm.vmx["ethernet1.vnet"] 			= "VMnet3"
						ulxnode_pvd_vmwvm.vmx["ethernet1.displayName"]		= "VMnet3"
					end 
					if machine[:HostNameVM].include? "LTS-S-B-GR-LD01"
						ulxnode_pvd_vmwvm.vmx["ethernet1.connectiontype"] 	= "custom"
						ulxnode_pvd_vmwvm.vmx["ethernet1.vnet"] 			= "VMnet3"
						ulxnode_pvd_vmwvm.vmx["ethernet1.displayName"]		= "VMnet3"
					end 
					if machine[:HostNameVM].include? "LTS-S-B-GR-XLD1"
						ulxnode_pvd_vmwvm.vmx["ethernet1.connectiontype"] 	= "custom"
						ulxnode_pvd_vmwvm.vmx["ethernet1.vnet"] 			= "VMnet3"
						ulxnode_pvd_vmwvm.vmx["ethernet1.displayName"]		= "VMnet3"
					end 
					#
					#	[3d2]	WebServer
					#
					if machine[:HostNameVM].include? "LTS-S-B-GR-SWS1"
						ulxnode_pvd_vmwvm.vmx["ethernet1.connectiontype"] 	= "custom"
						ulxnode_pvd_vmwvm.vmx["ethernet1.vnet"] 			= "VMnet3"
						ulxnode_pvd_vmwvm.vmx["ethernet1.displayName"]		= "VMnet3"
					end 
					if machine[:HostNameVM].include? "LTS-S-B-GR-LWS1"
						ulxnode_pvd_vmwvm.vmx["ethernet1.connectiontype"] 	= "custom"
						ulxnode_pvd_vmwvm.vmx["ethernet1.vnet"] 			= "VMnet3"
						ulxnode_pvd_vmwvm.vmx["ethernet1.displayName"]		= "VMnet3"
					end
					if machine[:HostNameVM].include? "LTS-S-B-GR-XLW1"
						ulxnode_pvd_vmwvm.vmx["ethernet1.connectiontype"] 	= "custom"
						ulxnode_pvd_vmwvm.vmx["ethernet1.vnet"] 			= "VMnet3"
						ulxnode_pvd_vmwvm.vmx["ethernet1.displayName"]		= "VMnet3"
					end
					#
					#
				end
			end	
			#
			# #############################################################
			#
			#						Provision
			#				
			#						MESSAGE OF THE DAY
			#
			# ##############################################################
			#
			#
			ulxnode.vm.provision "shell", inline: <<-SHELL
				#
				# linux_distributie=$(lsb_release -is)
				# linux_distributie_versie=$(lsb_release -ds)
				#
				PRETTY_NAME=$(grep -oP '(?<=^PRETTY_NAME=).+' /etc/os-release | tr -d '"')
				NAME=$(grep -oP '(?<=^NAME=).+' /etc/os-release | tr -d '"')
				VERSION=$(grep -oP '(?<=^VERSION=).+' /etc/os-release | tr -d '"')
				VERSION_ID=$(grep -oP '(?<=^VERSION_ID=).+' /etc/os-release | tr -d '"')
				VERSION_CODENAME=$(grep -oP '(?<=^VERSION_CODENAME=).+' /etc/os-release | tr -d '"')
				#
				echo 'Welcome to' $NAME $VERSION 'created' #{cur_date} 'by Vagrant' | sudo tee /etc/motd > /dev/null
				# sudo echo "Welcome to #{machine[:VagrantBoxNameOSType]} version #{machine[:VagrantBoxNameOSVersion]} created #{cur_date}" | sudo tee /etc/motd
				#
			SHELL
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
			#	sed "s@mirrors.edge.kernel.org@nl.archive.ubuntu.com@" -i /etc/apt/sources.list
			#
			#
			#
			#
			if machine[:VagrantBoxNameOSType] == "ubuntu" 
			#
			#
				if machine[:VagrantBoxNameOSVersion] == 2204
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
				if machine[:VagrantBoxNameOSVersion] == 2404
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
				# 	# 	Versie 1 (status: productie) 
				#	sudo curl -s -o /home/vagrant/ubuntu-config-V1-latest.sh https://raw.githubusercontent.com/jatutert/Ubuntu-Config/main/ubuntu-config-V1-latest.sh
				#	sudo chmod +x /home/vagrant/ubuntu-config-V1-latest.sh
				# 	#	Versie 2 (status: productie) 
				#	sudo curl -s -o /home/vagrant/ubuntu-config-V2-latest.sh https://raw.githubusercontent.com/jatutert/Ubuntu-Config/main/ubuntu-config-V2-latest.sh
				#	sudo chmod +x /home/vagrant/ubuntu-config-V2-latest.sh
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
		config.vm.define machine[:HostNameVM] do |winnode|
			#
			#	####################################################################
			#	Algemeen
			#
			winnode.vm.box 				= 	machine[:VagrantBoxName]
			winnode.vm.box_check_update = 	false
			#
			winnode.vm.hostname 		= 	"#{machine[:HostNameVM]}"
			#	OUD		winnode.vm.hostname 		= 	"Vagrant-#{machine[:HostNameVM]}"
			winnode.vm.guest 			= 	"windows"
			winnode.winssh.shell 		= 	"powershell" 		# The shell to use when executing SSH commands from Vagrant. By default this is powershell. Valid values are "cmd" or "powershell".		
			#
			winnode.vm.boot_timeout = 1800		# 30 minuten
			#
			#
			#
			# 	####################################################################
			#	Network
			#
			#	Ethernet1 NetAdapter // LAB 
			#
			winnode.vm.network "private_network", type: "dhcp"
			#
			#	Ethernet2 NetAdapter // Vagrant WinRM
			#
			winnode.vm.network "private_network", type: "dhcp"
			#
			# 	####################################################################
			#
			#
			#
			#
			# 	####################################################################
			#	WinRM
			#
			#	11 mei 2025 uitgezet / Nog wel noodzakeijk ? / 
			#	winnode.vm.communicator 	= 	"winrm" 		# standaard is ssh windows moet naar winrm
			#
			#
			winnode.winrm.host			= "127.0.0.1"
			winnode.winrm.retry_limit	= 10
			winnode.winrm.timeout		= 1800		# 30 minuten
			#
			# 	####################################################################
			#	Post Up Message
			#
			winnode.vm.post_up_message = "Start scripts in Downloads in VM voor verdere configuratie"
			#	
			#	####################################################################
			#
			#
			#
			#
			#	#####################################################################
			#	Hypervisor Specifieke Instellingen
			#
			#
			#	Oracle Virtualbox
			#
			#
			if machine[:HypervisorVM] == "Oracle"
				#
				# https://developer.hashicorp.com/vagrant/docs/providers/virtualbox
				#
				winnode.vm.provider "virtualbox" do |win_node_ovbvm|
					#
					win_node_ovbvm.gui 				= 	true
					win_node_ovbvm.linked_clone 	= 	false
					#
					win_node_ovbvm.cpus 			= 	"#{machine[:CPUCoresVM]}"
					win_node_ovbvm.memory 			= 	"#{machine[:MemoryVM]}"
					win_node_ovbvm.name 			= 	"Vagrant-#{machine[:HostNameVM]}"
					#
					win_node_ovbvm.customize ["modifyvm", :id, "--vram", "128"]
					win_node_ovbvm.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
					win_node_ovbvm.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
					win_node_ovbvm.customize ["modifyvm", :id, "--description", "Ubuntu 22.04 LTS Gebruiker en Password: vagrant"] 
				end
				#
				#
				#
			end	
			#
			#
			#	VMware Workstation / Fusion PRO
			#
			#
			if machine[:HypervisorVM] == "VMware"
				#
				# https://developer.hashicorp.com/vagrant/docs/providers/vmware
				#
				winnode.vm.provider "vmware_desktop" do |win_node_vmwvm|
					#
					win_node_vmwvm.gui 								= true
					win_node_vmwvm.linked_clone						= false
					#
					win_node_vmwvm.cpus 							= "#{machine[:CPUCoresVM]}"
					win_node_vmwvm.memory 							= "#{machine[:MemoryVM]}"
					#
					win_node_vmwvm.vmx["tools.syncTime"]			= "TRUE"
					win_node_vmwvm.vmx["displayName"] 				= "#{machine[:DisplayName]}"
					win_node_vmwvm.vmx["annotation"] 				= "#{machine[:VagrantBoxNameOSType]} #{machine[:VagrantBoxNameOSVersion]} |0D|0AUsed box is #{machine[:VagrantBoxName]} |0D|0ACreated on #{cur_date} by Vagrant |0D|0AUsername/Password = vagrant |0D|0AUse VAGRANT up #{machine[:HostNameVM]} to boot this virtual machine"
					#
					#	Ethernet1 NetAdapter // LAB
					win_node_vmwvm.vmx["ethernet1.connectiontype"] 	= "custom"
					win_node_vmwvm.vmx["ethernet1.vnet"] 			= "VMnet4"
					win_node_vmwvm.vmx["ethernet1.displayName"] 	= "VMnet4"
					#
					#	Ethernet2 NetAdapter // Vagrant WinRM
					win_node_vmwvm.vmx["ethernet2.connectiontype"] 	= "custom"
					win_node_vmwvm.vmx["ethernet2.vnet"] 			= "VMnet1"
					win_node_vmwvm.vmx["ethernet2.displayName"] 	= "VMnet1"
				end
				#
				#
				#
			end	
			#
			#
			#	#####################################################################
			#	Provision
			#
			#	Ethernet1 NetAdapter // LAB voorzien van een Static IPV4 Adres
			#	
			#	Ethernet2 NetAdapter NIET voorzien van Static IP, anders werkt Vagrant WinRM NIET meer ! 
			#
			if machine[:HostNameVM] == "DC01"
				winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/jatutert/Vagrant/refs/heads/main/Scripts/Powershell/Vagrant-VM-Configure-Static-IP.ps1"
			end
			if machine[:HostNameVM] == "DB01"
				winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/jatutert/Vagrant/refs/heads/main/Scripts/Powershell/Vagrant-VM-Configure-Static-IP.ps1"
			end
			#
			#	Configuratie Windows Omgeving / Algemeen
			#
			if machine[:VagrantBoxNameOSType] == "windows"
				#	Windows Services Stoppen en disabelen (JT)
				#   Configuratie TimeZone naar Amsterdam
				winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/jatutert/Windows-Config/main/Powershell/VM-OOBE-Config-Services-V007.ps1"
				#	Windows SSH Client / SSH Server installatie (JT) 
				winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/jatutert/Windows-Config/refs/heads/main/Powershell/VM-OOBE-Config-SSH-V003.ps1"
				#	Installatie WinGET (Asheroto) (steeds nieuwste versie van het script)
				winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/asheroto/winget-install/master/winget-install.ps1"
				#	WinGET Accept License Terms (JT)
				winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/jatutert/Windows-Config/refs/heads/main/Powershell/VM-OOBE-WinGET-Accept-Terms-V001.ps1"
				#	Download Bestanden en CMD Scripts (JT)
				winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/jatutert/Windows-Config/refs/heads/main/Powershell/VM-Download-V004.ps1"
				#	Installatie Applicaties (doet alleen installatie van Powershell 7) (JT)
				#   18 mei 2025 uitgezet
				#   Powershell 7 niet meer op deze manier installeren
				#   Nieuw manier is installatie in Powershell 5 en dan met WinGet
				#   winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/jatutert/Windows-Config/refs/heads/main/Powershell/VM-OOBE-Application-Install-V001.ps1"
			end
			#
			#	Configuratie Windows Omgeving / Desktop
			#
			if machine[:VagrantBoxNameOSType] == "windows" && machine[:VagrantBoxNameOSEdition] == "desktop"
				#	Windows Policy en Registry Instellingen doen (JT)
				winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/jatutert/Windows-Config/main/Powershell/VM-OOBE-Registry-Policy-V001.ps1"
				#	WinGET Install Apps (JT)
				winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/jatutert/Windows-Config/refs/heads/main/Powershell/VM-OOBE-Winget-Install-APPS-V001.ps1"
			end
			#
			#	Configuratie Windows Omgeving / Server
			#
			if machine[:VagrantBoxNameOSType] == "windows" && machine[:VagrantBoxNameOSEdition] == "server"
				#	Geen specifieke configuratie Scripts
			end
			#
			#	https://saxionact.github.io/1.4-Scripting-met-Powershell/Casus/OpdrachtCasus1.html
			#
			if machine[:HostNameVM] == "DC01"
				# 	Active Directory
				#	winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/jatutert/Vagrant/refs/heads/main/Scripts/Powershell/Vagrant-VM-AD-DC-Promote.ps1"
				#
				# 	DHCP Server
				#	winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/jatutert/Vagrant/refs/heads/main/Scripts/Powershell/03-Install-DHCP.ps1"
				#
				# 	Router
				# 	winnode.vm.provision "shell", path: "https://saxionact.github.io/1.4-Scripting-met-Powershell/Casus/04-Install-Routing.ps1"
			end
			if machine[:HostNameVM] == "DB01"
				winnode.vm.provision "shell", path: "https://saxionact.github.io/1.4-Scripting-met-Powershell/Casus/06-Configure-MemberServer.ps1"
				winnode.vm.provision "shell", path: "https://saxionact.github.io/1.4-Scripting-met-Powershell/Casus/07-Install-SQLServer.ps1"
			end
			#
			#
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