# Menu Principal
function menuMainMenu {
    # Listing des options
    Write-Host "MENU PRINCIPAL" -ForegroundColor Cyan
    Write-Host "Sélectionnez un choix parmi :" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "1 - Client Ubuntu CLILIN01"
    Write-Host "2 - Client Ubuntu CLILIN02"
    Write-Host "3 - Client Windows CLIWIN01"
    Write-Host "4 - Client Windows CLIWIN02"
    Write-Host "L - Consultation Logs"
    Write-Host "x - Quitter l'outil d'Administration"

    # Création variable pour enregistrer le choix du menu
    $targetMainMenu = Read-Host "`nVotre choix"
    
    # Création variable menu courant
    $currentMenu = "PRINCIPAL"

    # Redirection en fonction du choix du menu
    switch ($targetMainMenu) {
        "1" {
            # Création de variables prédéfinies
            $clientName = "CLILIN01"
            $clientIP = "172.16.10.30"
            # Demande de confirmation du Client
            $clientValidate = Read-Host "`nConfirmez-vous vouloir vous connecter au Client $clientName ? (O/n)"
            if ($clientValidate -eq "O") {
                # Si OK >> Continue
                # Redirection vers Menu Action Information
                $eventLog = "Redirection vers Menu Action Info"
                eventLogTask
                menuActionInfo
            }
            else {
                # Sinon >> Retour au menu
                notConfirmed
                menuMainMenu
            }
        }
        "2" {
            # Création de variables prédéfinies
            $clientName = "CLILIN02"
            $clientIP = "172.16.10.31"
            # Demande de confirmation du Client
            $clientValidate = Read-Host "`nConfirmez-vous vouloir vous connecter au Client $clientName ? (O/n)"
            if ($clientValidate -eq "O") {
                # Si OK >> Continue
                # Redirection vers Menu Action Information
                $eventLog = "Redirection vers Menu Action Info"
                eventLogTask
                menuActionInfo
            }
            else {
                # Sinon >> Retour au menu
                notConfirmed
                menuMainMenu
            }
        }
        "3" {
            # Création de variables prédéfinies
            $clientName = "CLIWIN01"
            $clientIP = "172.16.10.20"
            # Demande de confirmation du Client
            $clientValidate = Read-Host "`nConfirmez-vous vouloir vous connecter au Client $clientName ? (O/n)"
            if ($clientValidate -eq "O") {
                # Si OK >> Continue
                # Redirection vers Menu Action Information
                $eventLog = "Redirection vers Menu Action Info"
                eventLogTask
                menuActionInfo
            }
            else {
                # Sinon >> Retour au menu
                notConfirmed
                menuMainMenu
            }
        }
        "4" {
            # Création de variables prédéfinies
            $clientName = "CLIWIN02"
            $clientIP = "172.16.10.21"
            # Demande de confirmation du Client
            $clientValidate = Read-Host "`nConfirmez-vous vouloir vous connecter au Client $clientName ? (O/n)"
            if ($clientValidate -eq "O") {
                # Si OK >> Continue
                # Redirection vers Menu Action Information
                $eventLog = "Redirection vers Menu Action Info"
                eventLogTask
                menuActionInfo
            }
            else {
                # Sinon >> Retour au menu
                notConfirmed
                menuMainMenu
            }
        }
        "L" {
            # Redirection vers Menu Consultation Logs
            $eventLog = "Redirection vers Menu Consultations Logs"
            eventLogTask
            menuLogmenu
        }
        "x" {
            # Fin de prise de Logs + Sortie Script
            endLogTask
            exit
        }
        Default {
            # Choix indisponible >> Retour au Menu
            notAvailable
            menuLogMenu
        }
    }
}

