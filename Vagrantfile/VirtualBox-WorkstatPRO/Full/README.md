# Vagrant Install

Download Vagrant 2.4.0 from https://developer.hashicorp.com/vagrant/downloads

Download Vagrant VMware Plugin from https://developer.hashicorp.com/vagrant/downloads/vmware

Installation steps:
1. Install Vagrant 2.4.0 and reboot Windows or macOS. 
2. Install Vagrant VMware Plugin 1.0.22 
3. Go to Terminal

```shell
vagrant plugin install vagrant-vmware-desktop
vagrant plugin update vagrant-vmware-desktop
exit
```

Terminal must be closed to load the environment variables

4. Go to Terminal

```shell
vagrant init
exit
```

5. Download vagranfile and store this file in c:\users\[username\ for Windows.

Replace the existing one with the downloaded !  

6. Start the fun !

For Example: 

```shell
vagrant up pvd-uld-2204-GC-L
```

7. Shutting down

```shell
exit
vagrant halt pvd-uld-2204-GC-L
```

# Vagrant Configuration File
The vagrant configuration file is intended for personal/educational use and NOT for commerical/business use. 

The configuration file (version 4.0) contains the definition of the following virtual machines:
- (uld-2004-GC) Ubuntu 20.04 
	- based on generic/ubuntu2004 (https://app.vagrantup.com/generic/boxes/ubuntu2004)
- (uld-2204-GC) Ubuntu 22.04.02 LTS 
	- based on generic/ubuntu2204 (https://app.vagrantup.com/generic/boxes/ubuntu2204) 
- (uld-2210-GC) Ubuntu 22.10 
	- based on generic/ubuntu2210 (https://app.vagrantup.com/generic/boxes/ubuntu2210)
- (uld-2210-MN) Ubuntu 22.10 
	- based on maroskukan/ubuntu2304 (https://app.vagrantup.com/maroskukan/boxes/ubuntu2210) 
- (uld-2304-MN) Ubuntu 23.04 
	- based on maroskukan/ubuntu2304 (https://app.vagrantup.com/maroskukan/boxes/ubuntu2304) 
- (__w10eval__) Windows 10 Enterprise Evaluation
	- based on gusztavvargadr/windows-10 (https://app.vagrantup.com/gusztavvargadr/boxes/windows-10) 
	- you will need Vagrant 2.3.8 DEV for this virtual machine to run (NOT TESTED)
- (__w11eval__) Windows 11 Enterprise Evaluation
	- based on gusztavvargadr/windows-11 (https://app.vagrantup.com/gusztavvargadr/boxes/windows-11) 
	- You will need Vagrant 2.3.8 DEV for this virtual machine to run (NOT TESTED)

 
### VMware Workstation / Fusion PRO (start with pvd) 
- Vagrant up pvd-uld-2004-GC- S/M/L (S = 2 Gb RAM | M = 4 Gb RAM | L = 8 Gb RAM) 
- Vagrant up pvd-uld-2204-GC- S/M/L (S = 2 Gb RAM | M = 4 Gb RAM | L = 8 Gb RAM)
- Vagrant up pvd-uld-2210-GC- S/M/L (S = 2 Gb RAM | M = 4 Gb RAM | L = 8 Gb RAM)
- Vagrant up pvd-uld-2210-MN- S/M/L (S = 2 Gb RAM | M = 4 Gb RAM | L = 8 Gb RAM)
- Vagrant up pvd-uld-2304-MN- S/M/L (S = 2 Gb RAM | M = 4 Gb RAM | L = 8 Gb RAM)
- Vagrant up pvd-uld-2304-MN- S/M/L (S = 2 Gb RAM | M = 4 Gb RAM | L = 8 Gb RAM)
- Vagrant up pvd-uls-2004-GR-L
- Vagrant up pvd-intro-infra-web-srv
- Vagrant up pvd-intro-infra-db-srv
- Vagrant up vw10eval
- Vagrant up vw11eval

### Oracle VirtualBox (start with pov)
- Vagrant up pov-uld-2004-GC- S/M/L (S = 2 Gb RAM | M = 4 Gb RAM | L = 8 Gb RAM)
- Vagrant up pov-uld-2204-GC- S/M/L (S = 2 Gb RAM | M = 4 Gb RAM | L = 8 Gb RAM) 
- Vagrant up pov-uld-2210-GC- S/M/L (S = 2 Gb RAM | M = 4 Gb RAM | L = 8 Gb RAM)
- Vagrant up pov-uld-2210-MN- S/M/L (S = 2 Gb RAM | M = 4 Gb RAM | L = 8 Gb RAM)
- Vagrant up pov-uld-2304-MN- S/M/L (S = 2 Gb RAM | M = 4 Gb RAM | L = 8 Gb RAM)
- Vagrant up pov-uls-2004-GR-L
- Vagrant up ow10eval
- Vagrant up ow11eval

## Docker

All the M and L editions of the virtual machines above are running Docker-CE with Compose plugin. 

## Minikube

All the M and L editions of the virtual mahcines above have a script to install Minikube. 
Minikube uses Docker for cluster. 

## More Info

Vagrant configuration files go to https://developer.hashicorp.com/vagrant/docs) 

## License / Copyright / Trademarks 
- Vagrant by Hashicorp (hashicorp.com) 
- Virtualbox by Oracle Corporation (oracle.com) 
- VMware by VMware Company (vmware.com)
- Windows by Microsoft (microsoft.com)

All references to and quotations from external sources are licensed and/or copyright the respective owners. 
I make no claim to ownership of these sources. 
References to and quotations from these sources have been used on the basis of assumption of reasonableness and fair use. 
To my knowledge, no copyright or other rights have been infringed. 
If it is believed that references to and/or quotations from certain external sources violate any rules, rights or interests, please contact.
