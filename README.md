# Vagrant Install

Installing and configuring Vagrant on your own laptop and/or PC may seem complicated, but it is not at all. 

To get Vagrant working, you need to perform 7 steps. I have described these 7 steps below. 
I myself work with Vagrant within Windows. Hopefully I have described all steps for MACos correctly. If not, please let me know ! 

I make the assumption that VMware Workstation Pro or VMware Fusion Pro is installed. If not, this should be done first. 
VMware Workstation Pro and VMWare Fusion Pro is now free for personal use. So that shouldn't be a problem. 

VMWare Workstation 17.6 Pro for Windows [Download](https://support.broadcom.com/group/ecx/downloads)

VMware Workstation 17.6 Pro for Linux [Download](https://support.broadcom.com/group/ecx/downloads)

VMware Fusion 13.6 Pro for MACos [Download](https://support.broadcom.com/group/ecx/downloads)

## [Step 1] Downloading the software

### Windows 

Download Vagrant 2.4.3 [Download](https://releases.hashicorp.com/vagrant/2.4.3/vagrant_2.4.3_windows_amd64.msi)

Download Vagrant VMware Plugin [Download](https://releases.hashicorp.com/vagrant-vmware-utility/1.0.23/vagrant-vmware-utility_1.0.23_windows_amd64.msi)

### MacOS

Download Vagrant 2.4.3 [Download](https://releases.hashicorp.com/vagrant/2.4.3/vagrant_2.4.3_darwin_amd64.dmg)

Download Vagrant VMware Plugin [Download](https://releases.hashicorp.com/vagrant-vmware-utility/1.0.23/vagrant-vmware-utility_1.0.23_darwin_amd64.dmg)

## [Step 2a] Installation of Vagrant

Install Vagrant 2.4.3 and reboot your laptop or PC (**don't skip the reboot!**] 

Just click Next, Next, Finish during the installation (default settings). 

## [Step 3] Installation of VMware Plugin

Install Vagrant VMware Plugin (this time no reboot is needed !)  

Just click Next, Next, Finish during the installation. 

## [Step 4] Configuration

Start Terminal 

### Windows 
```shell
setx /M VAGRANT_DEFAULT_PROVIDER "vmware_desktop"
setx /M VAGRANT_EXPERIMENTAL "1"
setx /M VAGRANT_SUPPRESS_GO_EXPERIMENTAL_WARNING "1"
setx /M VAGRANT_VAGRANTFILE "Vagrantfile-latest.rb"
exit
```
Configure VMWare Workstation PRO (or Fusion PRO) to be the default hypervisor for the virtual machines. 

I want to use the latest options of Vagrant, so i set the Experimental settings to ON using 1. 

The default name of the vagrantfile is set to Vagrantfile-latest.rb. 

It is very important to close the terminal. Otherwise the settings are not loaded !

### Windows 
```shell
setx VAGRANT_CWD "C:\Users\ [your username]  "
setx VAGRANT_VMWARE_CLONE_DIRECTORY "x:\Directory of your choice where virtual machines should be stored"
setx VAGRANT_HOME "x:\Directory of your choice where Vagrant stores the settings and downloaded boxes"
exit
```
The VAGRANT_CWD is the location where VAGRANT searches for the vagrantfile (the configuration file for Vagrant). 

The VAGRANT_VMWARE_CLONE_DIRECTORY is the location where VAGRANT stores the created virtual machines by Vagrant. 

Examples:

setx VAGRANT_CWD "C:\Users\John" (I use my standard user directory for this)

setx VAGRANT_VMWARE_CLONE_DIRECTORY "D:\VirtualMachines\Vagrant" (I want to store the virtual machines on drive D:) 

It is very important to close the terminal. Otherwise the settings are not loaded ! 

More information at [Vagrant Docs](https://developer.hashicorp.com/vagrant/docs/other/environmental-variables)

## [Step 5] Initialization (Windows/MACos)

```shell
del %userprofile%\Vagrantfile-latest.rb
vagrant init
exit
```

## [Step 6] VMware Desktop Plugin installation (Windows/MACos)

```shell
vagrant plugin install vagrant-vmware-desktop
exit
```
Terminal must be closed to load the environment variables


## [Step 7] Replace Vagrantfile

Download [My Custom](https://github.com/jatutert/Vagrant/blob/main/Vagrantfile/VirtualBox-WorkstatPRO/Latest/Vagrantfile-latest.rb) Vagrantfile.

Put this file in the folder Downloads (Windows). 

### Windows 

Remove the default vagrantfile

```shell
del %HOMEDRIVE%\vagrantfil*.*
exit
```

Replace the default vagrantfile with the one i created

```shell
copy %HOMEDRIVE%\Downloads\Vagrantfile-latest.rb %HOMEDRIVE%
exit
```

### MACos

```shell
del ~/vagrant.d/vagrantfil*.*
exit
```
! DON'T FORGET ! 
Store the custom vagrantfile (Vagrantfile-latest.rb) in ~/vagrant.d/

## [Step 8] Check Vagrant

```shell
vagrant global-status
exit
```
The message should be: 

* There are no active Vagrant environments on this computer! 

* Or, you haven't destroyed and recreated Vagrant environments that were started with an older version of Vagrant. 

## [Step 9] Adding Linux boxes (Windows/MACos)

Start terminal 

```shell
vagrant box add gusztavvargadr/ubuntu-server-2404-lts --clean --provider vmware_desktop
vagrant box add gusztavvargadr/ubuntu-desktop-2404-lts --clean --provider vmware_desktop
exit
```

The Linux boxes use about 4 gigabyte of diskspace per box. 

## [Step 10] Adding Windows boxes (Windows/MACos)

Start terminal 

```shell
vagrant box add xenov/windows-10 --clean --architecture amd64 --provider vmware_desktop --box-version 2202.1740574724
vagrant box add gusztavvargadr/windows-11 --clean --architecture amd64 --provider vmware_desktop
vagrant box add gusztavvargadr/windows-server-2022-standard --clean --architecture amd64 --provider vmware_desktop --box-version 2102.0.2503
exit
```

Each box takes about 5 to 10 minutes to download and install ! Time for a drink .. or snack .. or both ! 

The Windows boxes use about 15 gigabyte of diskspace per box. 

## Start the fun !

That was it then. You're all set with the installation and configuration of the environment. 
Let's start the fun ! 

### Ubuntu Server 24.04 LTS

#### Generic with 16 GB of RAM (XL = 16 GB, L = 8 GB, M = 4 GB, S = 2 GB)

```shell
vagrant up U24-LTS-S-BCV-XL-001
```

#### Docker 

```shell
vagrant up U24-LTS-S-DCKR-001
vagrant ssh U24-LTS-S-DCKR-001
sudo ~/ubuntu-config-V3-latest.sh docker
exit
vagrant ssh U24-LTS-S-DCKR-001
docker stop portainer
docker start portainer
ip addr show eth0
```

The ubuntu-config-V3-latest.sh script does the installation of the latest version of Docker within the box. 

Start your webbrowser and go to https://xxx.xxx.xxx.xxx:9443 (use the ip address from ETH0:)

For the password use something simple like Password1234

Use pwsh to start Microsoft Powershell 7.5.x within the box. 

Want to use Cockpit ? The go to https://xxx.xxx.xxx.xxx:1234 (use the ip address from ETH0:)

### Windows 10 Enterprise

#### Generic with 8 GB of RAM (XL = 16 GB, L = 8 GB, M = 4 GB, S = 2 GB)

```shell
vagrant up W10-ENT-D-B-XV-L001
```

Go to VMWare Workstation and login with the user vagrant and password vagrant

Right click on the START button and select Windows Powershell(Admin) 

```shell
cmd
winget update
Y
winget install Microsoft.PowerShell
winget install Microsoft.DotNet.DesktopRuntime.8
winget install Microsoft.WindowsTerminal
winget install Microsoft.VisualStudio.Code
winget install GNU.Nano
exit
exit
```

### Windows Server 2022 Standard

#### Generic with 8 GB of RAM (XL = 16 GB, L = 8 GB, M = 4 GB, S = 2 GB)

```shell
vagrant up W22-STD-S-B-GR-L001
```

Powershell 7 can also be installed within the Windows Server 2022 Standard virtual machine. 

Follow the instructions as described above under Windows 10.

## SSH into the virtual macine 

For Example: 

```shell
vagrant ssh W10-ENT-D-B-XV-L001
vagrant ssh W22-STD-S-B-GR-L001
```

## Shutting down

For Example: 

```shell
vagrant halt W10-ENT-D-B-XV-L001
vagrant halt W22-STD-S-B-GR-L001
```

## Remove Virtual machine 

For Example: 

```shell
vagrant halt W10-ENT-D-B-XV-L001
vagrant destroy W10-ENT-D-B-XV-L001 --force
```

## More Info

More information on Vagrant configuration files can be found on [Vagrant docs](https://developer.hashicorp.com/vagrant/docs)

## License / Copyright / Trademarks 
> - Vagrant by Hashicorp Inc. (hashicorp.com) 
> - Virtualbox by Oracle Corporation (oracle.com) 
> - VMware by VMware Company (vmware.com) / Broadcom (broadcom.com) 
> - Windows by Microsoft Corporation (microsoft.com)

Everything I describe is intended for personal or educational use. In my case, that is primarily educational use. 

All references to and quotations from external sources are licensed and/or copyright the respective owners. 
I make no claim to ownership of these sources. 
References to and quotations from these sources have been used on the basis of assumption of reasonableness and fair use. 
To my knowledge, no copyright or other rights have been infringed. 
If it is believed that references to and/or quotations from certain external sources violate any rules, rights or interests, please contact.