# Menu Action Information
function menuActionInfo {
    # Rappel du choix de Client
    Write-Host "`nVous êtes actuellement connecté au Client $clientName`n" -ForegroundColor Cyan
    # Listing des options
    Write-Host "MENU ACTION INFORMATION" -ForegroundColor Cyan
    Write-Host "Sélectionnez un choix parmi :" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "1 - Action sur un Utilisateur"
    Write-Host "2 - Action sur un Client"
    Write-Host "3 - Information sur un Utilisateur"
    Write-Host "4 - Information sur un Client"
    Write-Host "M - Retour au Menu Principal"
    Write-Host "x - Quitter l'outil d'Administration"

    # Création variable pour enregistrer le choix du menu
    $targetActionInfo = Read-Host "`nVotre choix"
    
    # Création variable menu courant
    $currentMenu = "ACTION INFORMATION"

    # Redirection en fonction du choix du menu
    switch ($targetActionInfo) {
        "1" {
            # Redirection vers Menu Action Utilisateur
            $eventLog = "Redirection vers Menu Action Utilisateur"
            eventLogTask
            menuActionUser
        }
        "2" {
            # Redirection vers Menu Action Utilisateur
            $eventLog = "Redirection vers Menu Action Client"
            eventLogTask
            menuActionClient
        }
        "3" {
            # Redirection vers Menu Action Utilisateur
            $eventLog = "Redirection vers Menu Information Utilisateur"
            eventLogTask
            menuInfoUser
        }
        "4" {
            # Redirection vers Menu Action Utilisateur
            $eventLog = "Redirection vers Menu Information Client"
            eventLogTask
            menuInfoClient
        }
        "M" {
            # Redirection vers Menu Principal
            $eventLog = "Redirection vers Menu Principal"
            eventLogTask
            menuMainMenu
        }
        "x" {
            # Fin de prise de Logs + Sortie Script
            endLogTask
            exit
        }
        Default {
            # Choix indisponible >> Retour au Menu
            notAvailable
            menuActionInfo
        }
    }
}

# Menu Action Utilisateur
function menuActionUser {
    Clear-Host
    # Rappel du choix de Client
    Write-Host "`nVous êtes actuellement connecté au Client $clientName`n" -ForegroundColor Cyan
    # Listing des options
    Write-Host "MENU ACTION UTILISATEUR" -ForegroundColor Cyan
    Write-Host "Sélectionnez un choix parmi :" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "1 - Création d'un compte Utilisateur"
    Write-Host "2 - Changement de Mot de Passe d'un compte Utilisateur"
    Write-Host "3 - Suppression d'un compte Utilisateur"
    Write-Host "4 - Désactivation d'un compte Utilisateur"
    Write-Host "5 - Ajout d'un Utilisateur à un Groupe"
    Write-Host "6 - Suppression d'un Utilisateur d'un Groupe"
    Write-Host "M - Retour au Menu Principal"
    Write-Host "x - Quitter l'outil d'Administration"

    # Création variable pour enregistrer le choix du menu
    $targetActionUser = Read-Host "`nVotre choix"
    
    # Création variable menu courant
    $currentMenu = "ACTION UTILISATEUR"

    # Redirection en fonction du choix du menu
    switch ($targetActionUser) {
        "1" {
            # Requête du nom d'Utilisateur
            $userName = Read-Host "`nPour quel Utilisateur souhaitez-vous créer un compte ?"
            # Demande de confirmation de l'Utilisateur
            $userValidate = Read-Host "`nConfirmez-vous vouloir créer un compte pour l'Utilisateur $userName ? (O/n)"
            if ($userValidate -eq "O") {
                # Si OK >> Continue
                # Connexion à distance sur le Client
                # Vérification de l'existence de l'Utilisateur dans la table
            
                Write-Host "`nL'Utisateur $userName a été créé avec succés`n" -ForegroundColor Cyan
                $eventLog = "Création du compte Utilisateur $userName"
                eventLogTask
                menuActionUser
            }
            else {
                notConfirmed
                menuActionUser
            }
        }
        "2" {
            # Requête du nom d'Utilisateur
            $userName = Read-Host "`nPour quel Utilisateur souhaitez-vous changer le mot de passe ?"
            # Demande de confirmation de l'Utilisateur
            $userValidate = Read-Host "`nConfirmez-vous vouloir changer le mot de passe de l'Utilisateur $userName ? (O/n)"
            if ($userValidate -eq "O") {
                # Si OK >> Continue
                # Vérification de l'existence de l'Utilisateur dans la table
                # Connexion à distance sur le Client
            }
            else {
                
            }
            Invoke-Command -ComputerName $clientIP -ScriptBlock {
                # Demande de confirmation de l'Utilisateur
            } -Credential wilder 
        }
        "3" {
            # Connexion à disance sur le Client
            Invoke-Command -ComputerName $clientIP -ScriptBlock {

            } -Credential wilder 
        }
        "4" {
            # Connexion à disance sur le Client
            Invoke-Command -ComputerName $clientIP -ScriptBlock {

            } -Credential wilder 
        }
        "5" {
            # Connexion à disance sur le Client
            Invoke-Command -ComputerName $clientIP -ScriptBlock {

            } -Credential wilder 
        }
        "6" {
            # Connexion à disance sur le Client
            Invoke-Command -ComputerName $clientIP -ScriptBlock {

            } -Credential wilder 
        }
        "M" {
            # Redirection vers Menu Principal
            $eventLog = "Redirection vers Menu Principal"
            eventLogTask
            menuMainMenu
        }
        "x" {
            # Fin de prise de Logs + Sortie Script
            endLogTask
            exit
        }
        Default {
            # Choix indisponible >> Retour au Menu
            notAvailable
            menuActionUser
        }
    }
}

