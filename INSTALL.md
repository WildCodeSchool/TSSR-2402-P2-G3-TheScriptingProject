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

#Importer le module WindowsUpdate
Import-Module WindowsUpdate

#Rechercher les mises à jour disponibles
$updates = Get-WindowsUpdate -Online

#Vérifier s'il y a des mises à jour disponibles
if ($updates.Count -gt 0) {
    Write-Host "Les mises à jour suivantes sont disponibles :"
    $updates | Format-Table -Property Title, KB, Description -AutoSize
} else {
    Write-Host "Aucune mise à jour n'est disponible pour le moment."
}
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
\#Demande à l'utilisateur le chemin complet du dossier à créer
$creationDossierps = Read-Host "Entrez le chemin complet du dossier à créer"

\#Vérifie si le chemin spécifié existe déjà
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

```

### PowerShell

```

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
#Demande à l'utilisateur s'il souhaite supprimer un dossier
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


### PowerShell


## Activation de pare-feu

### Shell Bash


### PowerShell


## Désactivation du pare-feu

### Shell Bash


### PowerShell


## Installation de logiciel

### Shell Bash


### PowerShell


## Désinstallation de logiciel

### Shell Bash


### PowerShell

