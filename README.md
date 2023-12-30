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
