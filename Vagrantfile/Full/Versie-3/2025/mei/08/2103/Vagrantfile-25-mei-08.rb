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

=end
#
#
# ############################################ [Vullen Variabelen] ##########################################
#
#	Variable versie Vagrantfile 
versie_vagrantfile = "08-05-2025"
#
#	Variable auteur Vagrantfile 
auteur_vagrantfile = "John Tutert"
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
puts "Using VAGRANTFILE version #{versie_vagrantfile} by #{auteur_vagrantfile} (for private or educational use only!)"
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
		:hostname => 		"U24-LTS-S-B-GR-S001",
		:weergavenaam => 	"U24-LTS-S-B-GR-S001",
		:box => "gusztavvargadr/ubuntu-server-2404-lts",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2404, 
		:aanbieder => "Oracle",
		:ram => 2048,
		:cpu => 2,
	},
	{
		:hostname => 		"U24-LTS-S-B-GR-M001",
		:weergavenaam => 	"U24-LTS-S-B-BR-M001",
		:box => "gusztavvargadr/ubuntu-server-2404-lts",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2404, 
		:aanbieder => "Oracle",
		:ram => 4096,
		:cpu => 2,
	},
	{
		:hostname => 		"U24-LTS-S-B-GR-L001",
		:weergavenaam => 	"U24-LTS-S-B-GR-L001",
		:box => "gusztavvargadr/ubuntu-server-2404-lts",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2404, 
		:aanbieder => "Oracle",
		:ram => 8192,
		:cpu => 2,
	},
	{
		:hostname => 		"U24-LTS-S-B-GR-XL01",
		:weergavenaam => 	"U24-LTS-S-B-GR-XL01",
		:box => "gusztavvargadr/ubuntu-server-2404-lts",
		:os => "ubuntu",
		:osedition => "desktop",
		:osversie => 2404, 
		:aanbieder => "Oracle",
		:ram => 16384,
		:cpu => 2,
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
		:hostname =>		"U20-LTS-S-B-GC-S001",
		:weergavenaam =>	"U20-LTS-S-B-GC-S001",
		:box => "generic/ubuntu2004",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2004, 
		:aanbieder => "VMware",
		:ram => 2048,
		:cpu => 2,
	},
	{
		:hostname =>		"U20-LTS-S-B-GC-M001",
		:weergavenaam =>	"U20-LTS-S-B-GC-M001",
		:box => "generic/ubuntu2004",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2004, 
		:aanbieder => "VMware",
		:ram => 4096,
		:cpu => 2,
	},
	{
		:hostname =>		"U20-LTS-S-B-GC-L001",
		:weergavenaam =>	"U20-LTS-S-B-GC-L001",
		:box => "generic/ubuntu2004",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2004, 
		:aanbieder => "VMware",
		:ram => 8192,
		:cpu => 2,
	},
	{
		:hostname =>		"U20-LTS-S-B-GC-XL01",
		:weergavenaam =>	"U20-LTS-S-B-GC-XL01",
		:box => "generic/ubuntu2004",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2004, 
		:aanbieder => "VMware",
		:ram => 16384,
		:cpu => 2,
	},
	#
	#
	#	########################################################################################
	#	Ubuntu 22.04.x LTS Jammy Jellyfish (release 23 februari 2023) (EOS April 2027) (EOL April 2032)
	#	########################################################################################
	#
	#
	{
		:hostname =>		"U22-LTS-S-B-GC-S001",
		:weergavenaam =>	"U22-LTS-S-B-GC-S001",
		:box => "generic/ubuntu2204",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2204, 
		:aanbieder => "VMware",
		:ram => 2048,
		:cpu => 2,
	},
	{
		:hostname =>		"U22-LTS-S-B-GC-M001",
		:weergavenaam =>	"U22-LTS-S-B-GC-M001",
		:box => "generic/ubuntu2204",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2204, 
		:aanbieder => "VMware",
		:ram => 4096,
		:cpu => 2,
	},	
	{
		:hostname =>		"U22-LTS-S-B-GC-L001",
		:weergavenaam =>	"U22-LTS-S-B-GC-L001",
		:box => "generic/ubuntu2204",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2204, 
		:aanbieder => "VMware",
		:ram => 8192,
		:cpu => 2,
	},
	{
		:hostname =>		"U22-LTS-S-B-GC-XL01",
		:weergavenaam =>	"U22-LTS-S-B-GC-XL01",
		:box => "generic/ubuntu2204",
		:os => "ubuntu",
		:osedition => "desktop",
		:osversie => 2204, 
		:aanbieder => "VMware",
		:ram => 16384,
		:cpu => 2,
	},
	#
	#
	#	########################################################################################
	#	Ubuntu 24.04.x LTS Jammy Jellyfish (release xx xx 2024) (EOS April 2028) (EOL April 20xx) 
	#	########################################################################################
	#
	#
	{
		:hostname => 		"U24-LTS-S-B-GR-S001",
		:weergavenaam => 	"U24-LTS-S-B-GR-S001",
		:box => "gusztavvargadr/ubuntu-server-2404-lts",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2404, 
		:aanbieder => "VMware",
		:ram => 2048,
		:cpu => 2,
	},
	{
		:hostname => 		"U24-LTS-S-B-GR-M001",
		:weergavenaam => 	"U24-LTS-S-B-BR-M001",
		:box => "gusztavvargadr/ubuntu-server-2404-lts",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2404, 
		:aanbieder => "VMware",
		:ram => 4096,
		:cpu => 2,
	},
	{
		:hostname => 		"U24-LTS-S-B-GR-L001",
		:weergavenaam => 	"U24-LTS-S-B-GR-L001",
		:box => "gusztavvargadr/ubuntu-server-2404-lts",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2404, 
		:aanbieder => "VMware",
		:ram => 8192,
		:cpu => 2,
	},
	{
		:hostname => 		"U24-LTS-S-B-GR-XL01",
		:weergavenaam => 	"U24-LTS-S-B-GR-XL01",
		:box => "gusztavvargadr/ubuntu-server-2404-lts",
		:os => "ubuntu",
		:osedition => "desktop",
		:osversie => 2404, 
		:aanbieder => "VMware",
		:ram => 16384,
		:cpu => 2,
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
		:hostname =>		"U22-LTS-S-B-GC-LDD1",
		:weergavenaam =>	"U22-LTS-S-B-GC-LDD1",
		:box => "generic/ubuntu2204",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2204, 
		:aanbieder => "VMware",
		:ram => 8192,
		:cpu => 2,
    },
	#
	#
	#	############################################
	#	Kubernetes / K8S / Minikube demo
	#	############################################
	#
	#
	{
		:hostname =>		"U22-LTS-S-B-GC-XLK1",
		:weergavenaam => 	"U22-LTS-S-B-GC-XLK1",
		:box => "generic/ubuntu2204",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2204, 
		:aanbieder => "VMware",
		:ram => 16384,
		:cpu => 2,
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
		:hostname =>		"U22-LTS-S-B-GC-LAC1",
		:weergavenaam =>	"U22-LTS-S-B-GC-LAC1",
		:box => "generic/ubuntu2204",
		:os => "ubuntu",
		:osedition => "desktop",
		:osversie => 2204, 
		:aanbieder => "VMware",
		:ram => 8192,
		:cpu => 2,
	},
	#
	#
	#	Slave #1 (010)
	#
	#
	{
		:hostname =>		"U22-LTS-S-B-GC-LAS1",
		:weergavenaam =>	"U22-LTS-S-B-GC-LAS1",
		:box => "generic/ubuntu2204",
		:os => "ubuntu",
		:osedition => "desktop",
		:osversie => 2204, 
		:aanbieder => "VMware",
		:ram => 8192,
		:cpu => 2,
    },
	#
	#
	#	Slave #2 (011) 
	#
	#
	{
		:hostname =>		"U22-LTS-S-B-GC-LAS2",
		:weergavenaam =>	"U22-LTS-S-B-GC-LAS2",
		:box => "generic/ubuntu2204",
		:os => "ubuntu",
		:osedition => "desktop",
		:osversie => 2204, 
		:aanbieder => "VMware",
		:ram => 8192,
		:cpu => 2,
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
		:hostname => 		"U24-LTS-S-B-GR-LDD1",
		:weergavenaam => 	"U24-LTS-S-B-GR-LDD1",
		:box => "gusztavvargadr/ubuntu-server-2404-lts",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2404, 
		:aanbieder => "VMware",
		:ram => 8192,
		:cpu => 2,
	},
	#
	#
	#	############################################
	#	Kubernetes / K8S / Minikube demo
	#	############################################
	#
	#
	{
		:hostname => 		"U24-LTS-S-B-GR-LMD1",
		:weergavenaam => 	"U24-LTS-S-B-GR-LMD1",
		:box => "gusztavvargadr/ubuntu-server-2404-lts",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2404, 
		:aanbieder => "VMware",
		:ram => 8192,
		:cpu => 2,
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
		:hostname => 		"U24-LTS-S-B-GR-LAC1",
		:weergavenaam => 	"U24-LTS-S-B-GR-LAC1",
		:box => "gusztavvargadr/ubuntu-server-2404-lts",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2404, 
		:aanbieder => "VMware",
		:ram => 8192,
		:cpu => 2,
	},
	#
	#
	#	Slave #1 (010)
	#
	#
	{
		:hostname => 		"U24-LTS-S-B-GR-LAS1",
		:weergavenaam => 	"U24-LTS-S-B-GR-LAS1",
		:box => "gusztavvargadr/ubuntu-server-2404-lts",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2404, 
		:aanbieder => "VMware",
		:ram => 8192,
		:cpu => 2,
	},
	#
	#
	#	Slave #2 (011)
	#
	#
	{
		:hostname => 		"U24-LTS-S-B-GR-LAS2",
		:weergavenaam => 	"U24-LTS-S-B-GR-LAS2",
		:box => "gusztavvargadr/ubuntu-server-2404-lts",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2404, 
		:aanbieder => "VMware",
		:ram => 8192,
		:cpu => 2,
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
		:hostname => 		"U24-LTS-S-B-GR-SD01",
		:weergavenaam => 	"U24-LTS-S-B-GR-SD01",
		:box => "gusztavvargadr/ubuntu-server-2404-lts",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2404, 
		:aanbieder => "VMware",
		:ram => 2048,
		:cpu => 2,
	},
	{
		:hostname => 		"U24-LTS-S-B-GR-LD01",
		:weergavenaam => 	"U24-LTS-S-B-GR-LD01",
		:box => "gusztavvargadr/ubuntu-server-2404-lts",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2404, 
		:aanbieder => "VMware",
		:ram => 4096,
		:cpu => 2,
	},
	{
		:hostname => 		"U24-LTS-S-B-GR-XLD1",
		:weergavenaam => 	"U24-LTS-S-B-GR-XLD1",
		:box => "gusztavvargadr/ubuntu-server-2404-lts",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2404, 
		:aanbieder => "VMware",
		:ram => 8192,
		:cpu => 2,
	},
	#
	#
	#	WEBServer
	#
	#
	{
		:hostname => 		"U24-LTS-S-B-GR-SWS1",
		:weergavenaam => 	"U24-LTS-S-B-GR-SWS1",
		:box => "gusztavvargadr/ubuntu-server-2404-lts",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2404, 
		:aanbieder => "VMware",
		:ram => 2048,
		:cpu => 2,
	},
	{
		:hostname => 		"U24-LTS-S-B-GR-LWS1",
		:weergavenaam => 	"U24-LTS-S-B-GR-LWS1",
		:box => "gusztavvargadr/ubuntu-server-2404-lts",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2404, 
		:aanbieder => "VMware",
		:ram => 4096,
		:cpu => 2,
	},
	{
		:hostname => 		"U24-LTS-S-B-GR-XLW1",
		:weergavenaam => 	"U24-LTS-S-B-GR-XLW1",
		:box => "gusztavvargadr/ubuntu-server-2404-lts",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2404, 
		:aanbieder => "VMware",
		:ram => 8192,
		:cpu => 2,
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
	#	Provider Oracle 
	#	############################################
	#
	#
	#	##############
	#	gusztavvargadr
	#	##############
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
		:hostname => 		"W10-ENT-D-EVAL-VB1",
		:weergavenaam => 	"W10-ENT-D-EVAL-VB1",
		:box => 			"gusztavvargadr/windows-10",
		:os => 				"windows",
		:osedition => 		"desktop",
		:osversie => 		10, 
		:aanbieder => 		"Oracle",
		:ram => 			8192,
		:cpu =>	 			2,
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
		:hostname => 		"W11-ENT-D-EVAL-VB1",
		:weergavenaam => 	"W11-ENT-D-EVAL-VB1",
		:box => 			"gusztavvargadr/windows-11",
		:os => 				"windows",
		:osedition => 		"desktop",
		:osversie => 		11, 
		:aanbieder => 		"Oracle",
		:ram => 			8192,
		:cpu => 			2,
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
		:hostname => 		"W19-STD-S-EVAL-VB1",
		:weergavenaam => 	"W19-STD-S-EVAL-VB1",
		:box => 			"gusztavvargadr/windows-server-2019-standard",
		:os => 				"windows",
		:osedition => 		"server",
		:osversie => 		19, 
		:aanbieder => 		"Oracle",
		:ram => 			8192,
		:cpu => 			2,
	}, 
	#
	#
	#	############################################
	#	Provider Broadcom/VMWare
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
	{
		:hostname 		=> "W10-ENT-D-B-GR-0001",
		:weergavenaam 	=> "W10-ENT-D-B-GR-0001",
		:box => "gusztavvargadr/windows-10",
		:os => "windows",
		:osedition => "desktop",
		:osversie => 10, 
		:aanbieder => "VMware",
		:ram => 8192,
		:cpu => 2,
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
		:hostname 		=> "W11-ENT-D-B-GR-0001",
		:weergavenaam 	=> "W11-ENT-D-B-GR-0001",
		:box => "gusztavvargadr/windows-11",
		:os => "windows",
		:osedition => "desktop",
		:osversie => 11, 
		:aanbieder => "VMware",
		:ram => 8192,
		:cpu => 2,
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
		:hostname => 		"W19-STD-S-B-GR-0001",
		:weergavenaam => 	"W19-STD-S-B-GR-0001",
		:box => "gusztavvargadr/windows-server-2019-standard",
		:os => "windows",
		:osedition => "server",
		:osversie => 19, 
		:aanbieder => "VMware",
		:ram => 8192,
		:cpu => 2,
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
		:hostname => 		"W22-STD-S-B-GR-L001",
		:weergavenaam => 	"W22-STD-S-B-GR-L001",
		:box => "gusztavvargadr/windows-server-2022-standard",
		:os => "windows",
		:osedition => "server",
		:osversie => 22, 
		:aanbieder => "VMware",
		:ram => 8192,
		:cpu => 2,
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
	#	box-version 2202.1740574724
	#	TEST 14/04/2025
	#	PASS
	#
	#	DEZE GEBRUIKEN / VOORKEURSBOX
	#
	{
		:hostname 		=> "W10-ENT-D-B-XV-L001",
		:weergavenaam 	=> "W10-ENT-D-B-XV-L001",
		:box => "xenov/windows-10",
		:os => "windows",
		:osedition => "desktop",
		:osversie => 10, 
		:aanbieder => "VMware",
		:ram => 8192,
		:cpu => 2,
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
		:hostname => 		"W22-STD-S-B-XV-L001",
		:weergavenaam => 	"W22-STD-S-B-XV-L001",
		:box => "xenov/windows-server-2022",
		:os => "windows",
		:osedition => "server",
		:osversie => 22, 
		:aanbieder => "VMware",
		:ram => 8192,
		:cpu => 2,
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
		:hostname => 		"W10-ENT-D-B-GR-OST1",
		:weergavenaam => 	"W10-ENT-D-B-GR-OST1",
		:box => "gusztavvargadr/windows-10",
		:os => "windows",
		:osedition => "desktop",
		:osversie => 10, 
		:aanbieder => "VMware",
		:ram => 4096,
		:cpu => 2,
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
		:hostname => 		"W11-ENT-D-B-GR-OST1",
		:weergavenaam => 	"W11-ENT-D-B-GR-OST1",
		:box => "gusztavvargadr/windows-11",
		:os => "windows",
		:osedition => "desktop",
		:osversie => 11, 
		:aanbieder => "VMware",
		:ram => 4096,
		:cpu => 2,
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
		:hostname => 		"W22-STD-S-B-GR-MRT1",
		:weergavenaam => 	"W22-STD-S-B-GR-MRT1",
		:box => "gusztavvargadr/windows-server-2022-standard",
		:os => "windows",
		:osedition => "server",
		:osversie => 22, 
		:aanbieder => "VMware",
		:ram => 4096,
		:cpu => 2,
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
		:hostname => 		"DC01",
		:weergavenaam => 	"W22-STD-S-B-GR-DC01",
		:box => "gusztavvargadr/windows-server-2022-standard",
		:os => "windows",
		:osedition => "server",
		:osversie => 22, 
		:aanbieder => "VMware",
		:ram => 4096,
		:cpu => 2,
	},
	#
	#
	#	DBMS DB01
	#
	#
	{
		:hostname => 		"DB01",
		:weergavenaam => 	"W22-STD-S-B-GR-DB01",
		:box => "gusztavvargadr/windows-server-2022-standard",
		:os => "windows",
		:osedition => "server",
		:osversie => 22, 
		:aanbieder => "VMware",
		:ram => 4096,
		:cpu => 2,
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
		:hostname => 		"W10-ENT-D-B-XV-OST1",
		:weergavenaam => 	"W10-ENT-D-B-XV-OST1",
		:box => "xenov/windows-10",
		:os => "windows",
		:osedition => "desktop",
		:osversie => 10, 
		:aanbieder => "VMware",
		:ram => 4096,
		:cpu => 2,
	},
	#
	#
	#	Scripting met Powershell
	#
	#
	{
		:hostname 		=> "WS01",
		:weergavenaam 	=> "W10-ENT-D-B-XV-WS01",
		:box => "xenov/windows-10",
		:os => "windows",
		:osedition => "desktop",
		:osversie => 10, 
		:aanbieder => "VMware",
		:ram => 4096,
		:cpu => 2,
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
	# Melding komt elke keer in beeld bij commando met Vagrant ervoor
	# puts "tekst tekst tekst tekst"
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
			# ####################################################################
			#
			#						SYNCED FOLDERS
			#
			# ####################################################################
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
					#	[1]	Algemene settings aanpassen 
					#
					ulxnode_pvd_vmwvm.gui = true
					ulxnode_pvd_vmwvm.linked_clone = false
					#
					ulxnode_pvd_vmwvm.cpus = "#{machine[:cpu]}"
					ulxnode_pvd_vmwvm.memory = "#{machine[:ram]}"
					#
					#	Buiten gebruik
					#	vmwvm.nat_device 	= "VMnet8"
					#
					#
					# 	[2]	Aanpassen VMware Workstation/Fusion Pro VMX 
					#
					#
					ulxnode_pvd_vmwvm.vmx["tools.syncTime"]	= "TRUE"
					ulxnode_pvd_vmwvm.vmx["displayName"]	= "#{machine[:hostname]}"
					ulxnode_pvd_vmwvm.vmx["annotation"]		= "#{machine[:os]} #{machine[:osversie]} |0D|0AUsed box is #{machine[:box]} |0D|0ACreated on #{cur_date} by Vagrant |0D|0AUsername/Password = vagrant |0D|0AUse VAGRANT up #{machine[:hostname]} to boot this virtual machine"
					#
					#
					#	[3]	Aanpassen VMX naar juiste VMNet
					#
					#
					# 	[3a]	Ansible Demo
					#
					#	Master/Controller
					if machine[:hostname].include? "LTS-S-B-GC-LAC"
						ulxnode_pvd_vmwvm.vmx["ethernet1.connectiontype"] 	= "custom"
						ulxnode_pvd_vmwvm.vmx["ethernet1.vnet"] 			= "VMnet4"
						ulxnode_pvd_vmwvm.vmx["ethernet1.displayName"]		= "VMnet4"
					end 
					#	Slave
					if machine[:hostname].include? "LTS-S-B-GC-LAS"
						ulxnode_pvd_vmwvm.vmx["ethernet1.connectiontype"] 	= "custom"
						ulxnode_pvd_vmwvm.vmx["ethernet1.vnet"] 			= "VMnet4"
						ulxnode_pvd_vmwvm.vmx["ethernet1.displayName"]		= "VMnet4"
					end
					#
					#	[3b]	DOCKER Demo
					#
					if machine[:hostname].include? "LTS-S-B-GR-LDD1"
						ulxnode_pvd_vmwvm.vmx["ethernet1.connectiontype"] 	= "custom"
						ulxnode_pvd_vmwvm.vmx["ethernet1.vnet"] 			= "VMnet4"
						ulxnode_pvd_vmwvm.vmx["ethernet1.displayName"]		= "VMnet4"
					end
					#
					#	[3c]	MiniKube Demo
					#
					if machine[:hostname].include? "LTS-S-B-GR-LMD1"
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
					if machine[:hostname].include? "LTS-S-B-GR-SD01"
						ulxnode_pvd_vmwvm.vmx["ethernet1.connectiontype"] 	= "custom"
						ulxnode_pvd_vmwvm.vmx["ethernet1.vnet"] 			= "VMnet3"
						ulxnode_pvd_vmwvm.vmx["ethernet1.displayName"]		= "VMnet3"
					end 
					if machine[:hostname].include? "LTS-S-B-GR-LD01"
						ulxnode_pvd_vmwvm.vmx["ethernet1.connectiontype"] 	= "custom"
						ulxnode_pvd_vmwvm.vmx["ethernet1.vnet"] 			= "VMnet3"
						ulxnode_pvd_vmwvm.vmx["ethernet1.displayName"]		= "VMnet3"
					end 
					if machine[:hostname].include? "LTS-S-B-GR-XLD1"
						ulxnode_pvd_vmwvm.vmx["ethernet1.connectiontype"] 	= "custom"
						ulxnode_pvd_vmwvm.vmx["ethernet1.vnet"] 			= "VMnet3"
						ulxnode_pvd_vmwvm.vmx["ethernet1.displayName"]		= "VMnet3"
					end 
					#
					#	[3d2]	WebServer
					#
					if machine[:hostname].include? "LTS-S-B-GR-SWS1"
						ulxnode_pvd_vmwvm.vmx["ethernet1.connectiontype"] 	= "custom"
						ulxnode_pvd_vmwvm.vmx["ethernet1.vnet"] 			= "VMnet3"
						ulxnode_pvd_vmwvm.vmx["ethernet1.displayName"]		= "VMnet3"
					end 
					if machine[:hostname].include? "LTS-S-B-GR-LWS1"
						ulxnode_pvd_vmwvm.vmx["ethernet1.connectiontype"] 	= "custom"
						ulxnode_pvd_vmwvm.vmx["ethernet1.vnet"] 			= "VMnet3"
						ulxnode_pvd_vmwvm.vmx["ethernet1.displayName"]		= "VMnet3"
					end
					if machine[:hostname].include? "LTS-S-B-GR-XLW1"
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
				# sudo echo "Welcome to #{machine[:os]} version #{machine[:osversie]} created #{cur_date}" | sudo tee /etc/motd
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
				# 	Versie 1 (status: productie) 
				sudo curl -s -o /home/vagrant/ubuntu-config-V1-latest.sh https://raw.githubusercontent.com/jatutert/Ubuntu-Config/main/ubuntu-config-V1-latest.sh
				sudo chmod +x /home/vagrant/ubuntu-config-V1-latest.sh
				# 	Versie 2 (status: productie) 
				sudo curl -s -o /home/vagrant/ubuntu-config-V2-latest.sh https://raw.githubusercontent.com/jatutert/Ubuntu-Config/main/ubuntu-config-V2-latest.sh
				sudo chmod +x /home/vagrant/ubuntu-config-V2-latest.sh
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
			#
			#
			if machine[:hostname] == "DC01"
				winnode.vm.network "private_network", ip: "10.1.10.11", netmask: "255.255.255.0"
			end
			if machine[:hostname] == "DB01"
				winnode.vm.network "private_network", ip: "10.1.10.21", netmask: "255.255.255.0"
			end
			#
			#
			#	08 mei 2025 / CoPilot komt met 
			#	winnode.vm.network "private_network", ip: "192.168.50.5", adapter: 2
			#
			#	2024 / Handmatig instellen
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
			#	Windows Desktop Out of the Box (OOBE) Scripts
			#
			if machine[:os] == "windows" && machine[:osedition] == "desktop"
				#	Windows Services Stoppen en disabelen (JT)
				winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/jatutert/Windows-Config/main/Powershell/VM-OOBE-Config-Services-V006.ps1"
				#	Windows Policy en Registry Instellingen doen (JT)
				winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/jatutert/Windows-Config/main/Powershell/VM-OOBE-Registry-Policy-V001.ps1"
				#	Windows SSH Client / SSH Server installatie (JT) 
				winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/jatutert/Windows-Config/refs/heads/main/Powershell/VM-OOBE-Config-SSH-V003.ps1"
				#	Installatie WinGET (Asheroto) (steeds nieuwste versie van het script)
				winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/asheroto/winget-install/master/winget-install.ps1"
				#	WinGET Accept License Terms (JT)
				winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/jatutert/Windows-Config/refs/heads/main/Powershell/VM-OOBE-WinGET-Accept-Terms-V001.ps1"
				#	WinGET Install Apps (JT)
				winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/jatutert/Windows-Config/refs/heads/main/Powershell/VM-OOBE-Winget-Install-APPS-V001.ps1"
				#	Download Bestanden en CMD Scripts (JT)
				winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/jatutert/Windows-Config/refs/heads/main/Powershell/VM-Download-V002.ps1"
				#	Installatie Applicaties (Powershell 7) (JT)
				winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/jatutert/Windows-Config/refs/heads/main/Powershell/VM-OOBE-Application-Install-V001.ps1"
			end
			#
			#	Windows Server initialisatie
			#
			if machine[:os] == "windows" && machine[:osedition] == "server"
				#	Windows Services Stoppen en disabelen (JT)
				winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/jatutert/Windows-Config/main/Powershell/VM-OOBE-Config-Services-V006.ps1"
				#	Windows SSH Client / SSH Server installatie (JT) 
				winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/jatutert/Windows-Config/refs/heads/main/Powershell/VM-OOBE-Config-SSH-V003.ps1"
				#	Installatie WinGET (Asheroto) (steeds nieuwste versie van het script)
				winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/asheroto/winget-install/master/winget-install.ps1"
				#	WinGET Accept License Terms (JT)
				winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/jatutert/Windows-Config/refs/heads/main/Powershell/VM-OOBE-WinGET-Accept-Terms-V001.ps1"
				#	Download Bestanden (JT)
				winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/jatutert/Windows-Config/refs/heads/main/Powershell/VM-Download-V001.ps1"
				#	Installatie Applicaties (Powershell 7) (JT)
				winnode.vm.provision "shell", path: "https://raw.githubusercontent.com/jatutert/Windows-Config/refs/heads/main/Powershell/VM-OOBE-Application-Install-V001.ps1"
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