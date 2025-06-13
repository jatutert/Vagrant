::
:: 	Distributie Version 3 Vagrantfile
::
:: 	Versie 2.4
::  (c) 2023, 2024, 2025
:: 
:: 	2.0 11 aug 2023
:: 	2.1 09 dec 2023 (nieuwe directory)
::  2.2 09 Jan 2024 (nieuwe structuur OneDrive en GitHub verwerkt in script)
:: 	2.3 19 Jan 2024
::	2.4 13 Jun 2025
::  
::	Auteur: John Tutert
::
:: 	Build for personal or educational use only 
::
::
::	:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::	Vullen Variabelen Script
::	:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
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
::	:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::	Backup
::	:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
::
:: Backup // Maken Huidig Jaar Directory 
mkdir "D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-JATUTERT-Repositories\Vagrant\Vagrantfile\Full\Versie-3\"%CUR_YYYY%
:: Backup // Maken Huidig Maand Directory
mkdir "D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-JATUTERT-Repositories\Vagrant\Vagrantfile\Full\Versie-3"%CUR_YYYY%\%CUR_MM%
:: Backup // Maken Huidig Dag Directory 
mkdir "D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-JATUTERT-Repositories\Vagrant\Vagrantfile\Full\Versie-3\"%CUR_YYYY%\%CUR_MM%\%CUR_DD%
:: Backup // Maken Huidige tijd Directory
mkdir "D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-JATUTERT-Repositories\Vagrant\Vagrantfile\Full\Versie-3\"%CUR_YYYY%\%CUR_MM%\%CUR_DD%\%CUR_HH%%CUR_NN%
::
:: Backup // Backup maken bestand op OneDrive 
copy /Y "D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-JATUTERT-Repositories\Vagrant\Vagrantfile\Full\Versie-3\Latest\"Vagrantfile.rb "D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-JATUTERT-Repositories\Vagrant\Vagrantfile\Full\Versie-3\"%CUR_YYYY%\%CUR_MM%\%CUR_DD%\%CUR_HH%%CUR_NN%\Vagrantfile-%CUR_YY%-%CUR_MM%-%CUR_DD%.rb
::
::
::
::	:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::	Vervangen Vagrantfile in USERPROFILE van huidige gebruiker
::	:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
::
copy /y "D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-JATUTERT-Repositories\Vagrant\Vagrantfile\Full\Versie-3\Latest\"Vagrantfile.rb %USERPROFILE%\Vagrantfile-ReadOnly.rb
::
::
::	:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::	Oude inhoud script
::	:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
::
::	:: Overzetten naar GitHub
::	::
::	:: Verwijderen oudere versie van huidige datum
::	del /F /Q "D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-JATUTERT-Repositories\Vagrant\Vagrantfile\VirtualBox-WorkstatPRO\Full\Latest\"Vagrantfile-%CUR_YY%-%CUR_MM%-%CUR_DD%.rb
::	del /F /Q "D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-JATUTERT-Repositories\Vagrant\Vagrantfile\VirtualBox-WorkstatPRO\Full\Latest\"Vagrantfile-latest.rb
::	del /F /Q "D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-JATUTERT-Repositories\Vagrant\Vagrantfile\"Vagrantfile-latest.rb
::	:: Overzetten en voorzien van huidige datum 
::	copy /Y C:\users\jtu03\Vagrantfile.rb "D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-JATUTERT-Repositories\Vagrant\Vagrantfile\VirtualBox-WorkstatPRO\Full\Latest\"Vagrantfile-%CUR_YY%-%CUR_MM%-%CUR_DD%.rb
::	copy /Y C:\users\jtu03\Vagrantfile.rb "D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-JATUTERT-Repositories\Vagrant\Vagrantfile\VirtualBox-WorkstatPRO\Full\Latest\"Vagrantfile-latest.rb
::	copy /Y C:\users\jtu03\Vagrantfile.rb "D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-JATUTERT-Repositories\Vagrant\Vagrantfile\"Vagrantfile-latest.rb
::
::	:: Aanmaken LATEST voor WSL2 Config (versie 1)
::	::
::	:: Stel de bron- en doelmap in
::	set source=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-JATUTERT-Repositories\Ubuntu-Config\Version-1xx
::	set destination=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-JATUTERT-Repositories\Ubuntu-Config
::	::
::	:: Zoek het nieuwste bestand in de bronmap
::	FOR /F "delims=" %%I IN ('DIR "%source%" /B /A:-D /O:-D') DO SET NewestFile=%%I & GOTO Continue
::	:Continue
::	::
::	:: Maak een kopie van het nieuwste bestand met de oude naam en "latest" als toevoeging
::	COPY "%source%\%NewestFile%" "%destination%\wsl2-config-latest.sh"
::
::	:: Aanmaken latest voor Ubuntu Config (versie 2)
::	:: Stel de bron- en doelmap in
::	set source=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-JATUTERT-Repositories\Ubuntu-Config\Version-2xx
::	set destination=D:\OneDrive\OneDrive - Saxion\Repository-Playground\Development\GitHub-JATUTERT-Repositories\Ubuntu-Config
::	::
::	:: Zoek het nieuwste bestand in de bronmap
::	FOR /F "delims=" %%I IN ('DIR "%source%" /B /A:-D /O:-D') DO SET NewestFile=%%I & GOTO Continue
::	:Continue
::	::
::	:: Maak een kopie van het nieuwste bestand met de oude naam en "latest" als toevoeging
::	COPY "%source%\%NewestFile%" "%destination%\ubuntu-config-latest.sh"
::
::
::	:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::	Einde script
::	:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
::
:: 
:: Thats all folks 
::
exit