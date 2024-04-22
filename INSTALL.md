# **TSSR-2402-P2-G3-TheScriptingProject**

## **Sommaire**

1) Pré-requis techniques

2) Installation des sources nécessaires au bon fonctionnement

## **Pré-requis techniques**

### **Les Serveurs**

||Debian 12.5|Windows Server 2022|
|:-:|:-:|:-:|
|HostName|SRVLX01|SRVWIN01|
|Login|root|administrator|
|Password|Azerty1*|Azerty1*|
|Ip fixe|172.16.10.10/24|172.16.10.5/24|
|Spécificité||Powershell Core 7.4 LTS inclus|

### **Les Clients**

||Ubuntu 22.04 LTS 01|Ubuntu 22.04 LTS 02| Windows 10 Pro 01|Windows 10 Pro 02|
|:-:|:-:|:-:|:-:|:-:|
|HostName|CLILIN01|CLILIN02|CLIWIN01|CLIWIN02|
|Login|wilder|wilder|wilder|wilder|
|Password|Azerty1*|Azerty1*|Azerty1*|Azerty1*|
|Ip fixe|172.16.10.30/24|172.16.10.31/24|172.16.10.20/24|172.16.10.21/24|

### **Composants additionnels**

Une fois les configurations faites, nous devons pour la partie Linux ajouter un lien _ssh_ entre le Serveur et les Clients.

Il nous faudra également paramètrer les Clients Windows afin d'autoriser la commande `Invoke-Command` du sscript Powershell

## **Installation des sources nécessaires au bon fonctionnement**

Bien entendu, il est nécessaire avant toute chose de procéder à une mise à jour système, aussi bien sur les Serveurs, que sur les Clients.

* bash : (sudo) `apt update && apt upgrade -y`
* Windows : Mise à jour système en mode graphique

Il vous faudra également donner les droits d'accès au script en terme d'exécution, si cela n'est pas déjà fait.

### **Installation et configuration ssh sur Linux**

#### **Installation et configuration ssh sur Debian**

Assurez-vous que votre système est à jour avec `apt update && apt upgrade -y`

Installez le paquet `openssh-server` avec `apt install openssh-server`

Il vous sera demandé durant l'installation si vous souhaitez continuer, saisissez `Y` puis `Entrée`

![ssh_Install_SRV_01](attachment/pics/ssh_Install_SRV_01.JPG)

L'installation se termine alors toute seule

![ssh_Install_SRV_02](attachment/pics/ssh_Install_SRV_02.JPG)

A la fin de l'installation, vos clés ssh sont disponibles dans le répertoire `/etc/ssh`

![ssh_Install_SRV__03](attachment/pics/ssh_Install_SRV_03.JPG)

#### **Installation et configuration ssh sur Client Ubuntu**

De la même manière que pour le Serveur Debian, assurez-vous tout d'abord que votre système est à jour avec `sudo apt update && sudo apt upgrade -y`

Installez le paquet `openssh-server` avec `sudo apt install openssh-server`

Il vous sera demandé durant l'installation si vous souhaitez continuer, saisissez `O` puis `Entrée`

![ssh_Install_CLI_01](attachment/pics/ssh_Install_CLI_01.JPG)

L'installation se termine alors toute seule

![ssh_Install_CLI_02](attachment/pics/ssh_Install_CLI_02.JPG)

A la fin de l'installation, vos clés ssh sont disponibles dans le répertoire `/etc/ssh`

![ssh_Install_CLI__03](attachment/pics/ssh_Install_CLI_03.JPG)

##### Installation complémentaire sur les Clients Ubuntu

Afin d'obtenir le détail de l'utlisation du processeur, nous avons besoin d'ajouter le paquet `sysstat` avec la commande `sudo apt install sysstat` sur chaque Client

### **Installation et configuration sur Windows**

#### **Installation et configuration sur Windows Server 2022**

