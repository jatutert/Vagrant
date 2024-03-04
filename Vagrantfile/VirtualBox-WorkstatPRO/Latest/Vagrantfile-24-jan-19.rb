# -*- mode: ruby -*-
# vi: set ft=ruby :
#
#
#
#
=begin

Vagrant Configuratie for Oracle Virtualbox and VMware Workstation/Fusion PRO hypervisors
Vagrant is copyrighted by Hashicorp (www.vagrantup.com)

(C) Copyright 2023 JA Tutert

This configuration may only be used for private use or education use. Business/commercial use is prohibited. 
It is intended for use with virtual machines on a hypervisor and thus not for configuration of bare-metal or cloud machines.

Linux boxes tested with Vagrant version 2.3.7 (and higher) and Vagrant VMware Utility 1.0.22 
Windows boxes only run with Vagrant version 2.4.0 (security error with Vagrant version 2.3.7)

Legenda Boxes:

POV		provider	Oracle Virtualbox
PVD		provider	VMWare Workstation / Fusion PRO
PDR		provider	Docker
PMH		provider	Microsoft Hyper-V

ULD		Ubuntu Linux desktop
ULS		Ubuntu Linux server
ALD		Alpine Linux Desktop
ALS		Alpine Linux Server

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
versie_vagrantfile = "2024-01-16"
#
#
#	Aanmaken variable met huidige datum 
#
require 'date'
cur_date = Date.today
#
#
#	Weergeven melding
#
#
puts "Using VAGRANTFILE version #{versie_vagrantfile} by John Tutert (for private or educational use only!)"
#
#
# ############################################ [Declaratie Virtuele Machines] ##########################################
#
#
linux_machines=[
	#
	#	Ubuntu 20.04.x LTS Focal Fossa (release 23 april 2020) (EOS April 2025) (EOL April 2030)
	#
	#	Provider: VMware
	#
	{
        :hostname => "uls-2004-s-001",
        :weergavenaam => "pvd-uls-2004-S-001",
		:box => "generic/ubuntu2004",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2004, 
		:aanbieder => "VMware",
        :ram => 2048,
        :cpu => 2,
	},
	{
        :hostname => "uls-2004-m-001",
		:weergavenaam => "pvd-uls-2004-M-001",
        :box => "generic/ubuntu2004",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2004, 
		:aanbieder => "VMware",
		:ram => 4096,
        :cpu => 2,
    },
	{
		:hostname => "uls-2004-l-001",
		:weergavenaam => "pvd-uls-2004-L-001",
		:box => "generic/ubuntu2004",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2004, 
		:aanbieder => "VMware",
		:ram => 8192,
		:cpu => 2,
    },
	{
		:hostname => "uls-2004-xl-001",
		:weergavenaam => "pvd-uls-2004-XL-001",
		:box => "generic/ubuntu2004",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2004, 
		:aanbieder => "VMware",
		:ram => 16384,
		:cpu => 2,
    },
	#
	#	Ubuntu 22.04.x LTS Jammy Jellyfish (release 23 februari 2023) (EOS April 2027) (EOL April 2032) 
	#
	#	Provider VMware
	#
    {
        :hostname => "uls-2204-s-001",
		:weergavenaam => "pvd-uls-2204-S-001",
        :box => "generic/ubuntu2204",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2204, 
		:aanbieder => "VMware",
        :ram => 2048,
        :cpu => 2,
    },
	{
        :hostname => "uls-2204-m-001",
		:weergavenaam => "pvd-uls-2204-M-001",
        :box => "generic/ubuntu2204",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2204, 
		:aanbieder => "VMware",
        :ram => 4096,
        :cpu => 2,
    },	
	{
		:hostname => "uls-2204-l-001",
		:weergavenaam => "pvd-uls-2204-L-001",
		:box => "generic/ubuntu2204",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2204, 
		:aanbieder => "VMware",
		:ram => 8192,
		:cpu => 2,
    },
	{
		:hostname => "uls-2204-xl-001",
		:weergavenaam => "pvd-uls-2204-XL-001",
		:box => "generic/ubuntu2204",
		:os => "ubuntu",
		:osedition => "desktop",
		:osversie => 2204, 
		:aanbieder => "VMware",
		:ram => 16384,
		:cpu => 2,
	},
	#
	#	Docker Demo 
	#
	{
		:hostname => "ulx-s-2204-l-d-001",
		:weergavenaam => "DEMO-Docker-CE",
		:box => "generic/ubuntu2204",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2204, 
		:aanbieder => "VMware",
		:ram => 8192,
		:cpu => 2,
    },
	#
	# Kubernetes MiniKube K8S demo 
	#
	{
		:hostname => "ulx-s-2204-xl-k-001",
		:weergavenaam => "DEMO-K8S",
		:box => "generic/ubuntu2204",
		:os => "ubuntu",
		:osedition => "server",
		:osversie => 2204, 
		:aanbieder => "VMware",
		:ram => 16384,
		:cpu => 2,
    },
	#
	#	Ansible Demo 
	#
	#	Controller 001
	#
	{
		:hostname => "ulx-s-2204-l-a-001",
		:weergavenaam => "DEMO-A-Controller",
		:box => "generic/ubuntu2204",
		:os => "ubuntu",
		:osedition => "desktop",
		:osversie => 2204, 
		:aanbieder => "VMware",
		:ram => 8192,
		:cpu => 2,
    },
	#
	#	Slave #1 (010)
	#
	{
		:hostname => "ulx-s-2204-l-a-010",
		:weergavenaam => "DEMO-A-TARGET-001",
		:box => "generic/ubuntu2204",
		:os => "ubuntu",
		:osedition => "desktop",
		:osversie => 2204, 
		:aanbieder => "VMware",
		:ram => 8192,
		:cpu => 2,
    },
	#
	#	Slave #2 (011) 
	#
	{
		:hostname => "ulx-s-2204-l-a-011",
		:weergavenaam => "DEMO-A-TARGET-002",
		:box => "generic/ubuntu2204",
		:os => "ubuntu",
		:osedition => "desktop",
		:osversie => 2204, 
		:aanbieder => "VMware",
		:ram => 8192,
		:cpu => 2,
    }	
	#
    ]