# Menu Action Client
function menuActionClient {
    Clear-Host
    # Rappel du choix de Client
    Write-Host "`nVous êtes actuellement connecté au Client $clientName`n" -ForegroundColor Cyan
    # Listing des options
    Write-Host "MENU ACTION CLIENT" -ForegroundColor Cyan
    Write-Host "Sélectionnez un choix parmi :" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "1 - Arrêt du Client"
    Write-Host "2 - Redémarrage du Client"
    Write-Host "3 - Verrouillage du Client"
    Write-Host "4 - Mise-à-jour système du Client"
    Write-Host "5 - Création de répertoire"
    Write-Host "6 - Modification de répertoire"
    Write-Host "7 - Suppression de répertoire"
    Write-Host "8 - Prise de main à distance (CLI)"
    Write-Host "9 - Définition des règles du parefeu"
    Write-Host "10 - Activation du parefeu"
    Write-Host "11 - Désactivation du parefeu"
    Write-Host "12 - Installation de logiciel"
    Write-Host "13 - Désinstallation de logiciel"
    Write-Host "14 - Exécution de script sur la machione distante"
    Write-Host "M - Retour au Menu Principal"
    Write-Host "x - Quitter l'outil d'Administration"

    # Création variable pour enregistrer le choix du menu
    $targetActionClient = Read-Host "`nVotre choix"
    
    # Création variable menu courant
    $currentMenu = "ACTION CLIENT"

    # Redirection en fonction du choix du menu
    switch ($targetActionClient) {
        "1" {
            Invoke-Command -ComputerName $clientIP -ScriptBlock {

            } -Credential wilder 
        }
        "2" {
            Invoke-Command -ComputerName $clientIP -ScriptBlock {

            } -Credential wilder 
        }
        "3" {
            Invoke-Command -ComputerName $clientIP -ScriptBlock {

            } -Credential wilder 
        }
        "4" {
            Invoke-Command -ComputerName $clientIP -ScriptBlock {

            } -Credential wilder 
        }
        "5" {
            Invoke-Command -ComputerName $clientIP -ScriptBlock {

            } -Credential wilder 
        }
        "6" {
            Invoke-Command -ComputerName $clientIP -ScriptBlock {

            } -Credential wilder 
        }
        "7" {
            Invoke-Command -ComputerName $clientIP -ScriptBlock {

            } -Credential wilder 
        }
        "8" {
            Invoke-Command -ComputerName $clientIP -ScriptBlock {

            } -Credential wilder 
        }
        "9" {
            Invoke-Command -ComputerName $clientIP -ScriptBlock {

            } -Credential wilder 
        }
        "10" {
            Invoke-Command -ComputerName $clientIP -ScriptBlock {

            } -Credential wilder 
        }
        "11" {
            Invoke-Command -ComputerName $clientIP -ScriptBlock {

            } -Credential wilder 
        }
        "12" {
            Invoke-Command -ComputerName $clientIP -ScriptBlock {

            } -Credential wilder 
        }
        "13" {
            Invoke-Command -ComputerName $clientIP -ScriptBlock {

            } -Credential wilder 
        }
        "14" {
            Invoke-Command -ComputerName $clientIP -ScriptBlock {

            } -Credential wilder 
        }
        "M" {
            # Redirection vers Menu Principal
            $eventLog = "Redirection vers Menu Principal"
            eventLogTask
            menuMainMenu
        }
        "x" {
            # Fin de prise de Logs + Sortie Script
            endLogTask
            exit
        }
        Default {
            # Choix indisponible >> Retour au Menu
            notAvailable
            menuActionClient
        }
    }
}