Afin d'optimiser le fonctionnement du Script et par la même occasion respecter les pré-requis du Projet, il est nécessaire d'installer Powershell en version 7.4 LTS sur le Serveur Windows

Celui-ci est disponible sur la page [https://aka.ms/PSWindows](https://learn.microsoft.com/fr-fr/powershell/scripting/whats-new/migrating-from-windows-powershell-51-to-powershell-7?view=powershell-7.4)

Nous avons fait le choix d'installer le [Package MSI](https://learn.microsoft.com/fr-fr/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.4#msi)

Téléchargez le logiciel d'installation, puis lancez l'installation, en conservant les options par défaut de l'assistant, une fois l'installation terminée, vous pourrez profiter de `Powershell 7 (x64)`

Nous passons donc via Powershell 7 (x64) qu'il faut lancer en mode Adminstrateur (clique-droit sur le logiciel puis `Run as administrator`)

![Powershell_Launch](attachment/pics/Powershell_Launch.JPG)

La version 7.4.2 est disponible sur le Serveur

![Powershell_7_4_2](attachment/pics/Powershell_7_4_2.JPG)

#### **Installation et configuration sur Client Windows 10 Pro**

Afin d'établir un lien entre le Serveur et les Clients via la commande `Invoke-Command`, il est nécessaire de procéder à quelques ajustements

1) Vérification que le Parefeu est bien désactivé sur les Clients, ainsi que sur le Serveur

![Win_Config_CLI_01](attachment/pics/Win_Config_CLI_01.JPG)

![Win_Config_SRV_01](attachment/pics/Win_Config_SRV_01.JPG)

2) Configuration sur les Clients du démarrage automatique du service _Registre Distant_ via la commande Powershell `Set-Service -Name winrm -StartupType 'Automatic'`

3) Ajouter un compte `Administrator` sur chacun des Clients, le compte doit être ajouté au Groupe _Administrateur_

![Win_Config_CLI_02](attachment/pics/Win_Config_CLI_02.JPG)

4) Sur les Clients, sous Powershell lancé en mode Administrateur, récupérez l'index de l'interface avec la commande `Get-NetConnectionProfile`, puis modifiez l'interface avec la commande `Set-NetConnectionProfile -InterfaceIndex <Index> -NetworkCategory Private`

5) Sur les Clients, ouvrez `cmd.exe` en mode Administrateur, puis saisissez la commande `reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v LocalAccountTokenFilterPolicy /t REG_DWORD /d 1 /f`

6) Sur le Serveur, ajouter chacun des Clients à la liste des hôtes de confiance avec la commande `Set-Item WSMan:\localhost\Client\TrustedHosts -Value "<NomDuPcClient>"`

##### Installation complémentaire sur les Clients Windows

Il est possible via le script de mettre à jour les Clients, afin que cette commande fonctionne parfaitement, certains pré-requis sont à effectuer sur ceux-ci

* Il vous faut dans un premier temps installer sur chaque Client `PSWindowsUpdate` via la commande `Install-Module -Name PSWindowsUpdate -RequiredVersion 2.2.0.3`
* Puis vous devez retirer la restriction des scripts via la commande `Set-ExecutionPolicy Unrestricted` (oui pour tout)

### **Installation et configurations des composants additionnels**

Différents scripts sont fournis avec la Documentation, à savoir :
* Un Script Powershell `admin-tool.ps1` qui devra être installé dans le `C:\Users\Administrator\` sur le Serveur Windows
* Un Script Powershell `hello.ps1` qui devra être installé dans le `C:\Users\wilder\` sur chacun des Clients Windows
* Un Script bash `admin-tool.sh` qui devra être installé à la racine du dossier personnel de `root` sur le Serveur
* Un Script bash `hello.sh` qui devra être installé à la racine du dossier personnel de `wilder` sur chacun des Clients Ubuntu

Vous pouvez trouver tous ces scripts dans le dossier `attachment` du dépôt.