#
#
#
#
windows_machines=[
	#
	#
	#	################################
	#	Windows 10 Enterprise Evaluation
	#	################################
	#
	#
	#	##############
	#	gusztavvargadr
	#	##############
	#
	#
	{
		:hostname => "ow10eval",
        :box => "gusztavvargadr/windows-10",
		:os => "windows",
		:osedition => "desktop",
		:osversie => 10, 
		:aanbieder => "Oracle",
        :ram => 8192,
        :cpu => 2
	},
	{
        :hostname => "vw10eval",
        :box => "gusztavvargadr/windows-10",
		:os => "windows",
		:osedition => "desktop",
		:osversie => 10, 
		:aanbieder => "VMware",
        :ram => 8192,
        :cpu => 2
	},
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
		:hostname => "ow11eval",
        :box => "gusztavvargadr/windows-11",
		:os => "windows",
		:osedition => "desktop",
		:osversie => 11, 
		:aanbieder => "Oracle",
        :ram => 8192,
        :cpu => 2
	},
	{
        :hostname => "vw11eval",
        :box => "gusztavvargadr/windows-11",
		:os => "windows",
		:osedition => "desktop",
		:osversie => 11, 
		:aanbieder => "VMware",
        :ram => 8192,
        :cpu => 2
	}
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
$terraform_install = <<SCRIPT
	#
	# Aanmaken HashiCorp Terraform installatie Script
	#
	#! /bin/bash
	#
	# mkdir /home/vagrant/scripts/terraform_scripts > /dev/null 2>&1
	#
	# create script 
	echo '#!/bin/bash' > /home/vagrant/scripts/terraform_scripts/terraform-linux-install.sh
	echo 'sudo snap install terraform' >> /home/vagrant/scripts/terraform_scripts/terraform-linux-install.sh
	#
	sudo chmod +x /home/vagrant/scripts/terraform_scripts/terraform-linux-install.sh