# Menu Information Utilisateur
function menuInfoUser {
    Clear-Host
    # Rappel du choix de Client
    Write-Host "`nVous êtes actuellement connecté au Client $clientName`n" -ForegroundColor Cyan
    # Listing des options
    Write-Host "MENU INFORMATION UTILISATEUR" -ForegroundColor Cyan
    Write-Host "Sélectionnez un choix parmi :" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "1 - Date de dernière connexion d'un Utilisateur"
    Write-Host "2 - Date de dernière modification de mot de passe d'un Utilisateur"
    Write-Host "3 - Liste des sessions ouvertes par un Utilisateur"
    Write-Host "4 - Groupe d'apartenance d'un Utilisateur"
    Write-Host "5 - Historiques des commandes exécutées par un Utilisateur"
    Write-Host "6 - Droits/Permissions de l'Utilisateur sur un dossier"
    Write-Host "7 - Droits/Permissions de l'Utilisateur sur un fichier"
    Write-Host "M - Retour au Menu Principal"
    Write-Host "x - Quitter l'outil d'Administration"

    # Création variable pour enregistrer le choix du menu
    $targetInfoUser = Read-Host "`nVotre choix"
    
    # Création variable menu courant
    $currentMenu = "INFORMATION UTILISATEUR"

    # Redirection en fonction du choix du menu
    switch ($targeInfoUser) {
        "1" {
            # Requête pour un nom d'Utilisateur
            $userName = Read-Host "`nPour quel Utilisateur souhaitez-vous connaitre la date de dernière connexion ?"
            # Demande de confirmation de l'Utilisateur
            $optionValidate = Read-Host "`nConfirmez-vous cette information pour l'Utilisateur $userName ? (O/n)"
            if ($optionValidate -eq "O") {
                # Si OK >> Continue
                Invoke-Command -ComputerName $clientIP -ScriptBlock {
                    Get-WinEvent -LogName Security | Where-Object { $_.ID -eq 4624 } | Select-Object -Property TimeCreated, @{Name = 'userName'; Expression = { $_.Properties[5].Value } } -First 1
                } -Credential wilder
                $eventLog = "Requête Information Date dernière connexion de $userName sur $clientName"
                eventLogTask
                $infoLogPreview = ""
                infoLogTask
                menuInfoUser
            }
            else {
                # Sinon >> Retour au Menu
                notConfirmed
                menuInfoUser
            }
        }
        "2" {
            # Requête pour un nom d'Utilisateur
            $userName = Read-Host "`nPour quel Utilisateur souhaitez-vous connaitre la date de dernière modification de MDP ?"
            # Demande de confirmation de l'Utilisateur
            $optionValidate = Read-Host "`nConfirmez-vous cette information pour l'Utilisateur $userName ? (O/n)"
            if ($optionValidate -eq "O") {
                # Si OK >> Continue
                Invoke-Command -ComputerName $clientIP -ScriptBlock {
                    Get-LocalUser | Select-Object $userName, LastPasswordChangeTimestamp 
                } -Credential wilder
                $eventLog = "Requête Information Date dernière modification MDP de $userName sur $clientName"
                eventLogTask
                $infoLogPreview = ""
                infoLogTask
                menuInfoUser
            }
            else {
                # Sinon >> Retour au Menu
                notConfirmed
                menuInfoUser
            }
        }
        "3" {
            # Requête pour un nom d'Utilisateur
            $userName = Read-Host "`nPour quel Utilisateur souhaitez-vous connaitre la liste des sessions ouvertes ?"
            # Demande de confirmation de l'Utilisateur
            $optionValidate = Read-Host "`nConfirmez-vous cette information pour l'Utilisateur $userName ? (O/n)"
            if ($optionValidate -eq "O") {
                # Si OK >> Continue
                Invoke-Command -ComputerName $clientIP -ScriptBlock {
                    Get-WmiObject -Class Win32_ComputerSystem | Select-Object $userName
                } -Credential wilder
                $eventLog = "Requête Information Liste des sessions ouvertes par $userName sur $clientName"
                eventLogTask
                $infoLogPreview = ""
                infoLogTask
                menuInfoUser
            }
            else {
                # Sinon >> Retour au Menu
                notConfirmed
                menuInfoUser
            }
        }
        "4" {
            # Requête pour un nom d'Utilisateur
            $userName = Read-Host "`nPour quel Utilisateur souhaitez-vous connaitre les groupes d'appartenance ?"
            # Demande de confirmation de l'Utilisateur
            $optionValidate = Read-Host "`nConfirmez-vous cette information pour l'Utilisateur $userName ? (O/n)"
            if ($optionValidate -eq "O") {
                # Si OK >> Continue
                Invoke-Command -ComputerName $clientIP -ScriptBlock {
                    Get-LocalGroup -Member $UserName
                } -Credential wilder
                $eventLog = "Requête Information Groupe d'appartenance de $userName sur $clientName"
                eventLogTask
                $infoLogPreview = ""
                infoLogTask
                menuInfoUser
            }
            else {
                # Sinon >> Retour au Menu
                notConfirmed
                menuInfoUser
            }
        }
        "5" {
            Invoke-Command -ComputerName $clientIP -ScriptBlock {

            } -Credential wilder
            $eventLog = "Requête Information Historique des commandes exécutées par $userName sur $clientName"
            eventLogTask
            $infoLogPreview = ""
            infoLogTask
            menuInfoUser
            else {
                # Sinon >> Retour au Menu
                notConfirmed
                menuInfoUser
            }
        }
        "6" {
            Invoke-Command -ComputerName $clientIP -ScriptBlock {

            } -Credential wilder
            $eventLog = "Requête Information Drtois/Permissions de l'utilisateur sur le dossier $folderName sur $clientName"
            eventLogTask
            $infoLogPreview = ""
            infoLogTask
            menuInfoUser
        }
        "7" {
            Invoke-Command -ComputerName $clientIP -ScriptBlock {

            } -Credential wilder
            $eventLog = "Requête Information Drois/Permissions de l'utilisateur sur le fichier $fileName sur $clientName"
            eventLogTask
            $infoLogPreview = ""
            infoLogTask
            menuInfoUser
        }
        "M" {
            # Redirection vers Menu Principal
            $eventLog = "Redirection vers Menu Principal"
            eventLogTask
            menuMainMenu
        }
        "x" {
            # Fin de prise de Logs + Sortie Script
            endLogTask
            exit
        }
        Default {
            # Choix indisponible >> Retour au Menu
            notAvailable
            menuInfoUser
        }
    }
}

