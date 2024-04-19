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
            
                    #Confirmation
                    $choix_prise_en_main_a_distance = Read-Host "Voulez-vous prendre la main à distance sur la machine ? (o/n) "
                    #On pose la condition SI, soit on y va, soit on revient au menu précédent
                    If ( $choix_prise_en_main_a_distance -eq "o" )
                    {
                        #Etapes préliminaires, voir PowerShell - à distance
                        Enter-PSSession -ComputerName $ipAddress -Credential $(Get-Credential)
                    }
                    Else
                    {
                        Write-Host "Opération annulée. Retour au menu précédent..."
                        Start-Sleep -Seconds 2
                        #Menu_actions_ordinateur_client
                    }

                } -Credential wilder 
            }
            "6" {
                Invoke-Command -ComputerName $clientIP -ScriptBlock {

                    Write-Host "Etat des règles de pare-feu :"
                    Invoke-Command -ComputerName $ipAddress -ScriptBlock { Get-NetFirewallProfile }
                    #On propose de revenir au menu précédent
                    #Condition SI dans la boucle TANT que, soit on revient soit on n'a pas compris
                    While ( $true )
                    {
                        $choix_sortie_regles_parefeu = Read-Host "Pour revenir au menu précédent, "1" puis "Entrée": "
                        If ( $choix_sortie_regles_parefeu -eq "1" )
                        {
                            Write-Host "Retour au menu précédent..."
                            Start-Sleep -Seconds 1
                            Menu_actions_ordinateur_client
                        }
                        Else
                        {
                            Write-Host "Commande invalide."
                        }
                    }

                } -Credential wilder 
            }
            "7" {
                Invoke-Command -ComputerName $clientIP -ScriptBlock {

                    #Boucle WHILE pour continuer tant qu'on n'a pas une "bonne" réponse
                    While ($true)
                    {
                        #On offre à l'utilisateur la possibilité de choisir sur quel profil il souhaite agir
                        #il pourra choisir une combinaison au besoin
                        #On pose un SWITCH avec toutes les possibilités
                        $choix_activation_parefeu = Read-Host "Indiquer le ou les profils sur que vous souhaitez activer:`n - Domain (1)`n - Private (2)`n - Public (3)`n - Tous (4)`n - Revenir au menu précédent (q)`n"
                        Switch ($choix_activation_parefeu)
                        {
                            "1" { Invoke-Command -ComputerName $ipAddress -ScriptBlock { Set-NetFirewallProfile -Profile Domain -Enabled True; Write-Host "Pare-feu activé pour le profil Domain"; Start-Sleep -Seconds 2 } }
                            "2" { Invoke-Command -ComputerName $ipAddress -ScriptBlock { Set-NetFirewallProfile -Profile Private -Enabled True; Write-Host "Pare-feu activé pour le profil Private"; Start-Sleep -Seconds 2 } }
                            "3" { Invoke-Command -ComputerName $ipAddress -ScriptBlock { Set-NetFirewallProfile -Profile Public -Enabled True; Write-Host "Pare-feu activé pour le profil Public"; Start-Sleep -Seconds 2 } }
                            "1,2" { Invoke-Command -ComputerName $ipAddress -ScriptBlock { Set-NetFirewallProfile -Profile Domain,Private -Enabled True; Write-Host "Pare-feu activé pour les profils Domain et Private"; Start-Sleep -Seconds 2 } }
                            "2,3" { Invoke-Command -ComputerName $ipAddress -ScriptBlock { Set-NetFirewallProfile -Profile Private,Public -Enabled True; Write-Host "Pare-feu activé pour les profils Public et Private"; Start-Sleep -Seconds 2 } }
                            "1,3" { Invoke-Command -ComputerName $ipAddress -ScriptBlock { Set-NetFirewallProfile -Profile Domain,Public -Enabled True; Write-Host "Pare-feu activé pour les profils Domain et Public"; Start-Sleep -Seconds 2 } }
                            "4" { Invoke-Command -ComputerName $ipAddress -ScriptBlock { Set-NetFirewallProfile -Profile Domain,Private,Public -Enabled True; Write-Host "Pare-feu activé pour tous les profils"; Start-Sleep -Seconds 2 } }
                            "q" { Menu_actions_ordinateur_client }
                            default { Write-Host "Commande invalide. Veuillez ressaisir"  }
                        }
                    }  

                } -Credential wilder 
            }
            
            "8" {
                Invoke-Command -ComputerName $clientIP -ScriptBlock {

                    #Boucle WHILE pour continuer tant qu'on n'a pas une "bonne" réponse
                    While ($true)
                    {
                        #On offre à l'utilisateur la possibilité de choisir sur quel profil il souhaite agir
                        #il pourra choisir une combinaison au besoin
                        #On pose un SWITCH avec toutes les possibilités
                        $choix_desactivation_parefeu = Read-Host "Indiquer le ou les profils sur que vous souhaitez désactiver:`n - Domain (1)`n - Private (2)`n - Public (3)`n - Tous (4)`n - Revenir au menu précédent (q)`n"
                        Switch ($choix_desactivation_parefeu)
                        {
                            "1" { Invoke-Command -ComputerName $ipAddress -ScriptBlock { Set-NetFirewallProfile -Profile Domain -Enabled false; Write-Host "Pare-feu désactivé pour le profil Domain"; Start-Sleep -Seconds 2 } } 
                            "2" { Invoke-Command -ComputerName $ipAddress -ScriptBlock { Set-NetFirewallProfile -Profile Private -Enabled false; Write-Host "Pare-feu désactivé pour le profil Private"; Start-Sleep -Seconds 2 } }
                            "3" { Invoke-Command -ComputerName $ipAddress -ScriptBlock {Set-NetFirewallProfile -Profile Public -Enabled false; Write-Host "Pare-feu désactivé pour le profil Public"; Start-Sleep -Seconds 2 } }
                            "1,2" { Invoke-Command -ComputerName $ipAddress -ScriptBlock {Set-NetFirewallProfile -Profile Domain,Private -Enabled false; Write-Host "Pare-feu désactivé pour les profils Domain et Private"; Start-Sleep -Seconds 2 } }
                            "2,3" { Invoke-Command -ComputerName $ipAddress -ScriptBlock {Set-NetFirewallProfile -Profile Private,Public -Enabled false; Write-Host "Pare-feu désactivé pour les profils Public et Private"; Start-Sleep -Seconds 2 } }
                            "1,3" { Invoke-Command -ComputerName $ipAddress -ScriptBlock {Set-NetFirewallProfile -Profile Domain,Public -Enabled false; Write-Host "Pare-feu désactivé pour les profils Domain et Public"; Start-Sleep -Seconds 2 } }
                            "4" { Invoke-Command -ComputerName $ipAddress -ScriptBlock {Set-NetFirewallProfile -Profile Domain,Private,Public -Enabled false; Write-Host "Pare-feu désactivé pour tous les profils"; Start-Sleep -Seconds 2 } }
                            "q" { Menu_actions_ordinateur_client }
                            default { Write-Host "Commande invalide. Veuillez ressaisir" }
                        }
                    }
                    

                } -Credential wilder 
            }
            
            "9" {
                Invoke-Command -ComputerName $clientIP -ScriptBlock {
                
                # Boucle pour demander à l'utilisateur une réponse valide
                while ($true) 
                {
                    # SWITCH, soit on va dans l'install, soit on revient au menu précédent
                    $choix_installation_logiciel_oui_non = Read-Host "Voulez-vous poursuivre pour installer un logiciel sur le poste client (1) ou revenir au menu précédent (x) ?"
                    Switch ($choix_installation_logiciel_oui_non)
                    {
                        "1" 
                            {   
                                    # On demande à l'utilisateur le programme qu'il souhaite installer 
                                    $choix_logiciel_install_via_chocolatey = Read-Host "Quel logiciel souhaitez-vous installer sur le poste client "
                                    Invoke-Command -ComputerName $ipAddress -ScriptBlock { param($choix_logiciel_install_via_chocolatey) choco list --local-only | Select-String -Pattern $choix_logiciel_install_via_chocolatey } -ArgumentList $choix_logiciel_install_via_chocolatey
                                        #On lance le processus d'installation
                                        Write-Host "Installation en cours..."
                                        Invoke-Command -ComputerName $ipAddress -ScriptBlock { param($choix_logiciel_install_via_chocolatey) choco install $choix_logiciel_install_via_chocolatey -y } -ArgumentList $choix_logiciel_install_via_chocolatey
                                        Write-Host "Retour au menu précédent..."
                                        Start-Sleep -Seconds 1
                                        # Retourner au menu précédent
                                        Menu_actions_ordinateur_client
                            }
            
                        "x" 
                            {
                                Menu_actions_ordinateur_client
                            }
            
                        default 
                            {
                                Write-Host "Commande invalide, veuillez ressaisir :"
                            }
                    }
                }

                } -Credential wilder 
            }
            
            "10" {
                Invoke-Command -ComputerName $clientIP -ScriptBlock {
                
                # Boucle pour demander à l'utilisateur une réponse valide
                While ($true)
                {
                    #SWITCH, soit on file dans le processus de désinstallation, soit on revient au menu précédent
                    $choix_desinstallation_logiciel_oui_non = Read-Host "Voulez-vous poursuivre pour désinstaller un logiciel sur le poste client (1) ou revenir au menu précédent (x) ?"
                    Switch ($choix_desinstallation_logiciel_oui_non)
                    {
                        "1" 
                            {
                                #On demande à l'utilisateur de donner le nom du logiciel qu'il souhaite désinstaller
                                $logiciel_pour_desinstallation = Read-Host "Veuillez donner le nom du logiciel que vous souhaitez désinstaller :"
                                Invoke-Command -ComputerName $ipAddress -ScriptBlock { param($logiciel_pour_desinstallation) choco list --local-only | Select-String -Pattern $logiciel_pour_desinstallation } -ArgumentList $logiciel_pour_desinstallation
                                #On lance la désinstallation 
                                        Write-Host "Désinstallation en cours..."
                                        Invoke-Command -ComputerName $ipAddress -ScriptBlock { param($logiciel_pour_desinstallation) choco uninstall $logiciel_pour_desinstallation } -ArgumentList $logiciel_pour_desinstallation
                                        Write-Host "Retour au menu précédent..."
                                        Start-Sleep -Seconds 1
                                        #Retour menu précédent
                                        Menu_actions_ordinateur_client
                            }
            
                        "x" 
                            {Menu_actions_ordinateur_client}
            
                        default 
                            {Write-Host "Commande invalide, veuillez ressaisir"}
                    }
                }

                } -Credential wilder 
            }
            
            "11" {
                Invoke-Command -ComputerName $clientIP -ScriptBlock {

                #Script PowerShell qui demande le nom de l'utilisateur et crée un fichier sur son bureau qui porte son 'nom' et qui contient du texte en relation
                param ([string[]]$prenoms)
            
                #Demande à l'utilisateur son prénom
                $prenoms = Read-Host "Nom"
            
                #chemin vers le bureau de l'utilisateur actuel
                $bureauClient = "C:\Users\wilder\Desktop\$prenoms.txt"
            
                Foreach ($prenom in $prenoms)
                {
                    #Contenu du fichier
                    $bonne_humeur = "Aujourd'hui, $prenom est de bonne humeur !"
            
                    #Définir le nom de fichier avec le prénom
                    $nomFichier = $($bureauClient)
            
                    #Try and Catch 
                    Try { Invoke-Command -ComputerName $ipAddress -ScriptBlock { param($bonne_humeur, $bureauClient)
                        Set-Content -Path $bureauClient -Value $bonne_humeur } -ArgumentList $bonne_humeur, $bureauClient
                        Write-Host "Fichier crée : $nomFichier"
                    }
                    Catch {
                        Write-Host "Erreur lors de la création du fichier pour $prenom !"
                    }
            
                }

                } -Credential wilder 
            }
            
            "12" {
                Invoke-Command -ComputerName $clientIP -ScriptBlock {
                
                # Demander à l'utilisateur de saisir le nom du dossier à créer
                $nomDossier = Read-Host "Veuillez saisir le nom du dossier que vous souhaitez créer"
                
                # Spécifier le chemin du dossier sur le poste client distant
                $cheminDossier = "C:\Users\wilder\Desktop\$nomDossier"
                
                # Vérifier l'existence du dossier sur le poste client distant
                #$existenceDossier = Test-Path -Path $cheminDossier
                $existenceDossier = $(Invoke-Command -ComputerName $ipAddress -ScriptBlock { param ($cheminDossier) Test-Path -Path $cheminDossier } -ArgumentList $cheminDossier)
                
                # Si le dossier n'existe pas, le créer
                #Dans une boucle
                While ($true) {
                        if (-not $existenceDossier) 
                        {
                            # Créer le dossier
                            Invoke-Command -ComputerName $ipAddress -ScriptBlock { param ($nomdossier, $existenceDossier, $cheminDossier) New-Item -Path $cheminDossier\$nomdossier -ItemType Directory -ErrorAction SilentlyContinue } -ArgumentList $nomDossier, $existenceDossier, $cheminDossier; 
                
                            #Test et confirmation de la création du dossier sur le poste client
                            $nouvelleExistenceDossierDistant = $(Invoke-Command -ComputerName $ipAddress -ScriptBlock { param ($cheminDossier) Test-Path -Path $cheminDossier } -ArgumentList $cheminDossier)
                            if ($nouvelleExistenceDossierDistant) {
                                Write-Host "Le dossier $nomDossier a été créé avec succès sur le poste distant."
                            } else {
                                Write-Host "Erreur : Impossible de créer le dossier $nomDossier sur le poste distant."
                            }
                            Menu_actions_ordinateur_client
                        }   
                        else {
                            Write-Host "Le dossier $nomDossier existe déjà sur le poste client distant !"
                            Menu_actions_ordinateur_client
                    }
                }

                } -Credential wilder 
            }
            
            "13" {
                Invoke-Command -ComputerName $clientIP -ScriptBlock {
                
                #On demande à l'utilisateur le nom du répertoire qu'il souhaite supprimer
                #On vérifie son existence dans le répertoire courant 
                #On pose la condition SI, soit il existe et on le supprime, soit non et on revient au menu précédent
                $choix_dossier_suppression = Read-Host "Veuillez indiquer le nom du dossier que vous souhaitez supprimer (ATTENTION : vous perdrez en même temps ce qui se trouve dans ce dossier)"
            
                #Chemin 
                $chemin_dossier_a_supprimer = "C:\Users\wilder\Desktop\$choix_dossier_suppression"
                
                #Existence du dossier sur le poste distant
                $existence_dossier_a_supprimer = $(Invoke-Command -ComputerName $ipAddress -ScriptBlock { param($chemin_dossier_a_supprimer) Test-Path -Path $chemin_dossier_a_supprimer } -ArgumentList $chemin_dossier_a_supprimer ) 
            
                #S'il existe, on le déracine
                #Dans une boucle
                While ($true) {
                If ($existence_dossier_a_supprimer)
                {
                    Invoke-Command -ComputerName $ipAddress -ScriptBlock { param($choix_dossier_suppression, $existence_dossier_a_supprimer, $chemin_dossier_a_supprimer) Write-Host "Suppression du dossier $choix_dossier_suppression en cours..."; Start-Sleep -Seconds 1; Remove-Item -Path $chemin_dossier_a_supprimer -Recurse -Force; Write-Host "Le dossier $choix_dossier_suppression a été supprimé avec succès. Félicitations."; Start-Sleep -Seconds 1; Write-Host "Retour au menu précédent..."; Start-Sleep -Seconds 1 } -ArgumentList $choix_dossier_suppression, $existence_dossier_a_supprimer, $chemin_dossier_a_supprimer
                    Menu_actions_ordinateur_client
                }
                Else
                {
                    Write-Host "Le dossier $choix_dossier_suppression n'existe pas !"
                    Write-Host "Retour au menu précédent..."
                    Start-Sleep -Seconds 2
                    Menu_actions_ordinateur_client
                }
            }
                

                } -Credential wilder 
            }
            
            "14" {
                Invoke-Command -ComputerName $clientIP -ScriptBlock {

                function switch1modification()
                {
                    #On demande le nom du dossier qu'il souhaite rename
                    $choix_modification_dossier = Read-Host "Veuillez indiquer le nom du dossier que vous souhaitez renommer"
                
                    #Chemin du dossier à modifier
                    $chemin_dossier_modification = "C:\Users\wilder\Desktop\$choix_modification_dossier"
                
                    #On vérifie son existence
                    $verification_existence_dossier_modif = $(Invoke-Command -ComputerName $ipAddress -ScriptBlock { param($chemin_dossier_modification) Test-Path -Path $chemin_dossier_modification } -ArgumentList $chemin_dossier_modification )
                
                    #On pose la condition SI, soit il existe et on go, soit non et on revient au sous_menu 'Modification_de_repertoire'
                    If ($verification_existence_dossier_modif)
                    {
                        $choix_nouveau_nom_modification_dossier = Read-Host "Indiquez le nouveau nom"
                        Invoke-Command -ComputerName $ipAddress -ScriptBlock { param($chemin_dossier_modification, $verification_existence_dossier_modif, $choix_modification_dossier, $choix_nouveau_nom_modification_dossier) Rename-Item -Path $chemin_dossier_modification -NewName $choix_nouveau_nom_modification_dossier } -ArgumentList $chemin_dossier_modification, $verification_existence_dossier_modif, $choix_modification_dossier, $choix_nouveau_nom_modification_dossier
                        Start-Sleep -Seconds 1
                        Write-Host "Opération réalisée avec succès. Félicitations."
                        Start-Sleep -Seconds 1
                        Write-Host "Retour au menu précédent..."
                        Start-Sleep -Seconds 1
                        Menu_actions_ordinateur_client
                    }
                    Else
                    {
                        Write-Host "Le dossier $choix_modification_dossier n'existe pas et ne peut donc être modifié !"
                        Write-Host "Retour au menu précédent..."
                        Start-Sleep -Seconds 2
                        Modification_de_repertoire
                    }
                }
                
                
                    While ($true)
                    {
                        #On demande à l'utilisateur ce qu'il souhaite faire : renommer un dossier existant ou revenir au menu précédent
                        $choix_sous_menu_modification_dossier = Read-Host "Veuillez choisir :`n - Renommer un dossier (1)`n - Revenir au menu précédent (x)`n"
                
                        #On renseigne le nom du dossier en question
                
                
                        #On renseigne le chemin du dossier que l'on souhaite modifier 
                        #On pose un SWITCH, 1 on rename, x on revient au menu précédent, commande invalide on reprend
                        Switch ($choix_sous_menu_modification_dossier)
                        {
                            "1" {
                                    switch1modification
                                }
                
                            "x" {
                                    Menu_actions_ordinateur_client
                                }
                
                            default {
                                        Write-Host "Commande invalide. Veuillez ressaisir"
                                    }
                        }
                    }             

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
