::
:: Script voor het aanmaken van latest bestanden op basis van nieuwste bestand in directory
:: 24 november 2024
:: John Tutert 
:: 

@echo off

:: Aanmaken LATEST Vagrantfile 

:: Stel de bron- en doelmap in
set source=D:\OneDrive - Saxion\Eigen-Scripts\GIT-jatutert-VagrantFile\vagrantfile
set destination=D:\OneDrive - Saxion\Eigen-Scripts\GIT-jatutert-VagrantFile\vagrantfile

:: Zoek het nieuwste bestand in de bronmap
FOR /F "delims=" %%I IN ('DIR "%source%" /B /A:-D /O:-D') DO SET NewestFile=%%I & GOTO Continue
:Continue

:: Maak een kopie van het nieuwste bestand met de oude naam en "latest" als toevoeging
COPY "%source%\%NewestFile%" "%destination%\vagrantfile-latest.rb"