# Menu Information Client
function menuInfoClient {
    Clear-Host
    # Rappel du choix de Client
    Write-Host "`nVous êtes actuellement connecté au Client $clientName`n" -ForegroundColor Cyan
    # Listing des options
    Write-Host "MENU INFORMATION CLIENT" -ForegroundColor Cyan
    Write-Host "Sélectionnez un choix parmi :" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "1 - Version de l'OS"
    Write-Host "2 - Nombre de disque"
    Write-Host "3 - Partition (nombre, nom, filesystem, taille) par disque"
    Write-Host "4 - Liste des applications/paquets installés"
    Write-Host "5 - Liste des services en cours d'exécution"
    Write-Host "6 - Liste des utilisateurs locaux"
    Write-Host "7 - Type de CPU (nombre de coeurs, etc...)"
    Write-Host "8 - Mémoire RAM totale"
    Write-Host "9 - Utilisation de la RAM"
    Write-Host "10 - Utilisation de Disque"
    Write-Host "11 - Utilisation du Processeur"
    Write-Host "M - Retour au Menu Principal"
    Write-Host "x - Quitter l'outil d'Administration"

    # Création variable pour enregistrer le choix du menu
    $targetInfoClient = Read-Host "`nVotre choix"
    
    # Création variable menu courant
    $currentMenu = "INFORMATION CLIENT"

    # Redirection en fonction du choix du menu
    switch ($targetInfoClient) {
        "1" {
            Invoke-Command -ComputerName $clientIP -ScriptBlock {
                $osVersion = (Get-WmiObject -Class Win32_OperatingSystem).Caption
            } -Credential wilder
            Write-Host "`nVersion de l'OS : $osVersion`n"
            $eventLog = "Requête Information Version OS de $clientName"
            eventLogTask
            $infoLogPreview = "Version de l'OS : $osVersion"
            infoLogTask
            menuInfoClient
        }
        "2" {
            Invoke-Command -ComputerName $clientIP -ScriptBlock {
                $numberOfDisks = (Get-CimInstance -ClassName Win32_DiskDrive).Count
            } -Credential wilder
            Write-Host "`nNombre de disques installés : $numberOfDisks`n"
            $eventLog = "Requête Information Nombre de disque de $clientName"
            eventLogTask
            $infoLogPreview = "Nombre de disques installés : $numberOfDisks"
            infoLogTask
            menuInfoClient
        }
        "3" {
            Write-Host "`nInformations sur les partitions :`n"
            Invoke-Command -ComputerName $clientIP -ScriptBlock {
                Get-WmiObject -Class Win32_DiskPartition | Select-Object DeviceID, Name, Size, Type
            } -Credential wilder
            $eventLog = "Requête Information sur les partitions de $clientName"
            eventLogTask
            $infoLogPreview = ""
            infoLogTask
            menuInfoClient
        }
        "4" {
            Write-Host "`nListe des application/paquets installés :`n"
            Invoke-Command -ComputerName $clientIP -ScriptBlock {
                Get-WmiObject -Class Win32_Product | Select-Object -Property Name
            } -Credential wilder
            $eventLog = "Requête Information Liste des application/paquets installés de $clientName"
            eventLogTask
            $infoLogPreview = ""
            infoLogTask
            menuInfoClient
        }
        "5" {
            Write-Host "`nListe des services en cours d'exécution :`n"
            Invoke-Command -ComputerName $clientIP -ScriptBlock {
                Get-Service | Where-Object { $_.Status -eq 'Running' }
            } -Credential wilder
            $eventLog = "Requête Information Liste des services en cours d'exécution de $clientName"
            eventLogTask
            $infoLogPreview = ""
            infoLogTask
            menuInfoClient
        }
        "6" {
            Write-Host "`nListe des utilisateurs locaux :`n"
            Invoke-Command -ComputerName $clientIP -ScriptBlock {
                Get-LocalUser | Select-Object Name
            } -Credential wilder
            $eventLog = "Requête Information Liste des utilisateur locaux de $clientName"
            eventLogTask
            $infoLogPreview = ""
            infoLogTask
            menuInfoClient
        }
        "7" {
            Write-Host "`nInformations sur le CPU :`n"
            Invoke-Command -ComputerName $clientIP -ScriptBlock {
                Get-WmiObject Win32_Processor | Select-Object Name, Manufacturer, MaxClockSpeed, NumberOfCores, NumberOfLogicalProcessors
            } -Credential wilder
            $eventLog = "Requête Information Type de CPU de $clientName"
            eventLogTask
            $infoLogPreview = ""
            infoLogTask
            menuInfoClient
        }
        "8" {
            Write-Host "`nInformations sur le Mémoire RAM :`n"
            Invoke-Command -ComputerName $clientIP -ScriptBlock {
                Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object TotalVisibleMemorySize, FreePhysicalMemory
            } -Credential wilder
            $eventLog = "Requête Information Mémoire RAM totale de $clientName"
            eventLogTask
            $infoLogPreview = ""
            infoLogTask
            menuInfoClient
        }
        "9" {
            Write-Host "`nInformations sur l'Utilisation de la RAM :`n"
            Invoke-Command -ComputerName $clientIP -ScriptBlock {
                Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object TotalVisibleMemorySize, FreePhysicalMemory
            } -Credential wilder
            $eventLog = "Requête Information Utilisation de la RAM de $clientName"
            eventLogTask
            $infoLogPreview = ""
            infoLogTask
            menuInfoClient
        }
        "10" {
            Write-Host "`nInformations sur l'Utilisation du disque :`n"
            Invoke-Command -ComputerName $clientIP -ScriptBlock {
                Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'" | Select-Object -Property FreeSpace, Size
            } -Credential wilder
            $eventLog = "Requête Information Utilisation du disque de $clientName"
            eventLogTask
            $infoLogPreview = ""
            infoLogTask
            menuInfoClient
        }
        "11" {
            Write-Host "`nInformations sur l'Utilisation du processeur :`n"
            Invoke-Command -ComputerName $clientIP -ScriptBlock {
                Get-Counter '\Processor(_Total)\% Processor Time'
            } -Credential wilder
            $eventLog = "Requête Information Utilisation du Processeur de $clientName"
            eventLogTask
            $infoLogPreview = ""
            infoLogTask
            menuInfoClient
        }
        "M" {
            # Redirection vers Menu Principal
            $eventLog = "Redirection vers Menu Principal"
            eventLogTask
            menuMainMenu
        }
        "x" {
            # Fin de prise de Logs + Sortie Script
            endLogTask
            exit
        }
        Default {
            # Choix indisponible >> Retour au Menu
            notAvailable
            menuInfoClient
        }
    }
}