SCRIPT
#
#
# 	[1d] Script die bij provision virtuele machine met meer dan 8 GB RAM worden uitgevoerd
#
# 	[1d-1] 	minio_installatie [native install minio / niet voor minikube of kubernetes ] 
#
#
$minio_linux_run = <<SCRIPT
	#
	#
	#	MinIO Object Storage installatie op Linux (manier 3) 
	#	Handleiding: https://min.io/docs/minio/linux/index.html
	#  
	# 
	# Naslag: 
	# https://www.digitalocean.com/community/tutorials/how-to-set-up-minio-object-storage-server-in-standalone-mode-on-ubuntu-20-04
	# https://gist.github.com/kstevenson722/e7978a75aec25feaa6ad0965ec313e2d
	#
	#
	#! /bin/bash
	#
	# create script
	#
	#	[Header]
			echo '#! /bin/bash' > /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo '#' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo '# MinIO Native Installatie' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo '# (c) 2023 John Tutert' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo '#' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo '# Toevoegen Repository' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
	# 	[MinIO Server Installatie]
			echo 'mkdir -p /home/vagrant/tmp' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo 'curl -s -o /home/vagrant/tmp/minio_20230920224955.0.0_amd64.deb https://dl.min.io/server/minio/release/linux-amd64/minio_20230920224955.0.0_amd64.deb' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo 'sudo dpkg -i /home/vagrant/tmp/minio_20230920224955.0.0_amd64.deb' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo 'rm /home/vagrant/tmp/minio_20230920224955.0.0_amd64.deb' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
	# 	[MinIO Groepen/Gebruikers]
			echo sudo groupadd -r minio-user >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo sudo useradd -M -r -g minio-user minio-user >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
	# 	[MinIO Storage Folder]
			echo sudo mkdir /mnt/data >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo sudo chown minio-user:minio-user /mnt/data >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
	# 	[MinIO Configuratie]
			echo 'echo MINIO_VOLUMES="/mnt/data" >> /etc/default/minio' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo 'echo MINIO_OPTS="--certs-dir /home/vag.rant/.minio/certs --console-address :9001" >> /etc/default/minio' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo 'echo MINIO_ROOT_USER=minioadmin >> /etc/default/minio' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo 'echo MINIO_ROOT_PASSWORD=minioadmin >> /etc/default/minio' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
	# 	[MinIO UFW poorten openzetten]
			echo sudo ufw allow 9000:9001/tcp >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
	# 	[Starten MinIO Server]
			echo sudo systemctl start minio >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo sudo systemctl enable minio >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
	# 	[MinIO Client Installatie]
			echo 'mkdir -p /home/vagrant/tmp' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo 'curl -s -o /home/vagrant/tmp/mcli_20230920152231.0.0_arm64.deb https://dl.min.io/client/mc/release/linux-amd64/mcli_20230920152231.0.0_arm64.deb' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo 'sudo dpkg -i /home/vagrant/tmp/mcli_20230920152231.0.0_arm64.deb' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			echo 'rm /home/vagrant/tmp/mcli_20230920152231.0.0_arm64.deb' >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
	# 	[KubeCTL MinIO Plugin]
			#
			# 	https://min.io/docs/minio/kubernetes/upstream/reference/kubectl-minio-plugin.html
			#	https://www.origo.io/info/stabiledocs/guides/minio-object-storage-service/
			#	echo wget https://github.com/minio/operator/releases/download/v5.0.6/kubectl-minio_5.0.6_linux_amd64 -O kubectl-minio >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			#	echo chmod +x kubectl-minio >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			#	echo sudo mv kubectl-minio /usr/local/bin/ >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			#
			# 	https://www.olivercoding.com/2021-03-01-kubernetes-minio-init/
			# 	echo kubectl create namespace minio-operator >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			# 	echo kubectl minio init --namespace minio-operator >> /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
			#
	sudo chmod +x /home/vagrant/scripts/minio_scripts/minio-linux-run.sh
