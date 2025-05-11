::
::	Vagrant Start
@CLS
@ECHO OFF
@title Vagrant Start
::
::
:: NET SESSION >nul 2>&1
:: IF %ERRORLEVEL% EQU 0 (
::     ECHO Administrator PRIVILEGES Detected! 
:: ) ELSE (
::    ECHO Script NIET gestart met Adminstrator rechten ! 
::    PAUSE
:: 	exit /b
:: )
::
::
::
:hoofdmenu
::
@CLS
::
echo ===========================================================================
echo ==== Vagrant Start
echo ==== Versie 0.4 d.d. 10-09-2023
echo ===========================================================================
echo ====
echo ====	[1]	Starten Linux VM Oracle Virtualbox 
echo ==== 	[2]	Starten Windows VM Oracle Virtualbox
echo ==== 	[3]	Starten Linux VM VMware Workstation Pro
echo ==== 	[4]	Starten Windows VM VMWare Workstation Pro
echo ==== 	[5] 
echo ==== 	[6] 
echo ==== 	[7]	Installatie/Initialisatie Vagrant Omgeving (incl. hypervisors) 
echo ==== 	[8]	Downloaden Boxes 
echo ====
echo ==== 	[9]	Verlaten / Einde 
echo ====
echo ==== 	Maak uw keuze 
echo ====
::
choice /C:123456789 /N
set antwoord=%errorlevel%
::
if %antwoord%==9 exit /b
if %antwoord%==8 goto :vagrant_boxes_download
if %antwoord%==7 goto :vagrant_install
if %antwoord%==6 goto :hoofdmenu
if %antwoord%==5 goto :storeapps
if %antwoord%==4 goto :pvd-win
if %antwoord%==3 goto :pvd-ulx
if %antwoord%==2 goto :pov-win
if %antwoord%==1 goto :pov-ulx
goto :hoofdmenu
::
::
::	[1] Starten Linux VM Oracle Virtualbox
::
::
:pov-ulx
::
@CLS
::
echo ===========================================================================
echo ==== Vagrant Start 
echo ==== Submenu Starten Linux VM Oracle Virtualbox
echo ===========================================================================
echo ====
echo ==== 	[1]	Ubuntu 20.04 Focal Fossa LTS
echo ==== 	[2] Ubuntu 22.04 Jammy Jellyfish LTS
echo ==== 	[3] Ubuntu 22.10 Kinetec Kundu  
echo ==== 	[4] Ubuntu 23.04 Lunar Lobster 
echo ==== 	[5] 
echo ==== 	[6] 
echo ==== 	[7] 
echo ==== 	[8] 
echo ====
echo ==== 	[9] Hoofdmenu
echo ====
echo ==== 	Maak uw keuze 
echo ====
::
choice /C:123456789 /N
set subtoolantw=%errorlevel%
::
if %subtoolantw%==9 goto :hoofdmenu
if %subtoolantw%==8 goto :documenten
if %subtoolantw%==7 goto :grafisch
if %subtoolantw%==6 goto :hoofdmenu
if %subtoolantw%==5 goto :remotecontrol
if %subtoolantw%==4 goto :pov-ulx-2304
if %subtoolantw%==3 goto :pov-ulx-2210
if %subtoolantw%==2 goto :pov-ulx-2204
if %subtoolantw%==1 goto :pov-ulx-2004
goto :pov-ulx
::
::
::
::
:pov-ulx-2004
::
@CLS
::
echo ===========================================================================
echo ==== Vagrant Start 
echo ==== Submenu Starten Ubuntu 20.04 (Focal Fossa) Oracle Virtualbox
echo ===========================================================================
echo ====
echo ====	[1] Ubuntu 20.04 Focal Fossa (generic) Small (2 GB)
echo ====	[2] Ubuntu 20.04 Focal Fossa (generic) Medium (4 GB)
echo ====	[3] Ubuntu 20.04 Focal Fossa (generic) Large (8 GB) 
echo ====	[4] Ubuntu 20.04 Focal Fossa (generic) Extra Large (16 GB) 
echo ====	[5] Ubuntu 20.04 Focal Fossa Server (gusztavvargadr) (8 GB)
echo ====	[6] 
echo ====	[7] 
echo ====	[8] Submenu Starten Linux VM Oracle Virtualbox
echo ====
echo ==== 	[9] Hoofdmenu
echo ====
echo ==== 	Maak uw keuze 
echo ====
::
choice /C:123456789 /N
set subtoolantw=%errorlevel%
::
if %subtoolantw%==9 goto :hoofdmenu
if %subtoolantw%==8 goto :pov-ulx
if %subtoolantw%==7 goto :hoofdmenu
if %subtoolantw%==6 goto :hoofdmenu
if %subtoolantw%==5 goto :pov-uls-2004-GR-L
if %subtoolantw%==4 goto :pov-uld-2004-GC-XL
if %subtoolantw%==3 goto :pov-uld-2004-GC-L
if %subtoolantw%==2 goto :pov-uld-2004-GC-M
if %subtoolantw%==1 goto :pov-uld-2004-GC-S
goto :pov-ulx-2004
::
::
:pov-uld-2004-GC-S
start "vagrant up pov-uld-2004-GC-S" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant up pov-uld-2004-GC-S
start "vagrant ssh pov-uld-2004-GC-S" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant ssh pov-uld-2004-GC-S
exit /b
:pov-uld-2004-GC-M
start "vagrant up pov-uld-2004-GC-M" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant up pov-uld-2004-GC-M
start "vagrant ssh pov-uld-2004-GC-M" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant ssh pov-uld-2004-GC-M
exit /b
:pov-uld-2004-GC-L
start "vagrant up pov-uld-2004-GC-L" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant up pov-uld-2004-GC-L
start "vagrant ssh pov-uld-2004-GC-L" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant ssh pov-uld-2004-GC-L
exit /b
:pov-uld-2004-GC-XL
start "vagrant up pov-uld-2004-GC-XL" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant up pov-uld-2004-GC-XL
start "vagrant ssh pov-uld-2004-GC-XL" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant ssh pov-uld-2004-GC-XL
exit /b
:pov-uls-2004-GR-L
start "vagrant up pov-uls-2004-GR-L" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant up pov-uls-2004-GR-L
start "vagrant ssh pov-uls-2004-GR-L" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant ssh pov-uls-2004-GR-L
exit /b
::
::
::
::
:pov-ulx-2204
::
@CLS
::
echo ===========================================================================
echo ==== Vagrant Start 
echo ==== Submenu Starten Ubuntu 22.04 (Jammy Jellyfish) Oracle Virtualbox
echo ===========================================================================
echo ====
echo ====	[1] Ubuntu 22.04 Jammy Jellyfish (generic) Small (2 GB)
echo ==== 	[2] Ubuntu 22.04 Jammy Jellyfish (generic) Medium (4 GB)
echo ==== 	[3] Ubuntu 22.04 Jammy Jellyfish (generic) Large (8 GB) 
echo ==== 	[4] Ubuntu 22.04 Jammy Jellyfish (generic) Extra Large (16 GB) 
echo ==== 	[5] Ubuntu 22.04 Jammy Jellyfish (alvistack) Large (8 GB) Ansible
echo ==== 	[6] Ubuntu 22.04 Jammy Jellyfish (alvistack) Large (8 GB) Kubernetes
echo ==== 	[7] 
echo ==== 	[8] Submenu Starten Linux VM Oracle Virtualbox
echo ====
echo ==== 	[9] Hoofdmenu
echo ====
echo ==== 	Maak uw keuze 
echo ====
::
choice /C:123456789 /N
set subtoolantw=%errorlevel%
::
if %subtoolantw%==9 goto :hoofdmenu
if %subtoolantw%==8 goto :pov-ulx
if %subtoolantw%==7 goto :hoofdmenu
if %subtoolantw%==6 goto :pov-uld-2204-AS-L-K
if %subtoolantw%==5 goto :pov-uld-2204-AS-L-A
if %subtoolantw%==4 goto :pov-uld-2204-GC-XL
if %subtoolantw%==3 goto :pov-uld-2204-GC-L
if %subtoolantw%==2 goto :pov-uld-2204-GC-M
if %subtoolantw%==1 goto :pov-uld-2204-GC-S
goto :pov-ulx-2204
::
::
:pov-uld-2204-GC-S
start "vagrant up pov-uld-2204-GC-S" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant up pov-uld-2204-GC-S
start "vagrant ssh pov-uld-2204-GC-S" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant ssh pov-uld-2204-GC-S
exit /b
:pov-uld-2204-GC-M
start "vagrant up pov-uld-2204-GC-M" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant up pov-uld-2204-GC-M
start "vagrant ssh pov-uld-2204-GC-M" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant ssh pov-uld-2204-GC-M
exit /b
:pov-uld-2204-GC-L
start "vagrant up pov-uld-2204-GC-L" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant up pov-uld-2204-GC-L
start "vagrant ssh pov-uld-2204-GC-L" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant ssh pov-uld-2204-GC-L
exit /b
:pov-uld-2004-GC-XL
:: "C:\HashiCorp\Vagrant\bin"\vagrant up pov-uld-2204-GC-XL
:: "C:\HashiCorp\Vagrant\bin"\vagrant ssh pov-uld-2204-GC-XL
exit /b
:pov-uld-2204-AS-L-A
start "vagrant up pov-uld-2204-AS-L-A" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant up pov-uld-2204-AS-L-A
start "vagrant ssh pov-uld-2204-AS-L-A" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant ssh pov-uld-2204-AS-L-A
exit /b
:pov-uld-2204-AS-L-K
start "vagrant up pov-uld-2204-AS-L-K" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant up pov-uld-2204-AS-L-K
start "vagrant ssh pov-uld-2204-AS-L-K" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant ssh pov-uld-2204-AS-L-K
exit /b
::
::
::	[3]	Starten Linux VM VMware Workstation Pro
::
::
:pvd-ulx
::
@CLS
::
echo ===========================================================================
echo ==== Vagrant Start 
echo ==== Submenu Starten Linux VM VMware Workstation PRO
echo ===========================================================================
echo ====
echo ====	[1] Ubuntu 20.04 Focal Fossa 		LTS
echo ==== 	[2] Ubuntu 22.04 Jammy Jellyfish 	LTS
echo ==== 	[3] Ubuntu 22.10 Kinetec Kundu  
echo ==== 	[4] Ubuntu 23.04 Lunar Lobster 
echo ==== 	[5] 
echo ==== 	[6] 
echo ==== 	[7] 
echo ==== 	[8] Submenu Starten VM Oracle Virtualbox
echo ====
echo ==== 	[9] Hoofdmenu
echo ====
echo ==== 	Maak uw keuze 
echo ====
::
choice /C:123456789 /N
set subtoolantw=%errorlevel%
::
if %subtoolantw%==9 goto :hoofdmenu
if %subtoolantw%==8 goto :pov_ulx
if %subtoolantw%==7 goto :pvd_ulx
if %subtoolantw%==6 goto :pvd_ulx
if %subtoolantw%==5 goto :pvd_ulx
if %subtoolantw%==4 goto :pvd-ulx-2304
if %subtoolantw%==3 goto :pvd-ulx-2210
if %subtoolantw%==2 goto :pvd-ulx-2204
if %subtoolantw%==1 goto :pvd-ulx-2004
goto :pvd-ulx
::
::
::
::
:pvd-ulx-2004
::
@CLS
::
echo ===========================================================================
echo ==== Vagrant Start 
echo ==== Submenu Starten Ubuntu 20.04 (Focal Fossa) VMware Workstation PRO
echo ===========================================================================
echo ====
echo ==== 	[1] Ubuntu 20.04 Focal Fossa (generic) Small (2 GB)
echo ==== 	[2] Ubuntu 20.04 Focal Fossa (generic) Medium (4 GB)
echo ==== 	[3] Ubuntu 20.04 Focal Fossa (generic) Large (8 GB) 
echo ==== 	[4] Ubuntu 20.04 Focal Fossa (generic) Extra Large (16 GB) 
echo ==== 	[5] Ubuntu 20.04 Focal Fossa Server (gusztavvargadr) (8 GB)
echo ==== 	[6] 
echo ==== 	[7] 
echo ==== 	[8] Submenu Starten Linux VM VMware Workstation Pro
echo ====
echo ==== 	[9] Hoofdmenu
echo ====
echo ==== 	Maak uw keuze 
echo ====
::
choice /C:123456789 /N
set subtoolantw=%errorlevel%
::
if %subtoolantw%==9 goto :hoofdmenu
if %subtoolantw%==8 goto :pvd-ulx
if %subtoolantw%==7 goto :pvd_ulx_2004
if %subtoolantw%==6 goto :pvd_ulx_2004
if %subtoolantw%==5 goto :pvd-uls-2004-GR-L
if %subtoolantw%==4 goto :pvd-uld-2004-GC-XL
if %subtoolantw%==3 goto :pvd-uld-2004-GC-L
if %subtoolantw%==2 goto :pvd-uld-2004-GC-M
if %subtoolantw%==1 goto :pvd-uld-2004-GC-S
goto :pvd-ulx-2004
::
::
:pvd-uld-2004-GC-S
start "vagrant up pvd-uld-2004-GC-S" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant up pov-uld-2004-GC-S
start "vagrant ssh pvd-uld-2004-GC-S" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant ssh pov-uld-2004-GC-S
exit /b
:pvd-uld-2004-GC-M
start "vagrant up pvd-uld-2004-GC-M" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant up pov-uld-2004-GC-M
start "vagrant ssh pvd-uld-2004-GC-M" /D %HOMEPATH% /I /B /MAX /WAIT" C:\HashiCorp\Vagrant\bin"\vagrant ssh pov-uld-2004-GC-M
exit /b
:pvd-uld-2004-GC-L
start "vagrant up pvd-uld-2004-GC-L" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant up pov-uld-2004-GC-L
start "vagrant ssh pvd-uld-2004-GC-L" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant ssh pov-uld-2004-GC-L
exit /b
:pvd-uld-2004-GC-XL
:: "C:\HashiCorp\Vagrant\bin"\vagrant up pov-uld-2004-GC-XL
:: "C:\HashiCorp\Vagrant\bin"\vagrant ssh pov-uld-2004-GC-XL
exit /b
:pvd-uls-2004-GR-L
start "vagrant up pvd-uls-2004-GR-L" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant up pvd-uls-2004-GR-L
start "vagrant ssh pvd-uls-2004-GR-L" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant ssh pvd-uls-2004-GR-L
exit /b
::
::
::
::
:pvd-ulx-2204
::
@CLS
::
echo ===========================================================================
echo ==== Vagrant Start 
echo ==== Submenu Starten Ubuntu 22.04 (Jammy Jellyfish) VMware Workstation PRO
echo ===========================================================================
echo ====
echo ==== 	[1] Ubuntu 22.04 Jammy Jellyfish (generic) Small (2 GB)
echo ==== 	[2] Ubuntu 22.04 Jammy Jellyfish (generic) Medium (4 GB)
echo ==== 	[3] Ubuntu 22.04 Jammy Jellyfish (generic) Large (8 GB) 
echo ==== 	[4] Ubuntu 22.04 Jammy Jellyfish (generic) Extra Large (16 GB) 
echo ==== 	[5] Ubuntu 22.04 Jammy Jellyfish (alvistack) Large (8 GB) Ansible
echo ==== 	[6] Ubuntu 22.04 Jammy Jellyfish (alvistack) Large (8 GB) Kubernetes [Niet beschikbaar]
echo ==== 	[7] 
echo ==== 	[8] Submenu Starten Linux VM Oracle Virtualbox
echo ====
echo ==== 	[9] Hoofdmenu
echo ====
echo ==== 	Maak uw keuze 
echo ====
::
choice /C:123456789 /N
set subtoolantw=%errorlevel%
::
if %subtoolantw%==9 goto :hoofdmenu
if %subtoolantw%==8 goto :pov-ulx
if %subtoolantw%==7 goto :hoofdmenu
if %subtoolantw%==6 goto :pvd-uld-2204-AS-L-K
if %subtoolantw%==5 goto :pvd-uld-2204-AS-L-A
if %subtoolantw%==4 goto :pvd-uld-2204-GC-XL
if %subtoolantw%==3 goto :pvd-uld-2204-GC-L
if %subtoolantw%==2 goto :pvd-uld-2204-GC-M
if %subtoolantw%==1 goto :pvd-uld-2204-GC-S
goto :pvd-ulx-2204
::
::
:pvd-uld-2204-GC-S
start "vagrant up pvd-uld-2204-GC-S" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant up pvd-uld-2204-GC-S
start "vagrant ssh pvd-uld-2204-GC-S" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant ssh pvd-uld-2204-GC-S
exit /b
:pvd-uld-2204-GC-M
start "vagrant up pvd-uld-2204-GC-M" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant up pvd-uld-2204-GC-M
start "vagrant ssh pvd-uld-2204-GC-M" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant ssh pov-uld-2204-GC-M
exit /b
:pvd-uld-2204-GC-L
start "vagrant up pvd-uld-2204-GC-L" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant up pvd-uld-2204-GC-L
start "vagrant ssh pvd-uld-2204-GC-L" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant ssh pvd-uld-2204-GC-L
exit /b
:pvd-uld-2004-GC-XL
start "vagrant up pvd-uld-2204-GC-XL" /D %HOMEPATH% /I /B /MAX /WAIT  "C:\HashiCorp\Vagrant\bin"\vagrant up pvd-uld-2204-GC-XL
start "vagrant ssh pvd-uld-2204-GC-XL" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant ssh pvd-uld-2204-GC-XL
exit /b
:pvd-uld-2204-AS-L-A
:: "C:\HashiCorp\Vagrant\bin"\vagrant up pvd-uld-2204-AS-L-A
:: "C:\HashiCorp\Vagrant\bin"\vagrant ssh pvd-uld-2204-AS-L-A
exit /b
:pvd-uld-2204-AS-L-K
CD %HOMEPATH%
:: start "vagrant up pvd-uld-2204-AS-L-K" /D %HOMEPATH% /I /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant up pvd-uld-2204-AS-L-K
:: start "vagrant ssh pvd-uld-2204-AS-L-K" /D %HOMEPATH% /I /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant ssh pvd-uld-2204-AS-L-K
exit /b
::
::
::	[7]	Installatie Vagrant Omgeving (incl. hypervisors) 
::
::
:vagrant_install
::
@CLS
::
echo ===========================================================================
echo ==== Vagrant Start 
echo ==== Submenu Installatie Vagrant Omgeving
echo ===========================================================================
echo ====
echo ==== 	[1]	Installatie Vagrant 
echo ==== 	[2] Installatie Vagrant VMware Utility
echo ==== 	[3] Initialisatie Vagrant Omgeving
echo ==== 	[4] Installatie NotePad++
echo ==== 	[5] Installatie Windows Terminal
echo ==== 	[6] Installatie Oracle Virtualbox
echo ==== 	[7] Installatie VMware Workstation PRO
echo ==== 	[8] 	
echo ====
echo ==== 	[9] Hoofdmenu
echo ====
echo ==== 	Maak uw keuze 
echo ====
::
choice /C:123456789 /N
set subtoolantw=%errorlevel%
::
if %subtoolantw%==9 goto :hoofdmenu
if %subtoolantw%==8 goto :hoofdmenu
if %subtoolantw%==7 goto :pvd_install
if %subtoolantw%==6 goto :pov_install
if %subtoolantw%==5 goto :win_terminal_install
if %subtoolantw%==4 goto :notepad_plus_install
if %subtoolantw%==3 goto :vagrant_init
if %subtoolantw%==2 goto :vagrant_install_vmware_util
if %subtoolantw%==1 goto :vagrant_install_basics
goto :vagrant_install
::
::
:vagrant_install_basics
::
:: 	Omgevingsvariabelen instellen
::	https://phoenixnap.com/kb/windows-set-environment-variable
::
setx VAGRANT_VAGRANTFILE "Vagrantfile.rb"
setx VAGRANT_EXPERIMENTAL "1"
setx VAGRANT_SUPPRESS_GO_EXPERIMENTAL_WARNING "1"
::
setx VAGRANT_DEFAULT_PROVIDER "vmware_desktop"
setx VAGRANT_VMWARE_CLONE_DIRECTORY "D:\Virtual-Machines\VMware-Workstation-PRO\Linux\Vagrant"
:: 
::
::	Installatie Vagrant via WinGET
::
winget install --id Hashicorp.Vagrant --accept-package-agreements --accept-source-agreements --force --silent
:: 
goto :vagrant_install
:: 
:vagrant_install_vmware_util
:: Curl Installeren
winget install --id  cURL.cURL --accept-package-agreements --accept-source-agreements --force --silent
:: Downloaden VMware Plugin for Vagrant
curl -s -o %HOMEPATH%\Downloads\vagrant-vmware-utility_1.0.22_windows_amd64.msi https://releases.hashicorp.com/vagrant-vmware-utility/1.0.22/vagrant-vmware-utility_1.0.22_windows_amd64.msi
:: Installeren VMware Plugin for Vagrant
run %HOMEPATH%\Downloads\vagrant-vmware-utility_1.0.22_windows_amd64.msi
::
goto :vagrant_install
::
:vagrant_init
::
rename %HOMEPATH%\Vagrantfile %HOMEPATH%\Vagrantfile_backup
start "Vagrant Initialisatie" /D %HOMEPATH% /I /B /MAX /WAIT "C:\HashiCorp\Vagrant\bin"\vagrant init
::
::	Verwijderen default Vagrantfile
rename %HOMEPATH%\Vagrantfile %HOMEPATH%\Vagrantfile_default
::
curl -s -o %HOMEPATH%\Vagrantfile https://github.com/jatutert/vagrantfile/releases/download/4.0/Vagrantfile
:: 
goto :vagrant_install
::
:notepad_plus_install
winget install --id Notepad++.Notepad++ --accept-package-agreements --accept-source-agreements --force --silent
goto :vagrant_install
:win_terminal_install
winget install --id "Microsoft.WindowsTerminal" --accept-package-agreements --accept-source-agreements
goto :vagrant_install
:pov_install
winget install --id Oracle.VirtualBox --accept-package-agreements --accept-source-agreements --force --silent
goto :vagrant_install
:pvd_install
winget install --id VMware.WorkstationPro --accept-package-agreements --accept-source-agreements --force --silent
goto :vagrant_install
::
::
::	[8]	Downloaden Boxes
::
::
:vagrant_boxes_download
::
@CLS
::
echo ===========================================================================
echo ==== Vagrant Start 
echo ==== Submenu Download Boxes
echo ===========================================================================
echo ====
echo ==== 	[1]	Downloaden Ubuntu LTS Generic Boxes Oracle Virtualbox
echo ==== 	[2]	Downloaden Ubuntu LTS Generic Boxes VMware Workstation
echo ==== 	[3]	Downloaden Ubuntu LTS Alvistack boxes [alleen Oracle Virtualbox] 
echo ==== 	[4] Downloaden Gusztavvargadr Ubuntu Server 20.04 Box Oracle	
echo ==== 	[5] Downloaden Gusztavvargadr Ubuntu Server 20.04 Box VMware
echo ==== 	[6] Bijwerken boxes	
echo ==== 	[7] 
echo ==== 	[8] 	
echo ====
echo ==== 	[9] Hoofdmenu
echo ====
echo ==== 	Maak uw keuze 
echo ====
::
choice /C:123456789 /N
set subtoolantw=%errorlevel%
::
if %subtoolantw%==9 goto :hoofdmenu
if %subtoolantw%==8 goto :vagrant_boxes_download
if %subtoolantw%==7 goto :vagrant_boxes_download
if %subtoolantw%==6 goto :update_boxes
if %subtoolantw%==5 goto :download_pvd_gusztavvargadr_server_boxes
if %subtoolantw%==4 goto :download_pov_gusztavvargadr_server_boxes
if %subtoolantw%==3 goto :download_vagrant_ubuntu_alvistack_boxes
if %subtoolantw%==2 goto :download_pvd_ubuntu_generic_boxes
if %subtoolantw%==1 goto :download_pov_ubuntu_generic_boxes
goto :vagrant_boxes_download
::
::
:download_pov_ubuntu_generic_boxes
::
::  -c, --clean                      Clean any temporary download files
::
vagrant box add generic/ubuntu2004 --clean --provider virtualbox
vagrant box add generic/ubuntu2204 --clean --provider virtualbox
::
::  -f, --force                      Overwrite an existing box if it exists
:: 
:: vagrant box add generic/ubuntu2004 --clean --force --provider virtualbox
:: vagrant box add generic/ubuntu2204 --clean --force --provider virtualbox
::
goto :vagrant_boxes_download
::
:download_pvd_ubuntu_generic_boxes
::
::  -c, --clean                      Clean any temporary download files
::
vagrant box add generic/ubuntu2004 --clean --provider vmware_desktop
vagrant box add generic/ubuntu2204 --clean --provider vmware_desktop
::
::  -f, --force                      Overwrite an existing box if it exists
::
:: vagrant box add generic/ubuntu2004 --clean --force --provider vmware_desktop
:: vagrant box add generic/ubuntu2204 --clean --force --provider vmware_desktop
::
goto :vagrant_boxes_download
::
:download_vagrant_ubuntu_alvistack_boxes
::
vagrant box add alvistack/ubuntu-20.04 --clean --force --provider virtualbox
vagrant box add alvistack/ubuntu-22.04 --clean --force --provider virtualbox
::
goto :vagrant_boxes_download
::
:download_pov_gusztavvargadr_server_boxes
::
vagrant box add gusztavvargadr/ubuntu-server --clean --provider virtualbox
::
goto :vagrant_boxes_download
::
::
:download_pvd_gusztavvargadr_server_boxes
::
vagrant box add gusztavvargadr/ubuntu-server --clean --provider vmware_desktop
::
goto :vagrant_boxes_download
::
:update_boxes
::
:: Controleren of er updates zijn
vagrant box outdated --global
:: Bijwerken boxes
vagrant box update
:: Verwijderen eventuele oude versies boxes
vagrant box prune
::
goto :vagrant_boxes_download