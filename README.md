# Vagrant Install

Installing and configuring Vagrant on your own laptop and/or PC may seem complicated, but it is not at all. 

To get Vagrant working, you need to perform 7 steps. I have described these 7 steps below. 
I myself work with Vagrant within Windows. Hopefully I have described all steps for MACos correctly. If not, please let me know ! 

I make the assumption that VMware Workstation Pro or VMware Fusion Pro is installed. If not, this should be done first. 
VMware Workstation Pro and VMWare Fusion Pro is now free for personal use. So that shouldn't be a problem. 

## [Step 1] Downloading the software

### Windows 

Download Vagrant 2.4.1 using [this direct link](https://releases.hashicorp.com/vagrant/2.4.1/vagrant_2.4.1_windows_amd64.msi)

Download Vagrant VMware Plugin using [this direct link](https://releases.hashicorp.com/vagrant-vmware-utility/1.0.23/vagrant-vmware-utility_1.0.23_windows_amd64.msi)


### MacOS

Download Vagrant 2.4.1 using [this direct link](https://releases.hashicorp.com/vagrant/2.4.1/vagrant_2.4.1_darwin_amd64.dmg)

Download Vagrant VMware Plugin using [this direct link](https://releases.hashicorp.com/vagrant-vmware-utility/1.0.23/vagrant-vmware-utility_1.0.23_darwin_amd64.dmg)

## [Step 2] Installation

Install Vagrant 2.4.1 and reboot your laptop or PC (don't skip this reboot!] 

Install Vagrant VMware Plugin 1.0.22 (reboot if needed) 

## [Step 3] Activate the installed plugin

```shell
vagrant plugin install vagrant-vmware-desktop
exit
```
Terminal must be closed to load the environment variables

## [Step 4] Configuration

### Windows 
```shell
setx VAGRANT_VAGRANTFILE "Vagrantfile.rb"
setx VAGRANT_EXPERIMENTAL "1"
setx VAGRANT_SUPPRESS_GO_EXPERIMENTAL_WARNING "1"
setx VAGRANT_DEFAULT_PROVIDER "vmware_desktop"
setx VAGRANT_VMWARE_CLONE_DIRECTORY "x:\Directory of your choice where virtual machines should be stored"
exit
```

More information at [Vagrant Docs](https://developer.hashicorp.com/vagrant/docs/other/environmental-variables)

## [Step 5] Initialization (Windows/MACos)

```shell
vagrant init
exit
```

## [Step 6] Replace Vagrantfile

Download [My Custom](https://github.com/jatutert/Vagrant/blob/main/Vagrantfile/VirtualBox-WorkstatPRO/Latest/Vagrantfile-latest.rb) Vagrantfile.

### Windows 

```shell
del c:\users\[your username]\vagrantfil*.*
exit
```
Store the custom vagrantfile in c:\users\[username\

### MACos

```shell
del ~/vagrant.d/vagrantfil*.*
exit
```
Store the custom vagrantfile in ~/vagrant.d/

## [Step 7] Adding the boxes (Windows/MACos)

```shell
vagrant box add gusztavvargadr/ubuntu-server-2404-lts --clean --provider vmware_desktop
vagrant box add gusztavvargadr/windows-server-2022-standard --clean --provider vmware_desktop
vagrant box add gusztavvargadr/windows-11 --clean --provider vmware_desktop
exit
```
The Windows boxes use about 15 gigabyte of diskspace per box. 
The Linux box uses about 4 gigabyte of diskspace.
About 35 gigabytes of disk space is thus necessary for all boxes.

## Start the fun !

For Example: 

```shell
vagrant up u24-lts-s-wsrv-001
```

## Shutting down

For Example: 

```shell
vagrant halt u24-lts-s-wsrv-001
```

## More Info

Vagrant configuration files go to [Vagrant docs](https://developer.hashicorp.com/vagrant/docs)

## License / Copyright / Trademarks 
- Vagrant by Hashicorp Inc. (hashicorp.com) 
- Virtualbox by Oracle Corporation (oracle.com) 
- VMware by VMware Company (vmware.com) / Broadcom (broadcom.com) 
- Windows by Microsoft Corporation (microsoft.com)

Everything I describe is intended for personal or educational use. In my case, that is primarily educational use. 

All references to and quotations from external sources are licensed and/or copyright the respective owners. 
I make no claim to ownership of these sources. 
References to and quotations from these sources have been used on the basis of assumption of reasonableness and fair use. 
To my knowledge, no copyright or other rights have been infringed. 
If it is believed that references to and/or quotations from certain external sources violate any rules, rights or interests, please contact.
