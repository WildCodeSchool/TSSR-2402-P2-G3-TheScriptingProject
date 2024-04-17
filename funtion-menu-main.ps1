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
    Write-Host "M - Retour au Menu Principal"
    Write-Host "x - Quitter l'outil d'Administration"

    # Création variable pour enregistrer le choix du menu
    $targetActionUser = Read-Host "`nVotre choix"
    
    # Création variable menu courant
    $currentMenu = "ACTION UTILISATEUR"

    # Redirection en fonction du choix du menu
    switch ($targetActionUser) {
        "1" {
            # Connexion à disance sur le Client
            Invoke-Command -ComputerName $clientIP -ScriptBlock {
                # Requête du nom d'Utilisateur
                $userName = Read-Host "`nPour quel Utilisateur souhaitez-vous créer un compte ?"
                # Demande de confirmation de l'Utilisateur
                $userValidate = Read-Host "`nConfirmez-vous vouloir créer un compte pour l'Utilisateur $userName ? (O/n)"
                if ($userValidate -eq "O") {
                    # Si OK >> Continue
                    # Vérification de l'existence de l'Utilisateur dans la table
                    if (Get-LocalUser -Name $userName -ErrorAction SilentlyContinue) {
                        # Si le compte existe
                        Write-Host "`nErreur - L'Utisateur $userName existe déjà Retour au MENU $currentMenu`n" -ForegroundColor Yellow
                        menuActionUser
                    }
                    else {
                        # Sinon >> Création du compte
                        New-LocalUser $userName
                        Write-Host "`nL'Utisateur $userName a été créé avec succés`n" -ForegroundColor Cyan
                        $eventLog = "Création du compte Utilisateur $userName"
                        eventLogTask
                        menuActionUser
                    }
                }
                else {
                    notConfirmed
                    menuActionUser
                }
            } -Credential wilder 
        }
        "2" {
            # Connexion à disance sur le Client
            Invoke-Command -ComputerName $clientIP -ScriptBlock {
                # Requête du nom d'Utilisateur
                $userName = Read-Host "`nPour quel Utilisateur souhaitez-vous changer le mot de passe ?"
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
    # Rappel du choix de Client
    Write-Host "`nVous êtes actuellement connecté au Client $clientName`n" -ForegroundColor Cyan
    # Listing des options
    Write-Host "MENU ACTION CLIENT" -ForegroundColor Cyan
    Write-Host "Sélectionnez un choix parmi :" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "1 - "
    Write-Host "2 - "
    Write-Host "3 - "
    Write-Host "4 - "
    Write-Host "5 - "
    Write-Host "6 - "
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
    # Rappel du choix de Client
    Write-Host "`nVous êtes actuellement connecté au Client $clientName`n" -ForegroundColor Cyan
    # Listing des options
    Write-Host "MENU INFORMATION UTILISATEUR" -ForegroundColor Cyan
    Write-Host "Sélectionnez un choix parmi :" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "1 - "
    Write-Host "2 - "
    Write-Host "3 - "
    Write-Host "4 - "
    Write-Host "5 - "
    Write-Host "6 - "
    Write-Host "M - Retour au Menu Principal"
    Write-Host "x - Quitter l'outil d'Administration"

    # Création variable pour enregistrer le choix du menu
    $targetInfoUser = Read-Host "`nVotre choix"
    
    # Création variable menu courant
    $currentMenu = "INFORMATION UTILISATEUR"

    # Redirection en fonction du choix du menu
    switch ($targeInfoUser) {
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
    Write-Host "1 - "
    Write-Host "2 - "
    Write-Host "3 - "
    Write-Host "4 - "
    Write-Host "5 - "
    Write-Host "6 - "
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
}