SCRIPT
#
#
# 	[1d-2] 	MicroK8S (Kubernetes voor desktops/laptops) installatie 
#
#
$microK8S_install = <<SCRIPT
	#
	#
	#! /bin/bash
	#
	# create script 
	echo '#! /bin/bash' > /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	echo 'echo MicroK8S KubeCTL KubeADM Installation Script' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	echo 'echo WARNING !' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	echo 'echo This virtual machine will be rebooted at the end of this script !'  >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	#
	#	[1] Installatie MicroK8S versie 1.28 (UpStream Kubernetes) 16 augustus 2023
	#
	echo 'sudo snap install microk8s --classic --channel=latest > /dev/null 2>&1'	>> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	#
	#	[2] Configuratie Firewall 
	#
	echo 'sudo ufw allow in on cni0 > /dev/null 2>&1' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	echo 'sudo ufw allow out on cni0 > /dev/null 2>&1' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	echo 'sudo ufw default allow routed > /dev/null 2>&1' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	#
	#	[3] Gebruiker Vagrant toevoegen aan groep
	#
	echo 'sudo usermod -a -G microk8s vagrant' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	#
	#	[4] Directory Kube 
	#
	echo 'sudo mkdir /home/vagrant/.kube' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	echo 'sudo chown -f -R vagrant ~/.kube' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	#
	#	[5] Configuratie KubeCTL MicroK8S
	#	https://anaisurl.com/kubernetes-kubectl-microk8s/
	#
	echo 'sudo microk8s config > /home/vagrant/.kube/config' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	#
	#	[6] Installatie KubeCTL
	#	https://anaisurl.com/kubernetes-kubectl-microk8s/
	#
	echo 'sudo snap install kubectl --classic --channel=latest > /dev/null 2>&1' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	#
	#	[7]	Configuratie KubeCTL
	#
	echo 'kubectl config use-context microk8s --kubeconfig="/home/vagrant/.kube/config"' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	#
	#	[8] Installatie KubeAdm
	#
	echo 'sudo snap install kubeadm --classic --channel=latest > /dev/null 2>&1' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	#
	#	[8] Enable van Add-Ons op MicroK8S
	echo 'sudo microk8s enable dashboard' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	# echo 'sudo microk8s enable dns' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	# echo 'sudo microk8s enable hostpath-storage' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	#
	#	[9] DEMO Deployment van NGINX op MicroK8S
	#	https://thenewstack.io/kubernetes-101-deploy-your-first-application-with-microk8s/
	#
	echo '#! /bin/bash' > /home/vagrant/microk8s_demos/nginx/microK8s_nginx_webserver.sh
	echo 'cd /home/$USER' >> /home/vagrant/microk8s_demos/nginx/microK8s_nginx_webserver.sh
	echo 'clear' >> /home/vagrant/microk8s_demos/nginx/microK8s_nginx_webserver.sh
	#
	echo 'kubectl get nodes' >> /home/vagrant/microk8s_demos/nginx/microK8s_nginx_webserver.sh
	echo 'kubectl get pods' >> /home/vagrant/microk8s_demos/nginx/microK8s_nginx_webserver.sh
	echo 'kubectl create deployment nginx-webserver --image=nginx' >> /home/vagrant/microk8s_demos/nginx/microK8s_nginx_webserver.sh
	echo 'kubectl expose deployment nginx-webserver --type="NodePort" --port 80' >> /home/vagrant/microk8s_demos/nginx/microK8s_nginx_webserver.sh
	echo 'kubectl get pods' >> /home/vagrant/microk8s_demos/nginx/microK8s_nginx_webserver.sh
	echo 'kubectl get svc nginx-webserver' >> /home/vagrant/microk8s_demos/nginx/microK8s_nginx_webserver.sh
	chmod +x /home/vagrant/microk8s_demos/nginx/microK8s_nginx_webserver.sh
	#
	#	[10] DEMO Deployment van NGINX op MicroK8S met 4 replicas 
	#	https://kubernetes.io/docs/tasks/run-application/run-stateless-application-deployment/
	#
	curl -s -o /home/vagrant/microk8s_demos/nginx/deployment-scale.yaml https://raw.githubusercontent.com/kubernetes/website/main/content/en/examples/application/deployment-scale.yaml
	#
	echo '#! /bin/bash' > /home/vagrant/microk8s_demos/nginx/microK8s_nginx_4_replicas.sh
	echo 'cd /home/$USER' >> /home/vagrant/microk8s_demos/nginx/microK8s_nginx_4_replicas.sh
	echo 'clear' >> /home/vagrant/microk8s_demos/nginx/microK8s_nginx_4_replicas.sh
	#
	echo 'kubectl apply -f /home/vagrant/microk8s_demos/nginx/deployment-scale.yaml' >> /home/vagrant/microk8s_demos/nginx/microK8s_nginx_4_replicas.sh
	echo 'kubectl expose deployment nginx-deployment --type="NodePort" --port 80' >> /home/vagrant/microk8s_demos/nginx/microK8s_nginx_4_replicas.sh
	echo 'kubectl get svc nginx-deployment' >> /home/vagrant/microk8s_demos/nginx/microK8s_nginx_4_replicas.sh
	#
	chmod +x /home/vagrant/microk8s_demos/nginx/microK8s_nginx_4_replicas.sh
	#
	#	[11] DEMO Deployment van MySQL 
	#	https://kubernetes.io/docs/tasks/run-application/run-single-instance-stateful-application/
	#
	curl -s -o /home/vagrant/docker-compose/mysql/mysql-pv.yaml https://raw.githubusercontent.com/kubernetes/website/main/content/en/examples/application/mysql/mysql-pv.yaml
	curl -s -o /home/vagrant/docker-compose/mysql/mysql-deployment.yaml https://raw.githubusercontent.com/kubernetes/website/main/content/en/examples/application/mysql/mysql-deployment.yaml
	#
	echo '#! /bin/bash' > /home/vagrant/microk8s_demos/mysql/microK8s_mysql_single.sh
	echo 'cd /home/$USER' >> /home/vagrant/microk8s_demos/mysql/microK8s_mysql_single.sh
	echo 'clear' >> /home/vagrant/microk8s_demos/mysql/microK8s_mysql_single.sh
	#
	# Deploy the PV and PVC of the YAML file
	echo 'kubectl apply -f /home/vagrant/docker-compose/mysql/mysql-pv.yaml' > /home/vagrant/microk8s_demos/mysql/microK8s_mysql_single.sh
	# Deploy the contents of the YAML file
	echo 'kubectl apply -f /home/vagrant/docker-compose/mysql/mysql-deployment.yaml' >> /home/vagrant/microk8s_demos/mysql/microK8s_mysql_single.sh
	#
	echo 'kubectl describe deployment mysql' >> /home/vagrant/microk8s_demos/mysql/microK8s_mysql_single.sh
	echo 'kubectl describe pvc mysql-pv-claim' >> /home/vagrant/microk8s_demos/mysql/microK8s_mysql_single.sh
	#
	echo 'kubectl get pods -l app=mysql' >> /home/vagrant/microk8s_demos/mysql/microK8s_mysql_single.sh
	#
	chmod +x /home/vagrant/microk8s_demos/mysql/microK8s_mysql_single.sh
	#
	#	Herstarten om autorisatie MicroK8S voor gebruiker vagrant te laden
	#
	echo 'echo Restart of this virtual machine started' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	echo 'echo use vagrant ssh $HOSTNAME after reboot to return to virtual machine again' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	echo 'sudo shutdown -r now' >> /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
	#
	sudo chmod +x /home/vagrant/scripts/microk8s_scripts/microK8s-linux-install.sh
