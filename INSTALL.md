# **TSSR-2402-P2-G3-TheScriptingProject**

## **Sommaire**

1) Pré-requis techniques

2) Installation des sources nécessaires au bon fonctionnement

3) Aperçu et descriptif avancé des scripts

4) 

5) FAQ

6) 








## ** Pré-requis techniques*

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

Une fois les configurations faites, nous devons ajouter un lien _ssh_ entre les Serveurs et les Clients.

Certains paquets supplémentaires peuvent être ajoutés afin de faciliter certaines commandes des scripts (mpstat, etc...).

## **Installation des sources nécessaires au bon fonctionnement**

Bien entendu, il est nécessaire avant toute chose de procéder à une mise à jour système, aussi bien sur les Serveurs, que sur les Clients

* bash : (sudo) `apt update && apt upgrade -y`
* Windows : Mise à jour système en mode graphique

Il vous faudra également donner les droits d'accés au scripts en terme d'exécution, si cela n'est pas déjà fait.

### **Installation et configuration ssh sur Linux**

#### **Installation et configuration ssh sur _Debian_**


#### **Installation et configuration ssh sur Client _Ubuntu_**



### **Installation et configuration sur Windows**

#### **Installation et configuration sur _Windows Server 2022_**



#### ** Installation et configuration sur Client _Windows 10 Pro_**




### **Installation et configurations des composants additionnels**











## **Aperçu et descriptif avancé des scripts**











## **FAQ**


















## Mise à jour du système

### Shell Bash

Nous pouvons employer la commande suivante :

``sudo apt update && sudo apt upgrade``

Elle est utilisée pour mettre à jour la liste des paquets disponibles dans les dépôts Ubuntu dans un premier temps, puis les mettre à jour sur le système vers les versions les plus récentes.
``&&`` permet d'exécuter les deux commandes à la suite de manière séquentielle. Dans le cas présent, ``sudo apt upgrade`` ne s'exécute QUE si ``sudo apt update``a abouti.
### PowerShell
 
 Pour rechercher les mises à jour du système avec un script PowerShell, vous pouvez utiliser les commandes fournies par le module `WindowsUpdate` de PowerShell. Voici un exemple de script PowerShell qui recherche les mises à jour disponibles sur le système :

```
#Installer le module WindowsUpdate s'il n'est pas déjà installé
if (-not (Get-Module -ListAvailable -Name WindowsUpdate)) {
    Write-Host "Le module WindowsUpdate n'est pas installé. Installation en cours..."
    Install-Module -Name WindowsUpdate -Force -Scope CurrentUser -Verbose
}
#Si on veut lister les MaJ disponibles
Get-WindowsUpdate

#On souhaite intaller les MaJ en attente sur la machine
Install-WindowsUpdate -AcceptAll 

#Vérifier s'il y a un redémarrage en attente
Get-WURebootStatus
```

Ce script vérifie d'abord si le module `WindowsUpdate` est installé. Si ce n'est pas le cas, il l'installe automatiquement. Ensuite, il importe le module `WindowsUpdate` et utilise la commande `Get-WindowsUpdate` pour rechercher les mises à jour disponibles en ligne. Enfin, il affiche les mises à jour disponibles avec leurs titres, numéros KB et descriptions.

Vous pouvez enregistrer ce script dans un fichier avec l'extension ".ps1" et l'exécuter dans PowerShell en tant qu'administrateur pour rechercher les mises à jour du système. Assurez-vous que l'exécution de scripts PowerShell est autorisée sur votre système en exécutant `Set-ExecutionPolicy RemoteSigned` en tant qu'administrateur si nécessaire.


## Création de répertoire

### Shell Bash

```
#Demande à l'utilisateur de saisir le chemin complet du dossier à créer
read -p "Entrez le chemin complet du dossier à créer :" creationDossiersh

#Condition avec l'existence du chemin en question ou non
if [ ! -d "$creationDossiersh" ];
	then
		#Création du dossier s'il n'existe pas
		mkdir -p "$creationDossiersh"
		echo "Dossier crée avec succès"
	else
		echo "Le dossier existe déjà"
		exit 0
fi
```

### PowerShell

```
#Demande à l'utilisateur le chemin complet du dossier à créer
$creationDossierps = Read-Host "Entrez le chemin complet du dossier à créer"

#Vérifie si le chemin spécifié existe déjà
if (!(Test-Path $creationDossierps)) {
    # Crée le répertoire s'il n'existe pas déjà
    New-Item -Path $creationDossierps -ItemType Directory -Force
    Write-Host "Le répertoire a été créé avec succès."
} else {
    Write-Host "Le répertoire existe déjà."
}
```
On utilise l'option ``-Force`` si nous n'avons pas les droits administrateurs.

