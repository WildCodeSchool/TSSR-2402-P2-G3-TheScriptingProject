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
            # Deamande de confirmation de l'Utilisateur
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
            menuMainMenu
        }
        "x" {
            endLogTask
            exit
        }
        Default {
            notAvailable
            menuLogMenu
        }
    }
}

function notAvailable {
    Write-Host "`nErreur : Ce choix n'est pas disponible - Retour au MENU $currentMenu`n" -ForegroundColor Yellow
}

function notConfirmed {
    Write-Host "`nErreur : Vous n'avez pas confirmé votre choix - Retour au MENU $currentMenu`n" -ForegroundColor Yellow
}

function beginLogTask {
    Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log -Value "$(Get-Date -Format yyyyMMdd)-$(Get-Date -Format HHmmss)-$env:USERNAME->-********StartScript********"
}

function endLogTask {
    Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log -Value "$(Get-Date -Format yyyyMMdd)-$(Get-Date -Format HHmmss)-$env:USERNAME-*********EndScript*********"
}

function eventLogTask {
    Add-Content -Path C:\Windows\System32\LogFiles\log_evt.log -Value "$(Get-Date -Format yyyyMMdd)-$(Get-Date -Format HHmmss)-$env:USERNAME-$eventLog"
}

function infoLogTask {
    Add-Content -Path C:\Users\Administrator\Documents\info_$eventTarget`_$(Get-Date -Format yyyyMMdd).txt -Value "$(Get-Date -Format yyyyMMdd)-$(Get-Date -Format HHmmss)-$env:USERNAME-$eventLog"
    Add-Content -Path C:\Users\Administrator\Documents\info_$eventTarget`_$(Get-Date -Format yyyyMMdd).txt -Value "$infoLogPreview"
}