SCRIPT
#
#
# 	[1d-2] 	MinIO ADD-ON op MicroK8S enable 
#
#
$minio_microk8s_config = <<SCRIPT
	#
	#! /bin/bash
	#
	# create script 
	echo 'sudo microk8s enable minio ' >> /home/vagrant/scripts/minio_scripts/minio_microk8s_config.sh
	sudo chmod +x /home/vagrant/scripts/minio_scripts/minio_microk8s_config.sh
SCRIPT
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
$winget_installatie = <<SCRIPT
	# REM powershell -ExecutionPolicy Unrestricted 
	# REM powershell -file ps-winget.ps1
SCRIPT
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
			if #{ENV['OS']} == "Windows_NT" 
				ulxnode.vm.synced_folder "#{ENV['USERPROFILE']}",            "/home/#{ENV['USERNAME']}/userprofile"
				ulxnode.vm.synced_folder "#{ENV['USERPROFILE']}//Downloads", "/home/#{ENV['USERNAME']}/downloads"
				ulxnode.vm.synced_folder "#{ENV['USERPROFILE']}//Documents", "/home/#{ENV['USERNAME']}/documents"
				ulxnode.vm.synced_folder "#{ENV['TMP']}",                    "/home/#{ENV['USERNAME']}/tmp"
				ulxnode.vm.synced_folder "#{ENV['PUBLIC']}",                 "/home/#{ENV['USERNAME']}/public"
				# demo_node.vm.synced_folder "#{ENV['OneDriveCommercial']}",     "/home/#{ENV['USERNAME']}/OneDriveCommercial"
				# demo_node.vm.synced_folder "#{ENV['OneDriveConsumer']}",       "/home/#{ENV['USERNAME']}/OneDriveConsumer"
			end 
			#
			#
			# ####################################################################
			#
			#						POST UP MESSAGE
			#
			# ####################################################################
			#
			ulxnode.vm.post_up_message = "// ETH0 is NAT // ETH1 is Host-Only // Gebruik ETH1 voor Ansible"
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
					ulxnode_pvd_vmwvm.vmx["tools.syncTime"] = "TRUE"
					ulxnode_pvd_vmwvm.vmx["displayName"] = "#{machine[:hostname]}"
					ulxnode_pvd_vmwvm.vmx["annotation"] = "#{machine[:os]} #{machine[:osversie]} |0D|0AUsed box is #{machine[:box]} |0D|0ACreated on #{cur_date} by Vagrant |0D|0AUsername/Password = vagrant |0D|0AUse VAGRANT up #{machine[:hostname]} to boot this virtual machine"
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
				# linux_distributie==$(lsb_release -is)
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
			ulxnode.vm.provision "shell", inline: <<-SHELL
				#
				#
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
				#
			SHELL
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
				#	sudo curl -s -o /home/vagrant/wsl2-config-latest.sh https://raw.githubusercontent.com/jatutert/Ubuntu-Config/main/wsl2-config-latest.sh
				#	sudo chmod +x /home/vagrant/wsl2-config-latest.sh
				# 	Versie 2 (status: productie) 
				sudo curl -s -o /home/vagrant/ubuntu-config-latest.sh https://raw.githubusercontent.com/jatutert/Ubuntu-Config/main/ubuntu-config-latest.sh
				sudo chmod +x /home/vagrant/ubuntu-config-latest.sh
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
			winnode.vm.box = machine[:box]
			winnode.vm.box_check_update = true
			#
			winnode.vm.hostname 		= 	"Vagrant-#{machine[:hostname]}"
			winnode.vm.guest 			= 	:windows
			winnode.vm.boot_timeout 	= 	18000
			#
			winnode.winssh.shell 		= 	"cmd" 		# The shell to use when executing SSH commands from Vagrant. By default this is powershell. Valid values are "cmd" or "powershell".		
			#
			#	winnode.ssh.username 		= "vagrant"
			#	winnode.ssh.password 		= "vagrant"
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
			# node.vm.network "public_network", bridge: "VMware Virtual Ethernet Adapter for VMnet8"
			# node.vm.network "public_network", bridge: "Ethernet"
			#
			#	Port-Forwarding
			#
			winnode.vm.network :forwarded_port, guest: 3389, host: 53389, auto_correct: true
			# node.vm.network "forwarded_port", guest: 3389, host: 3389, id: "rdp", auto_correct: true  [automatisch aan]
			# node.vm.network "forwarded_port", guest: 5985, host: 5985, id: "winrm", auto_correct: true [automatisch aan]
			#
			# ####################################################################
			#
			#
			# ####################################################################	
			#	WinRM
			#
			winnode.vm.communicator 	= 	"winrm" 	# standaard is ssh windows moet naar winrm
			# vw1Xeval.winrm.username = "IEUser"
			# vw1Xeval.winrm.password = "Passw0rd!"
			# vw1Xeval.winrm.host = "localhost"  	# The hostname or IP to connect to the WinRM service
			winnode.winrm.max_tries 	= 	300 			# The maximum number of times to retry opening a shell after failure. This defaults to 20.
			winnode.winrm.retry_delay 	= 	2 			# The amount of time to wait between retries and defaults to 2 seconds.
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
					win_node_vmwvm.vmx["displayName"] 		= 	"Vagrant-#{machine[:weergavenaam]}"
					win_node_vmwvm.vmx["annotation"] 		= 	"Vagrant-#{machine[:hostname]} |0D|0AUbuntu 22.04.02 LTS |0D|0A |0D|0AUsername/Password = vagrant"
				end
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