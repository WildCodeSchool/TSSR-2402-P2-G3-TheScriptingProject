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
    Write-Host "R - Retour au Menu Action/Information"
    Write-Host "M - Retour au Menu Principal"
    Write-Host "x - Quitter l'outil d'Administration"

    # Création variable pour enregistrer le choix du menu
    $targetActionUser = Read-Host "`nVotre choix"
    
    # Création variable menu courant
    $currentMenu = "ACTION UTILISATEUR"

    # Redirection en fonction du choix du menu
    switch ($targetActionUser) {
        "1" {
            $userName = Read-Host "`nPour quel Utilisateur souhaitez-vous créer un compte ?"
            $optionValidate = Read-Host "`nConfirmez-vous vouloir créer un compte pour l'Utilisateur $userName ? (O/n)"
            if ($optionValidate -eq "O") {
                # Vérification que l'utilisateur existe
                if (Get-LocalUser -Name $userName -ErrorAction SilentlyContinue) {
                    Write-Host "`nErreur : L'Utilisateur $userName existe déjà`n"
                    menuActionUser
                }
                else {
                    try {
                        Invoke-Command -ComputerName $clientIP -ScriptBlock {
                            param($userName)
                            New-LocalUser -Name $userName 
                            Write-Host "`nLe compte de l'Utilisateur $userName a été créé avec succés`n"
                        } -Credential wilder -ArgumentList $userName -ErrorAction Stop
                        $eventLog = "Création du compte de l'Utilisateur $userName sur $clientName"
                        eventLogTask
                        menuActionUser
                    }
                    catch {
                        Write-Host "`nErreur : Lors de la création du compte de l'Utilisateur`n"
                        menuActionUser
                    }
                }
            
            }
            else {
                notConfirmed
                menuActionUser
            }
        }
        "2" {
            $userName = Read-Host "`nQuel Utilisateur souhaitez-vous changer le Mot de Passe ?"
            $optionValidate = Read-Host "`nConfirmez-vous vouloir changer le Mot de Passe de l'Utilisateur $userName ? (O/n)"
            if ($optionValidate -eq "O") {
                # Vérification que l'utilisateur existe
                if (-not (Get-LocalUser -Name $userName -ErrorAction SilentlyContinue)) {
                    Write-Host "`nErreur : L'Utilisateur $userName n'existe pas`n"
                    menuActionUser
                }
                else {
                    try {
                        Invoke-Command -ComputerName $clientIP -ScriptBlock {
                            param($userName)
                            Set-LocalUser -Name $userName -Password (ConvertTo-SecureString -AsPlainText -Force) 
                            Write-Host "`nLe Mot de Passe de l'Utilisateur $userName a été modifié avec succés`n"
                        } -Credential wilder -ArgumentList $userName -ErrorAction Stop
                        $eventLog = "Modification du Mot de Passe de l'Utilisateur $userName sur $clientName"
                        eventLogTask
                        menuActionUser
                    }
                    catch {
                        Write-Host "`nErreur : Lors du changement de Mot de Passe de l'Utilisateur`n"
                        menuActionUser
                    }
                }
            }
            else {
                notConfirmed
                menuActionUser
            }
        }
        "3" {
            $userName = Read-Host "`nQuel Utilisateur souhaitez-vous supprimer ?"
            $optionValidate = Read-Host "`nConfirmez-vous vouloir supprimer l'Utilisateur $userName ? (O/n)"
            if ($optionValidate -eq "O") {
                # Vérification que l'utilisateur existe
                if (-not (Get-LocalUser -Name $userName -ErrorAction SilentlyContinue)) {
                    Write-Host "`nErreur : L'Utilisateur $userName n'existe pas`n"
                    menuActionUser
                }
                else {
                    try {
                        Invoke-Command -ComputerName $clientIP -ScriptBlock {
                            param($userName)
                            Remove-LocalUser -Name $userName
                            Write-Host "`nLe compte $userName a été supprimé avec succés`n"
                        } -Credential wilder -ArgumentList $userName -ErrorAction Stop
                        $eventLog = "Suppression de l'Utilisateur $userName sur $clientName"
                        eventLogTask
                        menuActionUser
                    }
                    catch {
                        Write-Host "`nErreur : Lors de la suppression de l'Utilisateur`n"
                        menuActionUser
                    }
                }
            }
            else {
                notConfirmed
                menuActionUser
            }
        }
        "4" {
            $userName = Read-Host "`nQuel Utilisateur souhaitez-vous désactiver ?"
            $optionValidate = Read-Host "`nConfirmez-vous vouloir désactiver l'Utilisateur $userName ? (O/n)"
            if ($optionValidate -eq "O") {
                # Vérification que l'utilisateur existe
                if (-not (Get-LocalUser -Name $userName -ErrorAction SilentlyContinue)) {
                    Write-Host "`nErreur : L'Utilisateur $userName n'existe pas`n"
                    menuActionUser
                }
                else {
                    try {
                        Invoke-Command -ComputerName $clientIP -ScriptBlock {
                            param($userName)
                            Disable-LocalUser $userName -Confirm
                            Write-Host "`nLe compte $userName a été désactivé avec succés`n"
                        } -Credential wilder -ArgumentList $userName -ErrorAction Stop
                        $eventLog = "Désactivation de l'Utilisateur $userName sur $clientName"
                        eventLogTask
                        menuActionUser
                    }
                    catch {
                        Write-Host "`nErreur : Lors de la désactivation de l'Utilisateur`n"
                        menuActionUser
                    }
                }
            }
            else {
                notConfirmed
                menuActionUser
            }
        }
        "5" {
            $userName = Read-Host "`nQuel Utilisateur souhaitez-vous ajouter à un Groupe ?"
            $groupName = Read-Host "`nAvec quel Groupe souhaitez-vous intéragir ?"
            $optionValidate = Read-Host "`nConfirmez-vous vouloir ajouter l'Utilisateur $userName du Groupe $groupName ? (O/n)"
            if ($optionValidate -eq "O") {
                # Si OK >> Continue
                # Vérification de l'existence de l'Utilisateur
                if (Get-LocalUser -Name $userName -ErrorAction SilentlyContinue) {
                    Write-Host "`nErreur : L'Utilisateur $userName n'existe pas`n" -ForegroundColor Yellow
                    menuActionUser
                }
                else {
                    try {
                        Invoke-Command -ComputerName $clientIP -ScriptBlock {
                            param($groupName, $userName)
                            Add-LocalGroupMember -Group $using:groupName -Member $using:userName -Confirm
                            Write-Host "`nL'Utilisateur $userName a été ajouté du Groupe $groupName avec succés`n"
                        } -Credential wilder -ArgumentList $groupName -ErrorAction Stop
                        $eventLog = "Ajout de $userName au Groupe $groupName sur $clientName"
                        eventLogTask
                        menuActionUser
                    }
                    catch {
                        Write-Host "`nErreur : Lors de l'ajout de l'utilisateur au groupe`n" -ForegroundColor Yellow
                        menuActionUser
                    }
                }
            }
            else {
                notConfirmed
                menuActionUser
            }
        }
        "6" {
            $userName = Read-Host "`nQuel Utilisateur souhaitez-vous retirer d'un Groupe ?"
            $groupName = Read-Host "`nAvec quel Groupe souhaitez-vous intéragir ?"
            $optionValidate = Read-Host "`nConfirmez-vous vouloir retirer l'Utilisateur $userName du Groupe $groupName ? (O/n)"
            if ($optionValidate -eq "O") {
                # Si OK >> Continue
                # Vérification de l'existence de l'Utilisateur
                if (Get-LocalUser -Name $userName -ErrorAction SilentlyContinue) {
                    Write-Host "`nErreur : L'Utilisateur $userName n'existe pas`n" -ForegroundColor Yellow
                    menuActionUser
                }
                else {
                    try {
                        Invoke-Command -ComputerName $clientIP -ScriptBlock {
                            param($groupName, $userName)
                            Remove-LocalGroupMember -Group $using:groupName -Member $using:userName -Confirm
                            Write-Host "`nL'Utilisateur $userµName a été supprimé du Groupe $groupName avec succés`n"
                        } -Credential wilder -ArgumentList $groupName -ErrorAction Stop
                        $eventLog = "Suppression de $userName du Groupe $groupName sur $clientName"
                        eventLogTask
                        menuActionUser
                    }
                    catch {
                        Write-Host "`nErreur : Lors de la suppression de l'utilisateur au groupe`n" -ForegroundColor Yellow
                        menuActionUser
                    }
                }
            }
            else {
                notConfirmed
                menuActionUser
            }
        }
        "R" {
            # Redirection vers Menu Action/Information
            $eventLog = "Redirection vers Menu Action/Information"
            eventLogTask
            menuActionInfo
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
    Write-Host "R - Retour au Menu Action/Information"
    Write-Host "M - Retour au Menu Principal"
    Write-Host "x - Quitter l'outil d'Administration"

    # Création variable pour enregistrer le choix du menu
    $targetActionClient = Read-Host "`nVotre choix"
    
    # Création variable menu courant
    $currentMenu = "ACTION CLIENT"

    # Redirection en fonction du choix du menu
    switch ($targetActionClient) {
        "1" {
            # Requête de confirmation de l'Action
            $optionValidate = Read-Host "`nConfirmez-vous vouloir arrêter le $clientName ? (O/n)"
            if ($optionValidate -eq "O") {
                # Si OK >> Continue
                Invoke-Command -ComputerName $clientIP -ScriptBlock {
                    Stop-Computer -Force
                } -Credential wilder
                $eventLog = "Arrêt de $clientName"
                eventLogTask
                menuActionClient
            }
            else {
                notConfirmed
                menuActionClient
            }
        }
        "2" {
            # Requête de confirmation de l'Action
            $optionValidate = Read-Host "`nConfirmez-vous vouloir redémarrer le $clientName ? (O/n)"
            if ($optionValidate -eq "O") {
                # Si OK >> Continue
                Invoke-Command -ComputerName $clientIP -ScriptBlock {
                    Restart-Computer -Force
                } -Credential wilder
                $eventLog = "Redémarrage de $clientName"
                eventLogTask
                menuActionClient
            }
            else {
                notConfirmed
                menuActionClient
            }
        }
        "3" {
            # Requête de confirmation de l'Action
            $optionValidate = Read-Host "`nConfirmez-vous vouloir vérrouiller le $clientName ? (O/n)"
            if ($optionValidate -eq "O") {
                # Si OK >> Continue
                Invoke-Command -ComputerName $clientIP -ScriptBlock {
                    logoff console
                } -Credential wilder
                $eventLog = "Verrouillage de $clientName"
                eventLogTask
                menuActionClient
            }
            else {
                notConfirmed
                menuActionClient
            }
        }
        "4" {
            # On demande à l'utilisateur s'il souhaite procéder aux mises à jour
            $choix_mises_a_jour_systeme = Read-Host "Êtes-vous sûr(e) de vouloir procéder aux mises à jour du système sur $clientName ? Nous allons procéder à leur recherche (o/n)"
            # On pose la condition If, soit oui et go, soit non et retour menu précédent
            if ($choix_mises_a_jour_systeme -eq "o") {
                Write-Host "Recherche des mises à jour disponibles sur $clientName..."
                # Au préalable : 
                # Install-Module -Name PSWindowsUpdate -RequiredVersion 2.2.0.3
                # Ensuite : Set-ExecutionPolicy Unrestricted > oui pour tout (pour l'exécution des scripts)
                # Récupère les mises à jour disponibles sur le poste distant
                $resultat_mises_a_jour = $(Invoke-Command -ComputerName $clientIP -ScriptBlock { Get-WindowsUpdate })
                # On demande à l'utilisateur s'il veut continuer après l'affichage des éventuelles mises à jour SI il y en a
                if ($resultat_mises_a_jour.Count -gt 0) {
                    $resultat_mises_a_jour
                    $choix_mises_a_jour_systeme2 = Read-Host "Des mises à jour sont disponibles. Voulez-vous les installer ? (o/n) "
                    # Vérifie la réponse de l'utilisateur
                    if ($choix_mises_a_jour_systeme2 -eq "o") {
                        # Installe les mises à jour sur le poste distant
                        Invoke-Command -ComputerName $ipAddress -ScriptBlock {
                            Install-WindowsUpdate -AcceptAll
                        }
                        # Vérifie si l'installation s'est bien déroulée
                        $installation_reussie = $(Invoke-Command -ComputerName $ipAddress -ScriptBlock { Install-WindowsUpdate -AcceptAll -ErrorAction SilentlyContinue })
                        # Affiche le résultat de l'installation
                        if ($installation_reussie) {
                            Write-Host "L'installation des mises à jour sur $clientName s'est bien déroulée. Félicitations."
                            $eventLog = "Mise à jour de $clientName"
                            eventLogTask
                            menuActionClient
                        }
                        else {
                            Write-Host "Une erreur s'est produite lors de l'installation des mises à jour sur $clientName. C'est la catastrophe !"
                            menuActionClient
                        }
                    }
                    else {
                        Write-Host "Les mises à jour ne seront pas installées sur $clientName."
                        menuActionClient
                    }
                }
                else {
                    Write-Host "Aucune mise à jour disponible sur $clientName."
                    menuActionClient
                }
            }
            else {
                Write-Host "Opération annulée. Retour au menu précédent..."
                menuActionClient
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
            "R" {
                # Redirection vers Menu Action/Information
                $eventLog = "Redirection vers Menu Action/Information"
                eventLogTask
                menuActionInfo
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
}
# Menu Information Utilisateur
function menuInfoUser {
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
    Write-Host "R - Retour au Menu Action/Information"
    Write-Host "M - Retour au Menu Principal"
    Write-Host "x - Quitter l'outil d'Administration"

    # Création variable pour enregistrer le choix du menu
    $targetInfoUser = Read-Host "`nVotre choix"
    
    # Création variable menu courant
    $currentMenu = "INFORMATION UTILISATEUR"

    # Redirection en fonction du choix du menu
    switch ($targetInfoUser) {
        "1" {
            # Requête pour un nom d'Utilisateur
            $userName = Read-Host "`nPour quel Utilisateur souhaitez-vous connaitre la date de dernière connexion ?"
            # Demande de confirmation de l'Utilisateur
            $optionValidate = Read-Host "`nConfirmez-vous cette information pour l'Utilisateur $userName ? (O/n)"
            if ($optionValidate -eq "O") {
                # Si OK >> Continue
                Invoke-Command -ComputerName $clientIP -ScriptBlock {
                    $infoLogPreview = Get-LocalUser -name $using:UserName | Sort-Object LastLogon | Select-Object Name, Lastlogon -Last 1
                } -Credential wilder
                # Création des variables de Logs + Prise de Logs >> Retour au Menu
                $eventLog = "Requête Information Date dernière connexion de $userName sur $clientName"
                $eventTarget = $userName
                eventLogTask
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
                    $infoLogPreview = net user $using:userName | Select-String "Mot de passeÿ: dernier changmt." 
                } -Credential wilder
                # Création des variables de Logs + Prise de Logs >> Retour au Menu
                $eventLog = "Requête Information Date dernière modification MDP de $userName sur $clientName"
                $eventTarget = $userName
                eventLogTask
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
                    $infoLogPreview = Get-WmiObject -Class Win32_ComputerSystem | Select-Object userName
                } -Credential wilder
                # Création des variables de Logs + Prise de Logs >> Retour au Menu
                $eventLog = "Requête Information Liste des sessions ouvertes par $userName sur $clientName"
                $eventTarget = $userName
                eventLogTask
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
                    $infoLogPreview = net user $using:UserName | Select-String "groupes"
                } -Credential wilder
                # Création des variables de Logs + Prise de Logs >> Retour au Menu
                $eventLog = "Requête Information Groupe d'appartenance de $userName sur $clientName"
                $eventTarget = $userName
                eventLogTask
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
                $infoLogPreview = Get-Content -path C:\Users\wilder\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt
            } -Credential wilder
            # Création des variables de Logs + Prise de Logs >> Retour au Menu
            $eventLog = "Requête Information Historique des commandes exécutées par $userName sur $clientName"
            $eventTarget = $userName
            eventLogTask
            infoLogTask
            menuInfoUser
            else {
                # Sinon >> Retour au Menu
                notConfirmed
                menuInfoUser
            }
        }
        "6" {
            $userName = "wilder"
            $folderName = "Pour quel dossier souhaitez-vous connaître les droits et permissions ?"
            Invoke-Command -ComputerName $clientIP -ScriptBlock {
                param($folderName, $userName)
                $infoLogPreview = Get-Acl -Path $folderName | Select-Object -ExpandProperty Access | Where-Object { $_.IdentityReference -match $userName }
            } -Credential wilder -ArgumentList $folderName, $userName
            # Création des variables de Logs + Prise de Logs >> Retour au Menu
            $eventLog = "Requête Information Droits/Permissions de l'utilisateur $userName sur le dossier $folderName sur $clientName"
            $eventTarget = $userName
            eventLogTask
            infoLogTask
            menuInfoUser
        }
        "7" {
            $userName = "wilder"
            $fileName = Read-Host "Pour quel dossier souhaitez-vous connaître les droits et permissions ?"
            Invoke-Command -ComputerName $clientIP -ScriptBlock {
                param($fileName, $userName)
                $infoLogPreview = Get-Acl -Path $fileName | Select-Object -ExpandProperty Access | Where-Object { $_.IdentityReference -match $userName }
            } -Credential wilder -ArgumentList $fileName, $userName
            # Création des variables de Logs + Prise de Logs >> Retour au Menu
            $eventLog = "Requête Information Droits/Permissions de l'utilisateur $userName sur le fichier $fileName sur $clientName"
            $eventTarget = $userName
            eventLogTask
            infoLogTask
            menuInfoUser
        }
        "R" {
            # Redirection vers Menu Action/Information
            $eventLog = "Redirection vers Menu Action/Information"
            eventLogTask
            menuActionInfo
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
    Write-Host "R - Retour au Menu Action/Information"
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
                $infoLogPreview = (Get-WmiObject -Class Win32_OperatingSystem).Caption
            } -Credential wilder
            Write-Host "`nVersion de l'OS : $osVersion`n"
            # Création des variables de Logs + Prise de Logs >> Retour au Menu
            $eventLog = "Requête Information Version OS de $clientName"
            $eventTarget = $clientName
            eventLogTask
            infoLogTask
            menuInfoClient
        }
        "2" {
            Write-Host "`nNombre de disques installés :`n"
            Invoke-Command -ComputerName $clientIP -ScriptBlock {
                $infoLogPreview = Get-Disk
            } -Credential wilder
            Write-Host "`nNombre de disques installés : $numberOfDisks`n"
            # Création des variables de Logs + Prise de Logs >> Retour au Menu
            $eventLog = "Requête Information Nombre de disque de $clientName"
            $eventTarget = $clientName
            eventLogTask
            infoLogTask
            menuInfoClient
        }
        "3" {
            Write-Host "`nInformations sur les partitions :`n"
            Invoke-Command -ComputerName $clientIP -ScriptBlock {
                $infoLogPreview = Get-WmiObject -Class Win32_DiskPartition | Select-Object DeviceID, Name, Size, Type
            } -Credential wilder
            # Création des variables de Logs + Prise de Logs >> Retour au Menu
            $eventLog = "Requête Information sur les partitions de $clientName"
            $eventTarget = $clientName
            eventLogTask
            infoLogTask
            menuInfoClient
        }
        "4" {
            Write-Host "`nListe des application/paquets installés :`n"
            Invoke-Command -ComputerName $clientIP -ScriptBlock {
                $infoLogPreview = Get-WmiObject -Class Win32_Product | Select-Object -Property Name
            } -Credential wilder
            # Création des variables de Logs + Prise de Logs >> Retour au Menu
            $eventLog = "Requête Information Liste des application/paquets installés de $clientName"
            $eventTarget = $clientName
            eventLogTask
            infoLogTask
            menuInfoClient
        }
        "5" {
            Write-Host "`nListe des services en cours d'exécution :`n"
            Invoke-Command -ComputerName $clientIP -ScriptBlock {
                $infoLogPreview = Get-Service | Where-Object { $_.Status -eq 'Running' }
            } -Credential wilder
            # Création des variables de Logs + Prise de Logs >> Retour au Menu
            $eventLog = "Requête Information Liste des services en cours d'exécution de $clientName"
            $eventTarget = $clientName
            eventLogTask
            infoLogTask
            menuInfoClient
        }
        "6" {
            Write-Host "`nListe des utilisateurs locaux :`n"
            Invoke-Command -ComputerName $clientIP -ScriptBlock {
                $infoLogPreview = Get-LocalUser | Select-Object Name
            } -Credential wilder
            # Création des variables de Logs + Prise de Logs >> Retour au Menu
            $eventLog = "Requête Information Liste des utilisateur locaux de $clientName"
            $eventTarget = $clientName
            eventLogTask
            infoLogTask
            menuInfoClient
        }
        "7" {
            Write-Host "`nInformations sur le CPU :`n"
            Invoke-Command -ComputerName $clientIP -ScriptBlock {
                $infoLogPreview = Get-WmiObject Win32_Processor | Select-Object Name, Manufacturer, MaxClockSpeed, NumberOfCores, NumberOfLogicalProcessors
            } -Credential wilder
            # Création des variables de Logs + Prise de Logs >> Retour au Menu
            $eventLog = "Requête Information Type de CPU de $clientName"
            $eventTarget = $clientName
            eventLogTask
            infoLogTask
            menuInfoClient
        }
        "8" {
            Write-Host "`nInformations sur le Mémoire RAM :`n"
            Invoke-Command -ComputerName $clientIP -ScriptBlock {
                $infoLogPreview = Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object TotalVisibleMemorySize, FreePhysicalMemory
            } -Credential wilder
            # Création des variables de Logs + Prise de Logs >> Retour au Menu
            $eventLog = "Requête Information Mémoire RAM totale de $clientName"
            $eventTarget = $clientName
            eventLogTask
            infoLogTask
            menuInfoClient
        }
        "9" {
            Write-Host "`nInformations sur l'Utilisation de la RAM :`n"
            Invoke-Command -ComputerName $clientIP -ScriptBlock {
                $infoLogPreview = Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object TotalVisibleMemorySize, FreePhysicalMemory
            } -Credential wilder
            # Création des variables de Logs + Prise de Logs >> Retour au Menu
            $eventLog = "Requête Information Utilisation de la RAM de $clientName"
            $eventTarget = $clientName
            eventLogTask
            infoLogTask
            menuInfoClient
        }
        "10" {
            Write-Host "`nInformations sur l'Utilisation du disque :`n"
            Invoke-Command -ComputerName $clientIP -ScriptBlock {
                $infoLogPreview = Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'" | Select-Object -Property FreeSpace, Size
            } -Credential wilder
            # Création des variables de Logs + Prise de Logs >> Retour au Menu
            $eventLog = "Requête Information Utilisation du disque de $clientName"
            $eventTarget = $clientName
            eventLogTask
            infoLogTask
            menuInfoClient
        }
        "11" {
            Write-Host "`nInformations sur l'Utilisation du processeur :`n"
            Invoke-Command -ComputerName $clientIP -ScriptBlock {
                $infoLogPreview = Get-Counter '\Processor(_Total)\% Processor Time'
            } -Credential wilder
            # Création des variables de Logs + Prise de Logs >> Retour au Menu
            $eventLog = "Requête Information Utilisation du Processeur de $clientName"
            $eventTarget = $clientName
            eventLogTask
            infoLogTask
            menuInfoClient
        }
        "R" {
            # Redirection vers Menu Action/Information
            $eventLog = "Redirection vers Menu Action/Information"
            eventLogTask
            menuActionInfo
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
            # Nom du Client prédéfini dans variable
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
            # Nom du Client prédéfini dans variable
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
            # Nom du Client prédéfini dans variable
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
            # Nom du Client prédéfini dans variable
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
            # Requête du nom d'Utilisateur à rechercher
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
    Write-Host "`nLes informations recueillies sont disponibles dans le fichier situé dans C:\Users\Administrator\Documents\info_$eventTarget`_$(Get-Date -Format yyyyMMdd).txt`n" -ForegroundColor Cyan
    $infoLogPreview | Tee-Object -Append -FilePath C:\Users\Administrator\Documents\info_$eventTarget`_$(Get-Date -Format yyyyMMdd).txt -Value "$infoLogPreview"
}



Clear-Host
# Début de la prise de Log
beginLogTask
Write-host "Bienvenue dans l'outil d'Administration" -ForegroundColor Cyan
$eventLog = "Démarrage du Menu Principal"
eventLogTask
# Démarrage du Menu Principal
menuMainMenu