# Menu Consulations Logs
function menuLogMenu {
    Clear-Host
    # Listing des options
    Write-Host "MENU CONSULATIONS LOGS" -ForegroundColor Cyan
    Write-Host "Sélectionnez un choix parmi :" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "1 - Client Ubuntu CLILIN01"
    Write-Host "2 - Client Ubuntu CLILIN02"
    Write-Host "3 - Client Windows CLIWIN01"
    Write-Host "4 - Client Windows CLIWIN02"
    Write-Host "U - Consultation Logs Utilisateurs"
    Write-Host "M - Retour au MENU PRINCIPALE"
    Write-Host "x - Quitter l'outil d'Administration"

    # Création variable pour enregistrer le choix du menu
    $targetLogMenu = Read-Host "`nVotre choix"
    
    # Création variable menu courant
    $currentMenu = "CONSULTATIONS LOGS"

    # Redirection en fonction du choix du menu
    switch ($targetLogMenu) {
        "1" {
            # Nom du Client prédéfini dasn variable
            $clientName = "CLILIN01"
            Write-Host "`nVous avez sélectionné le Client $clientName`n"
            # Demande de confirmation du Client
            $clientValidate = Read-Host "`nConfirmez-vous vouloir faire une recherche pour le Client $clientName ? (O/n)"
            if ($clientValidate -eq "O") {
                # Si OK >> Continue
                # Vérification que le Client apparaît dans les Logs
                if (Get-Content -Path C:\Windows\System32\LogFiles\log_evt.log | Select-String -Pattern "$clientName") {
                    # Si OK >> Affichage des Logs
                    Write-Host "`nVous recherchez les Logs pour le Client $clientName`n" -ForegroundColor Cyan
                    Get-Content -Path C:\Windows\System32\LogFiles\log_evt.log | Select-String -Pattern "$clientName"
                    menuLogMenu
                }
                else {
                    # Sinon >> Retour au Menu
                    Write-Host "`nErreur : Le Client $clientName n'apparaît pas dans les Logs`n" -ForegroundColor Yellow
                    menuLogMenu
                }
            }
            else {
                # Sinon >> Retour au Menu
                notConfirmed
                menuLogMenu                
            }
        }
        "2" {
            # Nom du Client prédéfini dasn variable
            $clientName = "CLILIN02"
            Write-Host "`nVous avez sélectionné le Client $clientName`n"
            # Demande de confirmation du Client
            $clientValidate = Read-Host "`nConfirmez-vous vouloir faire une recherche pour le Client $clientName ? (O/n)"
            if ($clientValidate -eq "O") {
                # Si OK >> Continue
                # Vérification que le Client apparaît dans les Logs
                if (Get-Content -Path C:\Windows\System32\LogFiles\log_evt.log | Select-String -Pattern "$clientName") {
                    # Si OK >> Affichage des Logs
                    Write-Host "`nVous recherchez les Logs pour le Client $clientName`n" -ForegroundColor Cyan
                    Get-Content -Path C:\Windows\System32\LogFiles\log_evt.log | Select-String -Pattern "$clientName"
                    menuLogMenu
                }
                else {
                    # Sinon >> Retour au Menu
                    Write-Host "`nErreur : Le Client $clientName n'apparaît pas dans les Logs`n" -ForegroundColor Yellow
                    menuLogMenu
                }
            }
            else {
                # Sinon >> Retour au Menu
                notConfirmed
                menuLogMenu                
            }
        }
        "3" {
            # Nom du Client prédéfini dasn variable
            $clientName = "CLIWIN01"
            Write-Host "`nVous avez sélectionné le Client $clientName`n"
            # Demande de confirmation du Client
            $clientValidate = Read-Host "`nConfirmez-vous vouloir faire une recherche pour le Client $clientName ? (O/n)"
            if ($clientValidate -eq "O") {
                # Si OK >> Continue
                # Vérification que le Client apparaît dans les Logs
                if (Get-Content -Path C:\Windows\System32\LogFiles\log_evt.log | Select-String -Pattern "$clientName") {
                    # Si OK >> Affichage des Logs
                    Write-Host "`nVous recherchez les Logs pour le Client $clientName`n" -ForegroundColor Cyan
                    Get-Content -Path C:\Windows\System32\LogFiles\log_evt.log | Select-String -Pattern "$clientName"
                    menuLogMenu
                }
                else {
                    # Sinon >> Retour au Menu
                    Write-Host "`nErreur : Le Client $clientName n'apparaît pas dans les Logs`n" -ForegroundColor Yellow
                    menuLogMenu
                }
            }
            else {
                # Sinon >> Retour au Menu
                notConfirmed
                menuLogMenu                
            }
        }
        "4" {
            # Nom du Client prédéfini dasn variable
            $clientName = "CLIWIN02"
            Write-Host "`nVous avez sélectionné le Client $clientName`n"
            # Demande de confirmation du Client
            $clientValidate = Read-Host "`nConfirmez-vous vouloir faire une recherche pour le Client $clientName ? (O/n)"
            if ($clientValidate -eq "O") {
                # Si OK >> Continue
                # Vérification que le Client apparaît dans les Logs
                if (Get-Content -Path C:\Windows\System32\LogFiles\log_evt.log | Select-String -Pattern "$clientName") {
                    # Si OK >> Affichage des Logs
                    Write-Host "`nVous recherchez les Logs pour le Client $clientName`n" -ForegroundColor Cyan
                    Get-Content -Path C:\Windows\System32\LogFiles\log_evt.log | Select-String -Pattern "$clientName"
                    menuLogMenu
                }
                else {
                    # Sinon >> Retour au Menu
                    Write-Host "`nErreur : Le Client $clientName n'apparaît pas dans les Logs`n" -ForegroundColor Yellow
                    menuLogMenu
                }
            }
            else {
                # Sinon >> Retour au Menu
                notConfirmed
                menuLogMenu                
            }
        }
        "U" {
            # Reaquête du nom d'Utilisateur à rechercher
            $userTarget = Read-Host "`nPour quel Utilisateur souhaitez-vous consulter les Logs ?"
            # Demande de confirmation de l'Utilisateur
            $userValidate = Read-Host "`nConfirmez-vous vouloir faire une recherche pour l'Utilisateur $userTarget ? (O/n)"
            if ($userValidate -eq "O") {
                # Si OK >> Continue
                # Vérification que l'Utilisateur apparaît dans les Logs
                if (Get-Content -Path C:\Windows\System32\LogFiles\log_evt.log | Select-String -Pattern "$userTarget") {
                    # Si OK >> Affichage des Logs
                    Write-Host "`nVous recherchez les Logs pour l'Utilisateur $userTarget`n" -ForegroundColor Cyan
                    Get-Content -Path C:\Windows\System32\LogFiles\log_evt.log | Select-String -Pattern "$userTarget"
                    menuLogMenu
                }
                else {
                    # Sinon >> Retour au Menu
                    Write-Host "`nErreur : L'Utilisateur $userTarget n'apparaît pas dans les Logs`n" -ForegroundColor Yellow
                    menuLogMenu
                }
            }
            else {
                # Sinon >> Retour au Menu
                notConfirmed
                menuLogMenu                
            }
        }
        "M" {
            # Redirection vers Menu Principal
            $eventLog = "Redirection vers Menu Principal"
            eventLogTask
            menuMainMenu
        }
        "x" {
            # Fin de prise de Logs + Sortie Script
            endLogTask
            exit
        }
        Default {
            # Choix indisponible >> Retour au Menu
            notAvailable
            menuLogMenu
        }
    }
}

