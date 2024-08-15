# Vagrant Install



## [Step 1] Download
Download Vagrant 2.4.1 from https://developer.hashicorp.com/vagrant/downloads

Download Vagrant VMware Plugin from https://developer.hashicorp.com/vagrant/downloads/vmware

## [Step 2] Installation

Install Vagrant 2.4.1 and reboot your laptop or PC 

Install Vagrant VMware Plugin 1.0.22 (reboot if needed) 

## [Step 3] Activate Plugin

```shell
vagrant plugin install vagrant-vmware-desktop
exit
```
Terminal must be closed to load the environment variables

## [Step 4] Configuration

Windows

```shell
setx VAGRANT_VAGRANTFILE "Vagrantfile.rb"
setx VAGRANT_EXPERIMENTAL "1"
setx VAGRANT_SUPPRESS_GO_EXPERIMENTAL_WARNING "1"
setx VAGRANT_DEFAULT_PROVIDER "vmware_desktop"
setx VAGRANT_VMWARE_CLONE_DIRECTORY "x:\Directory of your choice where virtual machines should be stored"
exit
```

## [Step 5] Initialization

```shell
vagrant init
exit
```

Download vagranfile and store this file in c:\users\[username\ for Windows.

Download from https://github.com/jatutert/Vagrant/blob/main/Vagrantfile/VirtualBox-WorkstatPRO/Latest/Vagrantfile-latest.rb

Replace the existing one with the downloaded !  


## [Step 6] Adding the boxes 

```shell
vagrant box add gusztavvargadr/ubuntu-server-2404-lts --clean --provider vmware_desktop
vagrant box add gusztavvargadr/windows-server-2022-standard --clean --provider vmware_desktop
vagrant box add gusztavvargadr/windows-11 --clean --provider vmware_desktop
exit
```

## Start the fun !

For Example: 

```shell
vagrant up u24-lts-s-wsrv-001
```

## Shutting down

```shell
vagrant halt u24-lts-s-wsrv-001
```

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