## Modification de répertoire

### Shell Bash

```
# Demande à l'utilisateur de saisir le chemin complet du répertoire à modifier
read -p "Entrez le chemin complet du répertoire à modifier :" modifCheminsh
  
#Vérification existence du chemin et du dossier
if [ -d "$modifCheminsh" ];
then
    #On demande le nouveau nom qu'il souhaite donner au dossier
    read -p "Veuillez indiquer un nouveau nom pour ce dossier :" nouveauNomsh
    mv $modifCheminsh $nouveauNomsh
    echo "Le dossier a été renommé avec succès"
else
    echo "La modification n'a pas pu aboutir"
    exit 0
fi
```

### PowerShell

```
#Demande à l'utilisateur le chemin complet du dossier à modifier

$modifCheminps = Read-Host "Veuillez entrer le chemin complet du dossier que vous souhaitez modifier :"

#Vérification de l'existence de ce dossier
if (Test-Path $modifDossierps -PathType Container "$modifDossierps") {
	#On demande à l'utilisateur le nouveau nom
	$nouveauNomps = Read-Host "Veuillez indiquer un nouveau nom pour ce dossier :"
	#On renomme le dossier en question
	Rename-Item -Path $modifCheminps -NewName $nouveauNomps -Force
	Write-Host "Le dossier a été renommé avec succès."
} else {
	Write-Host "La modification n'a pas pu aboutir."
}
```

## Suppression de répertoire

### Shell Bash

```
#Demande à l'utilisateur s'il souhaite supprimer un dossier
read -p "Voulez-vous supprimer un répertoire ? Indiquez le chemin complet du répertoire :" supprDossiersh

#Condition pour la suppression
if [ -d "$supprDossiersh" ];
then
	rm -r "$supprDossiersh"
	echo "Dossier $supprDossiersh supprimé avec succès"
else
	echo "Le dossier $supprDossiersh ne peut être supprimé car il n'existe pas !"
	exit 0
fi
```

### PowerShell


```
Demande à l'utilisateur s'il souhaite supprimer un dossier
$supprDossierps = Read-Host "Voulez-vous supprimer un dossier ? Indiquez le chemin complet du dossier :"

#On vérifie si le répertoire existe
if (Test-Path $supprDossierps -PathType Container) {
	#Supprime le dossier si celui-ci existe
	Remove-Item $supprDossierps -Recurse -Force
	Write-Host "Dossier $supprDossierps supprimé avec succès !"
} else {
	Write-Host "Le dossier $supprDossierps n'existe pas et ne peut donc être supprimé"
}
```

## Prise de main à distance

### Shell Bash


### PowerShell


## Définition de règles de pare-feu

### Shell Bash

```
#Affiche les règles actuelles du pare-feu
ufw status
```
### PowerShell

```
#Afficher les informations du pare-feu sur un profil réseau
Get-NetFirewallProfile
```
## Activation de pare-feu

### Shell Bash

```
#On souhaite activer les pare-feu
sudo ufw enable
```
### PowerShell

```
#On souhaite modifier et activer les profils réseau sur le pare-feu
#Si l'on souhaite demander à l'utilisateur s'il veut impacter le Domaine et/ou le Privé et/ou le Public
#On demande alors le/lesquels il souhaite activer
$activationfwps = Read-Host "Quel(s) profil(s) réseau souhaitez-vous activer ? (1=Domaine,2=Privé,3=Public)"

# Vérifier la saisie de l'utilisateur et activer les profils appropriés
switch ($activationfwps) {
    '1' {
        Set-NetFirewallProfile -Profile Domain -Enabled True
        Write-Host "Le profil de pare-feu Domaine a été activé."
    }
    '2' {
        Set-NetFirewallProfile -Profile Private -Enabled True
        Write-Host "Le profil de pare-feu Privé a été activé."
    }
    '3' {
        Set-NetFirewallProfile -Profile Public -Enabled True
        Write-Host "Le profil de pare-feu Public a été activé."
    }
    Default {
        Write-Host "Choix invalide. Veuillez saisir 1, 2 ou 3 pour activer les profils de pare-feu correspondants."
    }
}
```
## Désactivation du pare-feu

### Shell Bash


### PowerShell


## Installation de logiciel

### Shell Bash


### PowerShell


## Désinstallation de logiciel

### Shell Bash


### PowerShell