# Erreur de choix
function notAvailable {
    Write-Host "`nErreur : Ce choix n'est pas disponible - Retour au MENU $currentMenu`n" -ForegroundColor Yellow
}

# Erreur de confirmation
function notConfirmed {
    Write-Host "`nErreur : Vous n'avez pas confirmé votre choix - Retour au MENU $currentMenu`n" -ForegroundColor Yellow
}

# Début de prise de Logs
function beginLogTask {
    Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log -Value "$(Get-Date -Format yyyyMMdd)-$(Get-Date -Format HHmmss)-$env:USERNAME-********StartScript********"
}

# Fin de prise de Logs
function endLogTask {
    Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log -Value "$(Get-Date -Format yyyyMMdd)-$(Get-Date -Format HHmmss)-$env:USERNAME-*********EndScript*********"
}

# Evènements pour la prise de Logs
function eventLogTask {
    Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log -Value "$(Get-Date -Format yyyyMMdd)-$(Get-Date -Format HHmmss)-$env:USERNAME-$eventLog"
}

# Informations pour la prise de Logs
function infoLogTask {
    Add-Content -Path C:\Users\Administrator\Documents\info_$eventTarget`_$(Get-Date -Format yyyyMMdd).txt -Value "$(Get-Date -Format yyyyMMdd)-$(Get-Date -Format HHmmss)-$env:USERNAME-$eventLog"
    Add-Content -Path C:\Users\Administrator\Documents\info_$eventTarget`_$(Get-Date -Format yyyyMMdd).txt -Value "$infoLogPreview"
    Write-Host "`nLes informations recueillies sont disponibles dans le fichier situé dans C:\Users\Administrator\Documents\info_$eventTarget`_$(Get-Date -Format yyyyMMdd).txt" -ForegroundColor Cyan
}



Clear-Host
# Début de la prise de Log
beginLogTask
Write-host "Bienvenue dans l'outil d'Administration" -ForegroundColor Cyan
$eventLog = "Démarrage du Menu Principal"
eventLogTask
# Démarrage du Menu Prinicpal
menuMainMenu



