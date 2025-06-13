::
:: 	Backup vagranfile uit c:\users\[username]
:: 	Versie 2.1 
:: 	2.0 11 aug 2023
:: 	2.1 09 dec 2023 (nieuwe directory) 
::	Auteur: John Tutert
::
:: 	Build for personal or educational use only 
:: 
:: CUR_YYYY – Stores the year
set CUR_YYYY=%date:~7,4%
:: CUR_YY – Stores the year
set CUR_YY=%date:~9,2%
:: CUR_MM – Stores the month
set CUR_MM=%date:~3,3%
:: CUR_DD – Stores the day
set CUR_DD=%date:~0,2%
:: CUR_HH – Stores the hours
set CUR_HH=%time:~0,2%
:: CUR_NN – Stores the minutes
set CUR_NN=%time:~3,2%
:: CUR_SS – Stores the seconds
set CUR_SS=%time:~6,2%
:: CUR_MS – Stores the milli seconds
set CUR_MS=%time:~9,2%
:: 
::
:: Maken Jaar Directory
:: 
mkdir "D:\OneDrive - Saxion\Eigen-Scripts\Vagrant\RUBY-Vagrantfile\VirtBox-VMW-WrkStat\"%CUR_YYYY%
::
:: Maken Maand Directory
::
mkdir "D:\OneDrive - Saxion\Eigen-Scripts\Vagrant\RUBY-Vagrantfile\VirtBox-VMW-WrkStat\"%CUR_YYYY%\%CUR_MM%
::
:: Maken Dag Directory
:: 
mkdir "D:\OneDrive - Saxion\Eigen-Scripts\Vagrant\RUBY-Vagrantfile\VirtBox-VMW-WrkStat\"%CUR_YYYY%\%CUR_MM%\%CUR_DD%
::
:: Maken Huidige tijd Directory
:: 
:: Oud
:: mkdir "D:\OneDrive - Saxion\Eigen-Scripts\YAML\Vagrant\VirtBox-VMW-WrkStat\"%date%
:: mkdir "D:\OneDrive - Saxion\Eigen-Scripts\YAML\Vagrant\VirtBox-VMW-WrkStat\"%date%\%CUR_HH%%CUR_NN%
::
::
mkdir "D:\OneDrive - Saxion\Eigen-Scripts\Vagrant\RUBY-Vagrantfile\VirtBox-VMW-WrkStat\"%CUR_YYYY%\%CUR_MM%\%CUR_DD%\%CUR_HH%%CUR_NN%
::
::
:: Overzetten bestand
::
:: Oud
:: copy C:\users\jtu03\Vagrantfile "D:\OneDrive - Saxion\Eigen-Scripts\YAML\Vagrant\VirtBox-VMW-WrkStat\"%date%\%CUR_HH%%CUR_NN% /Y
copy C:\users\jtu03\Vagrantfile "D:\OneDrive - Saxion\Eigen-Scripts\Vagrant\RUBY-Vagrantfile\VirtBox-VMW-WrkStat\"%CUR_YYYY%\%CUR_MM%\%CUR_DD%\%CUR_HH%%CUR_NN% /Y
::
:: Overzetten naar GitHub
::
:: Verwijderen oudere versie van huidige datum
del "D:\OneDrive - Saxion\Eigen-Scripts\GIT-jatutert-VagrantFile\vagrantfile\Vagrantfile"\Vagrantfile-6-%CUR_YY%-%CUR_MM%-%CUR_DD%
:: Overzetten en voorzien van huidige datum 
copy C:\users\jtu03\Vagrantfile "D:\OneDrive - Saxion\Eigen-Scripts\GIT-jatutert-VagrantFile\vagrantfile"\Vagrantfile-6-%CUR_YY%-%CUR_MM%-%CUR_DD%
::
:: That's all folks 
::
exit