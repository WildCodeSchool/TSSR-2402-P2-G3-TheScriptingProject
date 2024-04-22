# Menu choix Client
function menuMainMenu {
    # Listing des options
    Write-Host "MENU PRINCIPAL" -ForegroundColor Cyan
    Write-Host "Sélectionnez un choix parmi :" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "1 - Client Windows CLIWIN01"
    Write-Host "2 - Client Windows CLIWIN02"
    #    Write-Host "3 - Client Ubuntu CLILIN01"
    #    Write-Host "4 - Client Ubuntu CLILIN02"
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
            $clientName = "CLIWIN01"
            $ipAddress = "172.16.10.20"
            # Demande de confirmation du Client
            $clientValidate = Read-Host "`nConfirmez-vous vouloir vous connecter au Client $clientName ? (O/n)"
            if ($clientValidate -eq "O") {
                # Si OK >> Continue
                # Redirection vers Menu Action Information
                $eventLog = "Redirection vers Menu Action Info"
                eventLogTask
                Menu_principal_ps
            }
            else {
                # Sinon >> Retour au menu
                notConfirmed
                menuMainMenu
            }
        }
        "2" {
            # Création de variables prédéfinies
            $clientName = "CLIWIN02"
            $ipAddress = "172.16.10.21"
            # Demande de confirmation du Client
            $clientValidate = Read-Host "`nConfirmez-vous vouloir vous connecter au Client $clientName ? (O/n)"
            if ($clientValidate -eq "O") {
                # Si OK >> Continue
                # Redirection vers Menu Action Information
                $eventLog = "Redirection vers Menu Action Info"
                eventLogTask
                Menu_principal_ps
            }
            else {
                # Sinon >> Retour au menu
                notConfirmed
                menuMainMenu
            }
        }
        #        "3" {
        #            # Création de variables prédéfinies
        #            $clientName = "CLILIN01"
        #            $ipAddress = "172.16.10.30"
        #            # Demande de confirmation du Client
        #            $clientValidate = Read-Host "`nConfirmez-vous vouloir vous connecter au Client $clientName ? (O/n)"
        #            if ($clientValidate -eq "O") {
        #                # Si OK >> Continue
        #                # Redirection vers Menu Action Information
        #                $eventLog = "Redirection vers Menu Action Info"
        #                eventLogTask
        #                Menu_principal_ps
        #            }
        #            else {
        #                # Sinon >> Retour au menu
        #                notConfirmed
        #                menuMainMenu
        #            }
        #        }
        #        "4" {
        #            # Création de variables prédéfinies
        #            $clientName = "CLILIN02"
        #            $ipAddress = "172.16.10.31"
        #            # Demande de confirmation du Client
        #            $clientValidate = Read-Host "`nConfirmez-vous vouloir vous connecter au Client $clientName ? (O/n)"
        #            if ($clientValidate -eq "O") {
        #                # Si OK >> Continue
        #                # Redirection vers Menu Action Information
        #                $eventLog = "Redirection vers Menu Action Info"
        #                eventLogTask
        #                Menu_principal_ps
        #            }
        #            else {
        #                # Sinon >> Retour au menu
        #                notConfirmed
        #                menuMainMenu
        #            }
        #        }
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

# Menu principal
#Fonction qui permettra de revenir sur le menu principal du script
function Menu_principal_ps {
    $finished = $false

    while ( -not $finished ) {
        Write-Host "`nMenu action et information" -ForegroundColor Cyan
        Write-Host "1 - Action Utilisateur"
        Write-Host "2 - Information Utilisateur"
        Write-Host "3 - Action Ordinateur Client"
        Write-Host "4 - Info Ordinateur Client"
        Write-Host "5 - Retour au Choix du Client"
        Write-Host "x - Pour quitter tapez x`n"

        $choix = Read-Host "Faites votre choix et appuyez Entrée"

        switch ($choix) {
            "1" { fonction_menu_action_utilisateur; $eventLog = "Redirection vers Menu Action Utilisateur"; eventLogTask }
            "2" { fonction_menu_info_utilisateur; $eventLog = "Redirection vers Menu Information Utilisateur"; eventLogTask }
            "3" { Menu_actions_ordinateur_client; $eventLog = "Redirection vers Menu Action Client"; eventLogTask }
            "4" { fonction_menu_info_ordinateur_client; $eventLog = "Redirection vers Menu Info Client"; eventLogTask }
            "5" { menuMainMenu; $eventLog = "Redirection vers Menu Choix Client"; eventLogTask }
            "x" { $finished = $true ; endLogTask ; exit } 
            default { Write-Host "Commande invalide." }
        }
    }
}

#Menu action utilisateur
function fonction_menu_action_utilisateur {
    Write-Host "Menu actions utilisateur" -ForegroundColor Cyan
    Write-Host
    Write-Host "1 - Création de compte utilisateur local"
    Write-Host "2 - Changement de mot de passe"
    Write-Host "3 - Suppression de compte utilisateur local"
    Write-Host "4 - Désactivation de compte utilisateur local"
    Write-Host "5 - Ajout à un groupe local"
    Write-Host "6 - Sortie d'un groupe local"
    Write-Host "7 - retour"
    Write-Host "8 - Retour au Choix du Client"
    Write-Host "x - Quitter l'outil d'Administration"
    Write-Host
    $choix = Read-Host "Faites votre choix et appuyez Entrée:"

    switch ($choix) {
        "1" { Creation_compte_utilisateur_local }
        "2" { Changement_de_mot_de_passe }
        "3" { Suppression_de_compte }
        "4" { Desactivation_compte_utilisteur }
        "5" { Ajout_utilisateur_a_groupe }
        "6" { Supp_user_from_group }
        "7" { Write-Host "retour au menu principal"; Menu_principal_ps; $eventLog = "Redirection vers Menu Action Information"; eventLogTask }
        "8" { menuMainMenu; $eventLog = "Redirection vers Menu Choix Client"; eventLogTask }
        "x" { endLogTask ; exit }
        default { Write-Host "Commande invalide" }
    }
}

# Création d'utilisateur 
function Creation_compte_utilisateur_local {
    $answer = Read-Host "Voulez-vous creer un nouveau compte utilisateur local ? (o/n)"
    if ($answer -eq "o") {
        $createUser = Read-Host "Rentrez le nom de l'utilisateur a creer"
        # Vérification que l'utilisateur existe
        if (Get-LocalUser -Name $createUser -ErrorAction SilentlyContinue) {
            Write-Host "L'utilisateur $createUser existe deja."
        }
        # Si non création de l'utilisateur
        else {
            try {
                Invoke-Command -ComputerName $ipAddress -ScriptBlock {
                    param($createUser)
                    New-LocalUser -Name $createUser 
                    Write-Host "Le compte $createUser a ete cree avec succes." 
                } -ArgumentList $createUser -ErrorAction Stop
                $eventLog = "Création du compte $createUser sur $clientName"
                eventLogTask
            }
            catch {
                Write-Host "Erreur lors de la création de l'utilisateur : $_"
            }
        }
    }
    else {
        Write-Host "Opération annulée."
    }
    fonction_menu_action_utilisateur
}


# Suppresion d'utilisateur 
function Suppression_de_compte {
    $answer = Read-Host "Voulez-vous supprimer un compte utilisateur local ? (o/n)"
    if ($answer -eq "o") {
        $delUser = Read-Host "Rentrez le nom de l'utilisateur a supprimer"
        # Vérification que l'utilisateur existe
        if (Get-LocalUser -Name $delUser -ErrorAction SilentlyContinue) {
            Write-Host "L'utilisateur $delUser existe deja."
        }
        # Si non création de l'utilisateur
        else {
            try {
                Invoke-Command -ComputerName $ipAddress -ScriptBlock {
                    param($delUser)
                    Remove-LocalUser -Name $delUser 
                    Write-Host "Le compte $delUser a ete supprimé avec succes." 
                } -ArgumentList $delUser -ErrorAction Stop
                $eventLog = "Suppressin du compte $delUser sur $clientName"
                eventLogTask
            }
            catch {
                Write-Host "Erreur lors de la suppresion de l'utilisateur : $_"
            }
        }
    }
    else {
        Write-Host "Opération annulée."
    }
    fonction_menu_action_utilisateur
}

# Changement de mdp
function Changement_de_mot_de_passe {
    $answer = Read-Host "Voulez-vous modifier le mot de passe d'un compte utilisateur local ? (o/n)"
    if ($answer -eq "o") {
        $modUser = Read-Host "Rentrez le nom de l'utilisateur"
        # Vérification que l'utilisateur existe
        if (-not (Get-LocalUser -Name $modUser -ErrorAction SilentlyContinue)) {
            Write-Host "L'utilisateur $modUser n'existe pas."
        }
        # Si non création de l'utilisateur
        else {
            try {
                Invoke-Command -ComputerName $ipAddress -ScriptBlock {
                    param($modUser)
                    Set-LocalUser -Name $modUser -Password (ConvertTo-SecureString -AsPlainText -Force) 
                    Write-Host "Le mot de passe de $modUser a ete modifie avec succes."
                } -ArgumentList $modUser -ErrorAction Stop
                $eventLog = "Modification du Mot de Passe du compte $modUser sur $clientName"
                eventLogTask
            }
            catch {
                Write-Host "Erreur lors de la modification du mot de passe de $_"
            }
        }
    }
    else {
        Write-Host "Opération annulée."
    }
    fonction_menu_action_utilisateur
}

# Desactivation d'un compte
function Desactivation_compte_utilisteur {
    $answer = Read-Host "Voulez-vous désactiver un compte utilisateur local ? (o/n)"
    if ($answer -eq "o") {
        $deacUser = Read-Host "Rentrez le nom de l'utilisateur"
        # Vérification que l'utilisateur existe
        if (-not (Get-LocalUser -Name $deacUser -ErrorAction SilentlyContinue)) {
            Write-Host "L'utilisateur $deacUser n'existe pas."
        }
        # Si non création de l'utilisateur
        else {
            try {
                Invoke-Command -ComputerName $ipAddress -ScriptBlock {
                    param($deacUser)
                    Disable-LocalUser $deacUser -Confirm
                    Write-Host "Le compte $deacUser a ete désactivé avec succes."
                } -ArgumentList $deacUser -ErrorAction Stop
                $eventLog = "Désactivation du compte $deacUser sur $clientName"
                eventLogTask
            }
            catch {
                Write-Host "Erreur lors de la désactivation du compte $_"
            }
        }
    }
    else {
        Write-Host "Opération annulée."
    }
    fonction_menu_action_utilisateur
}

# Ajout d'un utilisateur à un groupe local
function Ajout_utilisateur_a_groupe {
    $answer = Read-Host "Voulez-vous ajouter un utilisateur local à un groupe ? (o/n)"
    if ($answer -eq "o") {
        $user = Read-Host "Rentrez le nom de l'utilisateur"
        $addGroup = Read-Host "Rentrez le nom du groupe"
        # Vérification que l'utilisateur existe
        if (Get-LocalUser -Name $user -ErrorAction SilentlyContinue) {
            Write-Host "L'utilisateur $user n'existe pas."
        }
        # Si oui ajout de l'utilisateur au groupe
        else {
            try {
                Invoke-Command -ComputerName $ipAddress -ScriptBlock {
                    param($addGroup, $user)
                    Add-LocalGroupMember -Group $using:addGroup -Member $using:user -Confirm
                    Write-Host "L'utilisateur a ete ajoute au groupe $addGroup avec succes."
                } -ArgumentList $addGroup -ErrorAction Stop
                $eventLog = "Ajout du compte $user au groupe $addGroup sur $clientName"
                eventLogTask
            }
            catch {
                Write-Host "Erreur lors de l'ajout de l'utilisateur au groupe"
            }
        }
    }
    else {
        Write-Host "Opération annulée."
    }
    fonction_menu_action_utilisateur
}

# Suppression d'un utilisateur d'un groupe local
function Supp_user_from_group {
    $answer = Read-Host "Voulez-vous retirer un utilisateur local d'un groupe ? (o/n)"
    if ($answer -eq "o") {
        $user = Read-Host "Rentrez le nom de l'utilisateur"
        $delGroup = Read-Host "Rentrer le nom du groupe"
        # Vérification que l'utilisateur existe
        if (Get-LocalUser -Name $user -ErrorAction SilentlyContinue) {
            Write-Host "L'utilisateur $user n'existe pas."
        }
        # Si oui ajout de l'utilisateur au groupe
        else {
            try {
                Invoke-Command -ComputerName $ipAddress -ScriptBlock {
                    param($delGroup, $user)
                    Remove-LocalGroupMember -Group $using:delGroup -Member $using:user -Confirm
                    Write-Host "L'utilisateur a ete supprime du groupe $delGroup avec succes."
                } -ArgumentList $delGroup -ErrorAction Stop
                $eventLog = "Suppression du compte $user du groupe $delGroup sur $clientName"
                eventLogTask
            }
            catch {
                Write-Host "Erreur lors de l'ajout de l'utilisateur au groupe"
            }
        }
    }
    else {
        Write-Host "Opération annulée."
    }
    fonction_menu_action_utilisateur
}

#Menu info ordinateur
function fonction_menu_info_ordinateur_client {
    Write-Host "Menu info ordinateur client" -ForegroundColor Cyan
    Write-Host
    Write-Host "1 - Version de l'OS"
    Write-Host "2 - Nombre de disques"
    Write-Host "3 - Info partitions"
    Write-Host "4 - Listes des applications installées"
    Write-Host "5 - Liste des services en cours d'exécution"
    Write-Host "6 - Liste des utilisateurs locaux"
    Write-Host "7 - Infos sur le CPU"
    Write-Host "8 - Mémoire RAM totale et utilisation"
    Write-Host "9 - Utilisation du disque"
    Write-Host "10 - Utilisation du processeur"
    Write-Host "11 - Retour"
    Write-Host "12 - Retour au Choix du Client"
    Write-Host "x - Quitter l'outil d'Administration"

    Write-Host
    $choix = Read-Host "Faites votre choix et appuyez Entrée"

    switch ($choix) {
        "1" { Version_de_l_OS }
        "2" { Nombre_de_disques }
        "3" { Info_partitions }
        "4" { Liste_des_appli_installées }
        "5" { Liste_des_services_en_cours_d_utilisation }
        "6" { Liste_des_utilisateurs_locaux }
        "7" { Infos_sur_le_CPU }
        "8" { Memoire_RAM_totale }
        "9" { Utilisation_du_disque }
        "10" { Utilisation_du_processeur }
        "11" { Write-Host "Retour au menu principal"; Menu_principal_ps; $eventLog = "Redirection vers Menu Action Information"; eventLogTask }
        "12" { menuMainMenu; $eventLog = "Redirection vers Menu Choix Client"; eventLogTask }
        "x" { endLogTask ; exit }
        default { Write-Host "Commande invalide" }
    }
}

# 1 Version de l'OS

function Version_de_l_OS {
    Clear-Host
    Write-Host "Version de l'OS :"
    $infoLogPreview = Invoke-Command -ComputerName $ipAddress -ScriptBlock { (Get-WmiObject -Class Win32_OperatingSystem).Caption
    }
    $infoLogPreview
    $eventLog = "Requête Version OS sur $clientName"
    eventLogTask
    $eventTarget = $clientName
    infoLogTask
    fonction_menu_info_ordinateur_client ; $eventLog = "Redirection vers Menu Information Client"; eventLog
}

# 2 Nombre de disques

function Nombre_de_disques {
    Clear-Host
    Write-Host = "Nombre de disque :"
    $infoLogPreview = Invoke-Command -ComputerName $ipAddress -ScriptBlock { Get-Disk 
    }
    $infoLogPreview
    $eventLog = "Requête Nombre de disque sur $clientName"
    eventLogTask
    $eventTarget = $clientName
    infoLogTask
    fonction_menu_info_ordinateur_client ; $eventLog = "Redirection vers Menu Information Client"; eventLog
}

# 3 Infos sur les partitions
function Info_partitions {
    Clear-Host
    Write-Host "Infos sur les partitions :"
    $infoLogPreview = Invoke-Command -ComputerName $ipAddress -ScriptBlock { Get-WmiObject -Class Win32_DiskPartition | Select-Object DeviceID, Name, Size, Type
    }
    $infoLogPreview
    $eventLog = "Requête Nombre de disque sur $clientName"
    eventLogTask
    $eventTarget = $clientName
    infoLogTask
    fonction_menu_info_ordinateur_client ; $eventLog = "Redirection vers Menu Information Client"; eventLog
}

# 4 Liste des applications installées = a revoir description et commande
function Liste_des_appli_installées {
    Clear-Host
    Write-Host "Liste des paquets installés :"
    $infoLogPreview = Invoke-Command -ComputerName $ipAddress -ScriptBlock { Get-WmiObject -Class Win32_Product | Select-Object -Property Name
    }
    $infoLogPreview
    $eventLog = "Requête Liste applications installées sur $clientName"
    eventLogTask
    $eventTarget = $clientName
    infoLogTask
    fonction_menu_info_ordinateur_client ; $eventLog = "Redirection vers Menu Information Client"; eventLog
}

# 5 Liste des services en cours d'utilisation
function Liste_des_services_en_cours_d_utilisation {
    Clear-Host
    Write-Host "Liste des services en cours d'utilisation :"
    $infoLogPreview = Invoke-Command -ComputerName $ipAddress -ScriptBlock { Get-Service | Where-Object { $_.Status -eq 'Running' }
    }
    $infoLogPreview
    $eventLog = "Requête Liste services en utilisation sur $clientName"
    eventLogTask
    $eventTarget = $clientName
    infoLogTask
    fonction_menu_info_ordinateur_client ; $eventLog = "Redirection vers Menu Information Client"; eventLog
}

# 6 Liste des utilisateurs locaux
function Liste_des_utilisateurs_locaux {
    Clear-Host
    Write-Host "Liste des utilisateurs locaux :"
    $infoLogPreview = Invoke-Command -ComputerName $ipAddress -ScriptBlock { Get-LocalUser | Select-Object Name
    }
    $infoLogPreview
    $eventLog = "Requête Liste utilisateurs locaux sur $clientName"
    eventLogTask
    $eventTarget = $clientName
    infoLogTask
    fonction_menu_info_ordinateur_client ; $eventLog = "Redirection vers Menu Information Client"; eventLog
}

# 7 Infos sur le CPU
function Infos_sur_le_CPU {
    Clear-Host
    Write-Host "Infos sur le CPU :"
    $infoLogPreview = Invoke-Command -ComputerName $ipAddress -ScriptBlock { Get-WmiObject Win32_Processor | Select-Object Name, Manufacturer, MaxClockSpeed, NumberOfCores, NumberOfLogicalProcessors
    }
    $infoLogPreview
    $eventLog = "Requête Information CPU sur $clientName"
    eventLogTask
    $eventTarget = $clientName
    infoLogTask
    fonction_menu_info_ordinateur_client ; $eventLog = "Redirection vers Menu Information Client"; eventLog
}

# 8 Mémoire RAM totale et utilisation
function Memoire_RAM_totale {
    Clear-Host
    Write-Host "RAM totale et utilisation :"
    $infoLogPreview = Invoke-Command -ComputerName $ipAddress -ScriptBlock { Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object TotalVisibleMemorySize, FreePhysicalMemory
    }
    $infoLogPreview
    $eventLog = "Requête Mémoire RAM totale sur $clientName"
    eventLogTask
    $eventTarget = $clientName
    infoLogTask
    fonction_menu_info_ordinateur_client ; $eventLog = "Redirection vers Menu Information Client"; eventLog
}

# 9 Utilisation du disque
function Utilisation_du_disque {
    Clear-Host
    Write-Host "Utilisation du disque :"
    $infoLogPreview = Invoke-Command -ComputerName $ipAddress -ScriptBlock { Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'" | Select-Object -Property FreeSpace, Size
    }
    $infoLogPreview
    $eventLog = "Requête Utilisation du disque sur $clientName"
    eventLogTask
    $eventTarget = $clientName
    infoLogTask
    fonction_menu_info_ordinateur_client ; $eventLog = "Redirection vers Menu Information Client"; eventLog
}

# 10 Utilisation du processeur
function Utilisation_du_processeur {
    Clear-Host
    Write-Host "Utilisation du processeur :"
    $infoLogPreview = Invoke-Command -ComputerName $ipAddress -ScriptBlock { Get-Counter '\Processor(_Total)\% Processor Time'
    }
    $infoLogPreview
    $eventLog = "Requête Utilisation du processeur sur $clientName"
    eventLogTask
    $eventTarget = $clientName
    infoLogTask
    fonction_menu_info_ordinateur_client ; $eventLog = "Redirection vers Menu Information Client"; eventLog
}

#Menu info utilisateur
function fonction_menu_info_utilisateur {
    Write-Host "Menu info utilisateur" -ForegroundColor Cyan
    Write-Host
    Write-Host "1 - Date de dernière connexion d'un utilisateur"
    Write-Host "2 - Date de dernière modification de mot de passe"
    Write-Host "3 - Liste des sessions ouvertes par l'utilisateur"
    Write-Host "4 - Groupe d’appartenance d’un utilisateur"
    Write-Host "5 - Historique des commandes exécutées par l'utilisateur"
    Write-Host "6 - Droits et permissions de l’utilisateur sur un dossier"
    Write-Host "7 - Droits/permissions de l’utilisateur sur un fichier"
    Write-Host "8 - Retour"
    Write-Host "9 - Retour au Choix Client"
    Write-Host "x - Quitter l'outil d'Administration"
    Write-Host
    $choix = Read-Host "Faites votre choix et appuyez Entrée:"

    switch ($choix) {
        "1" { Derniere_connection_utilisateur }
        "2" { Derniere_modification_mdp }
        "3" { Liste_sessions_ouverte_par_utilisateur }
        "4" { Groupe_utilisateur }
        "5" { Historique_utilisateur }
        "6" { Droit_sur_un_dossier }
        "7" { Droit_sur_un_fichier }
        "8" { Write-Host "Retour au menu principal"; Menu_principal_ps $eventLog = "Redirection vers Menu Action Information"; eventLog }
        "9" { menuMainMenu; $eventLog = "Redirection vers Menu Choix Client"; eventLogTask }
        "x" { endLogTask ; exit }
        default { Write-Host "Commande invalide" }
    }
}

#1 Date de dernières connexion d'un utilisateur
function Derniere_connection_utilisateur {
    Clear-Host
    $UserName = Read-Host "Rentrez un nom d'utilisateur "
    $infoLogPreview = Invoke-Command -ComputerName $ipAddress -ScriptBlock { Get-LocalUser -name $using:UserName | Sort-Object LastLogon | Select-Object Name, Lastlogon -Last 1 }
    $infoLogPreview
    $eventLog = "Requête dernière connexion de $UserName sur $clientName"
    eventLogTask
    $eventTarget = $UserName
    infoLogTask
    fonction_menu_info_utilisateur ; $eventLog = "Redirection vers Menu Information Utilisateur"; eventLog
}
#2 Date de dernière modification du mode de passe
function Derniere_modification_mdp {
    Clear-Host
    $UserName = Read-Host "Rentrez un nom d'utilisateur "
    $infoLogPreview = Invoke-Command -ComputerName $ipAddress -ScriptBlock { net user $using:UserName | Select-String "Mot de passeÿ: dernier changmt." }
    $infoLogPreview
    $eventLog = "Requête dernière modification de mot de passe de $UserName sur $clientName"
    eventLogTask
    $eventTarget = $UserName
    infoLogTask
    fonction_menu_info_utilisateur ; $eventLog = "Redirection vers Menu Information Utilisateur"; eventLog
}

#3 Liste des sessions ouvertes par l'utilisateur
function Liste_sessions_ouverte_par_utilisateur {
    $UserName = Read-Host "Rentrez un nom d'utilisateur "
    $infoLogPreview = Invoke-Command -ComputerName $ipAddress -ScriptBlock { Get-WmiObject -Class Win32_ComputerSystem | Select-Object $UserName
    }
    $infoLogPreview
    $eventLog = "Requête sessions ouvertes de $UserName sur $clientName"
    eventLogTask
    $eventTarget = $UserName
    infoLogTask
    fonction_menu_info_utilisateur ; $eventLog = "Redirection vers Menu Information Utilisateur"; eventLog
}

#4 Groupe d’appartenance d’un utilisateur
function Groupe_utilisateur {
    $UserName = Read-Host "Rentrez un nom d'utilisateur "
    $infoLogPreview = Invoke-Command -ComputerName $ipAddress -ScriptBlock { net user $using:UserName | Select-String "groupes"
    }
    $infoLogPreview
    $eventLog = "Requête groupe de $UserName sur $clientName"
    eventLogTask
    $eventTarget = $UserName
    infoLogTask
    fonction_menu_info_utilisateur ; $eventLog = "Redirection vers Menu Information Utilisateur"; eventLog
}
#5 Historique des commandes exécutées par l'utilisateur
function Historique_utilisateur {
    $UserName = Read-Host "Rentrez un nom d'utilisateur "
    $infoLogPreview = Invoke-Command -ComputerName $ipAddress -ScriptBlock { Get-Content -path C:\Users\wilder\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt }
    $infoLogPreview
    $eventLog = "Requête historique de $UserName sur $clientName"
    eventLogTask
    $eventTarget = $UserName
    infoLogTask
    fonction_menu_info_utilisateur ; $eventLog = "Redirection vers Menu Information Utilisateur"; eventLog
}


#6 Droits et permissions de l’utilisateur sur un dossier
function Droit_sur_un_dossier {
    $dossier = Read-Host "Saisissez le chemin du dossier"
    $infoLogPreview = Invoke-Command -ComputerName $ipAddress -ScriptBlock {
        param($dossier, $UserName)
        Get-Acl -Path $dossier | Select-Object -ExpandProperty Access | Where-Object { $_.IdentityReference -match $UserName }
    } -ArgumentList $dossier, $UserName
    $infoLogPreview
    $eventLog = "Requête droit sur dossier de $UserName sur $clientName"
    eventLogTask
    $eventTarget = $UserName
    infoLogTask
    fonction_menu_info_utilisateur ; $eventLog = "Redirection vers Menu Information Utilisateur"; eventLog


}

#7 Droits/permissions de l’utilisateur sur un fichier
function Droit_sur_un_fichier {
    $fichier = Read-Host "Saisissez le chemin du fichier"
    $infoLogPreview = Invoke-Command -ComputerName $ipAddress -ScriptBlock {
        param($fichier, $UserName)
        Get-Acl -Path $fichier | Select-Object -ExpandProperty Access | Where-Object { $_.IdentityReference -match $UserName }
    } -ArgumentList $dossier, $UserName
    $infoLogPreview
    $eventLog = "Requête droit fichier de $UserName sur $clientName"
    eventLogTask
    $eventTarget = $UserName
    infoLogTask
    fonction_menu_info_utilisateur ; $eventLog = "Redirection vers Menu Information Utilisateur"; eventLog
}
#Menu actions ordinateur client
#Développement de la fonction qui permettra de revenir au menu des actions sur l'ordi client

#Menu actions ordinateur client
#Développement de la fonction qui permettra de revenir au menu des actions sur l'ordi client

function Menu_actions_ordinateur_client() {

    while ( $true ) {

        Write-Host "Menu actions sur l'ordinateur client`n" -ForegroundColor Cyan
        Write-Host "1 - Arrêt"
        Write-Host "2 - Redémarrage"
        Write-Host "3 - Verrouillage"
        Write-Host "4 - Mise à jour système"
        Write-Host "5 - Prise en main à distance"
        Write-Host "6 - Définition de règles de pare-feu"
        Write-Host "7 - Activation du pare-feu"
        Write-Host "8 - Désactivation du pare-feu"
        Write-Host "9 - Installer logiciel"
        Write-Host "10 - Désinstaller logiciel"
        Write-Host "11 - Exécution de script"
        Write-Host "12 - Création de répertoire"
        Write-Host "13 - Suppression de répertoire"
        Write-Host "14 - Modification de répertoire"
        Write-Host "15 - Quitter le sous-menu`n"
        Write-Host "16 - Retour au Choix Client"
        Write-Host "x - Quitter l'outil d'Administration"

    
        $choix_menu_actions_ordinateur_client = Read-Host "Faites votre choix et appuyez sur Entrée "

        switch ($choix_menu_actions_ordinateur_client) {
            "1" { Arret }
            "2" { Redemarrage }
            "3" { Verrouillage }
            "4" { Mise_a_jour_systeme }
            "5" { Prise_en_main_a_distance }
            "6" { Definition_des_regles_de_parefeu }
            "7" { Activation_du_parefeu }
            "8" { Desactivation_du_parefeu }
            "9" { Installer_logiciel }
            "10" { Desinstaller_logiciel }
            "11" { Execution_de_script }
            "12" { Creation_de_repertoire }
            "13" { Suppression_de_repertoire }
            "14" { Modification_de_repertoire } 
            "15" { Quitter_le_sousmenu ; $eventLog = "Redirection vers Menu Action Information" ; eventLogTask }
            "16" { menuMainMenu; $eventLog = "Redirection vers Menu Choix Client"; eventLogTask }
            "x" { endLogTask ; exit }
            default { Write-Host "Commande invalide. Retour au menu"; Start-Sleep -Seconds 2; Menu_actions_ordinateur_client }

        }
    }

}



#Fonction Arrêt

function Arret() {
    #On demande à l'utilisateur s'il confirme sa volonté d'éteindre le poste distant
    $choix_arret_ordi_client = Read-Host "Êtes-vous sur(e) de vouloir procéder à l'arrêt du poste client distant ? (o/n) "
    #On pose la condition Si, et soit on confirme l'extinction, soit on revient au menu précédent
    If ( $choix_arret_ordi_client -eq "o" ) {
        #Stop-Computer -ComputerName $ipAddress -Credential $(Get-Credential) -Force
        Invoke-Command -ComputerName $ipAddress -ScriptBlock { Stop-Computer -Force }
        $eventLog = "Arrêt de $clientName"
        eventLogTask
    }
    Else {
        Write-Host "Opération annulée. Retour au menu précédent..."
        Start-Sleep -Seconds 2
        Menu_actions_ordinateur_client
    }
}



#Fonction Redémarrage

function Redemarrage() {
    #On demande à l'utilisateur s'il confirme sa volonté de redémarrer
    $choix_redemerrage_ordi_client = Read-Host "Êtes-vous sur(e) de vouloir procéder au redémarrage du poste client distant ? (o/n) "
    #On pose la condition Si, soit on redémarre, soit on revient au menu précédent
    If ( $choix_redemerrage_ordi_client -eq "o" ) {
        #Restart-Computer -ComputerName $ipAddress -Credential $(Get-Credential) -Force
        Invoke-Command -ComputerName $ipAddress -ScriptBlock { Restart-Computer -Force }
        $eventLog = "Redémarrage de $clientName"
        eventLogTask
    }
    Else {
        Write-Host "Opération annulée. Retour au menu précédent..."
        Start-Sleep -Seconds 2
        Menu_actions_ordinateur_client
    }

}



#Fonction Verrouillage 

function Verrouillage() {
    #On demande à l'utilisateur s'il confirme sa volonté de redémarrer l'ordinateur client
    $choix_verrouillage_ordi_client = Read-Host "Êtes-vous sur(e) de vouloir procéder au verrouillage de la session en cours sur le poste client distant ? (o/n) "
    #On pose la condition Si, soit on verrouille, soit on renvoie au menu précédent
    If ( $choix_verrouillage_ordi_client -eq "o" ) {
        Invoke-Command -ComputerName $ipAddress -ScriptBlock { logoff console }
        $eventLog = "Verrouillage de $clientName"
        eventLogTask
    }
    Else {
        Write-Host "Opération annulée. Retour au menu précédent..."
        Start-Sleep -Seconds 2
        Menu_actions_ordinateur_client
    }
}



#Fonction Mise à jour système
#Penser à Enter-PSSession -ComputerName <ip> -Credential <nomuser> 

function Mise_a_jour_systeme() {
    # On demande à l'utilisateur s'il souhaite procéder aux mises à jour
    $choix_mises_a_jour_systeme = Read-Host "Êtes-vous sûr(e) de vouloir procéder aux mises à jour du système sur $ipAddress ? Nous allons procéder à leur recherche (o/n) "

    # On pose la condition If, soit oui et go, soit non et retour menu précédent
    If ($choix_mises_a_jour_systeme -eq "o") {
        Write-Host "Recherche des mises à jour disponibles sur $ipAddress..."
        # Au préalable : 
        # Install-Module -Name PSWindowsUpdate -RequiredVersion 2.2.0.3
        # Ensuite : Set-ExecutionPolicy Unrestricted > oui pour tout (pour l'exécution des scripts)

        # Récupère les mises à jour disponibles sur le poste distant
        $resultat_mises_a_jour = $(Invoke-Command -ComputerName $ipAddress -ScriptBlock { Get-WindowsUpdate })

        # On demande à l'utilisateur s'il veut continuer après l'affichage des éventuelles mises à jour SI il y en a
        If ($resultat_mises_a_jour.Count -gt 0) {
            $resultat_mises_a_jour
            $choix_mises_a_jour_systeme2 = Read-Host "Des mises à jour sont disponibles. Voulez-vous les installer ? (o/n) "

            # Vérifie la réponse de l'utilisateur
            If ($choix_mises_a_jour_systeme2 -eq "o") {
                # Installe les mises à jour sur le poste distant
                Invoke-Command -ComputerName $ipAddress -ScriptBlock {
                    Install-WindowsUpdate -AcceptAll
                }

                # Vérifie si l'installation s'est bien déroulée
                $installation_reussie = $(Invoke-Command -ComputerName $ipAddress -ScriptBlock {
                        Install-WindowsUpdate -AcceptAll -ErrorAction SilentlyContinue
                    })

                # Affiche le résultat de l'installation
                if ($installation_reussie) {
                    Write-Host "L'installation des mises à jour sur $ipAddress s'est bien déroulée. Félicitations."
                    $eventLog = "Mise à jour système de $clientName"
                    eventLogTask
                }
                else {
                    Write-Host "Une erreur s'est produite lors de l'installation des mises à jour sur $ipAddress. C'est la catastrophe !"
                }
            }
            else {
                Write-Host "Les mises à jour ne seront pas installées sur $ipAddress."
            }
        }
        else {
            Write-Host "Aucune mise à jour disponible sur $ipAddress."
        }
    }
    else {
        Write-Host "Opération annulée. Retour au menu précédent..."
    }
}



#Fonction Prise en main à distance

function Prise_en_main_a_distance() {
    #Confirmation
    $choix_prise_en_main_a_distance = Read-Host "Voulez-vous prendre la main à distance sur la machine ? (o/n) "
    #On pose la condition SI, soit on y va, soit on revient au menu précédent
    If ( $choix_prise_en_main_a_distance -eq "o" ) {
        #Etapes préliminaires, voir PowerShell - à distance
        Enter-PSSession -ComputerName $ipAddress -Credential $(Get-Credential)
        $eventLog = "Prise de main distante de $clientName"
        eventLogTask
    }
    Else {
        Write-Host "Opération annulée. Retour au menu précédent..."
        Start-Sleep -Seconds 2
        #Menu_actions_ordinateur_client
    }
}



#Fonction définition des règles de parefeu

function Definition_des_regles_de_parefeu() {
    Write-Host "Etat des règles de pare-feu :"
    Invoke-Command -ComputerName $ipAddress -ScriptBlock { Get-NetFirewallProfile }
    $eventLog = "Regles de parefeu de $clientName"
    eventLogTask
    #On propose de revenir au menu précédent
    #Condition SI dans la boucle TANT que, soit on revient soit on n'a pas compris
    While ( $true ) {
        $choix_sortie_regles_parefeu = Read-Host "Pour revenir au menu précédent, "1" puis "Entrée": "
        If ( $choix_sortie_regles_parefeu -eq "1" ) {
            Write-Host "Retour au menu précédent..."
            Start-Sleep -Seconds 1
            Menu_actions_ordinateur_client
        }
        Else {
            Write-Host "Commande invalide."
        }
    }
}



#Fonction Activation du parefeu

function Activation_du_parefeu() {
    #Boucle WHILE pour continuer tant qu'on n'a pas une "bonne" réponse
    While ($true) {
        #On offre à l'utilisateur la possibilité de choisir sur quel profil il souhaite agir
        #il pourra choisir une combinaison au besoin
        #On pose un SWITCH avec toutes les possibilités
        $choix_activation_parefeu = Read-Host "Indiquer le ou les profils sur que vous souhaitez activer:`n - Domain (1)`n - Private (2)`n - Public (3)`n - Tous (4)`n - Revenir au menu précédent (q)`n"
        Switch ($choix_activation_parefeu) {
            "1" { Invoke-Command -ComputerName $ipAddress -ScriptBlock { Set-NetFirewallProfile -Profile Domain -Enabled True; Write-Host "Pare-feu activé pour le profil Domain"; Start-Sleep -Seconds 2 } ; $eventLog = "Activation du parefeu de $clientName" ; eventLogTask }
            "2" { Invoke-Command -ComputerName $ipAddress -ScriptBlock { Set-NetFirewallProfile -Profile Private -Enabled True; Write-Host "Pare-feu activé pour le profil Private"; Start-Sleep -Seconds 2 } ; $eventLog = "Activation du parefeu de $clientName" ; eventLogTask }
            "3" { Invoke-Command -ComputerName $ipAddress -ScriptBlock { Set-NetFirewallProfile -Profile Public -Enabled True; Write-Host "Pare-feu activé pour le profil Public"; Start-Sleep -Seconds 2 } ; $eventLog = "Activation du parefeu de $clientName" ; eventLogTask }
            "1,2" { Invoke-Command -ComputerName $ipAddress -ScriptBlock { Set-NetFirewallProfile -Profile Domain, Private -Enabled True; Write-Host "Pare-feu activé pour les profils Domain et Private"; Start-Sleep -Seconds 2 } ; $eventLog = "Activation du parefeu de $clientName" ; eventLogTask }
            "2,3" { Invoke-Command -ComputerName $ipAddress -ScriptBlock { Set-NetFirewallProfile -Profile Private, Public -Enabled True; Write-Host "Pare-feu activé pour les profils Public et Private"; Start-Sleep -Seconds 2 } ; $eventLog = "Activation du parefeu de $clientName" ; eventLogTask }
            "1,3" { Invoke-Command -ComputerName $ipAddress -ScriptBlock { Set-NetFirewallProfile -Profile Domain, Public -Enabled True; Write-Host "Pare-feu activé pour les profils Domain et Public"; Start-Sleep -Seconds 2 } ; $eventLog = "Activation du parefeu de $clientName" ; eventLogTask }
            "4" { Invoke-Command -ComputerName $ipAddress -ScriptBlock { Set-NetFirewallProfile -Profile Domain, Private, Public -Enabled True; Write-Host "Pare-feu activé pour tous les profils"; Start-Sleep -Seconds 2 } ; $eventLog = "Activation du parefeu de $clientName" ; eventLogTask }
            "q" { Menu_actions_ordinateur_client }
            default { Write-Host "Commande invalide. Veuillez ressaisir" }
        }
    }
}



#Fonction Desactivation du parefeu

function Desactivation_du_parefeu() {
    #Boucle WHILE pour continuer tant qu'on n'a pas une "bonne" réponse
    While ($true) {
        #On offre à l'utilisateur la possibilité de choisir sur quel profil il souhaite agir
        #il pourra choisir une combinaison au besoin
        #On pose un SWITCH avec toutes les possibilités
        $choix_desactivation_parefeu = Read-Host "Indiquer le ou les profils sur que vous souhaitez désactiver:`n - Domain (1)`n - Private (2)`n - Public (3)`n - Tous (4)`n - Revenir au menu précédent (q)`n"
        Switch ($choix_desactivation_parefeu) {
            "1" { Invoke-Command -ComputerName $ipAddress -ScriptBlock { Set-NetFirewallProfile -Profile Domain -Enabled false; Write-Host "Pare-feu désactivé pour le profil Domain"; Start-Sleep -Seconds 2 } ; $eventLog = "Désactivation du parefeu de $clientName" ; eventLogTask } 
            "2" { Invoke-Command -ComputerName $ipAddress -ScriptBlock { Set-NetFirewallProfile -Profile Private -Enabled false; Write-Host "Pare-feu désactivé pour le profil Private"; Start-Sleep -Seconds 2 } ; $eventLog = "Désactivation du parefeu de $clientName" ; eventLogTask }
            "3" { Invoke-Command -ComputerName $ipAddress -ScriptBlock { Set-NetFirewallProfile -Profile Public -Enabled false; Write-Host "Pare-feu désactivé pour le profil Public"; Start-Sleep -Seconds 2 } ; $eventLog = "Désactivation du parefeu de $clientName" ; eventLogTask }
            "1,2" { Invoke-Command -ComputerName $ipAddress -ScriptBlock { Set-NetFirewallProfile -Profile Domain, Private -Enabled false; Write-Host "Pare-feu désactivé pour les profils Domain et Private"; Start-Sleep -Seconds 2 } ; $eventLog = "Désactivation du parefeu de $clientName" ; eventLogTask }
            "2,3" { Invoke-Command -ComputerName $ipAddress -ScriptBlock { Set-NetFirewallProfile -Profile Private, Public -Enabled false; Write-Host "Pare-feu désactivé pour les profils Public et Private"; Start-Sleep -Seconds 2 } ; $eventLog = "Désactivation du parefeu de $clientName" ; eventLogTask }
            "1,3" { Invoke-Command -ComputerName $ipAddress -ScriptBlock { Set-NetFirewallProfile -Profile Domain, Public -Enabled false; Write-Host "Pare-feu désactivé pour les profils Domain et Public"; Start-Sleep -Seconds 2 } ; $eventLog = "Désactivation du parefeu de $clientName" ; eventLogTask }
            "4" { Invoke-Command -ComputerName $ipAddress -ScriptBlock { Set-NetFirewallProfile -Profile Domain, Private, Public -Enabled false; Write-Host "Pare-feu désactivé pour tous les profils"; Start-Sleep -Seconds 2 } ; $eventLog = "Désactivation du parefeu de $clientName" ; eventLogTask }
            "q" { Menu_actions_ordinateur_client }
            default { Write-Host "Commande invalide. Veuillez ressaisir" }
        }
    }
}



#Fonction Installer logiciel

function Installer_logiciel() {
    # Boucle pour demander à l'utilisateur une réponse valide
    while ($true) {
        # SWITCH, soit on va dans l'install, soit on revient au menu précédent
        $choix_installation_logiciel_oui_non = Read-Host "Voulez-vous poursuivre pour installer un logiciel sur le poste client (1) ou revenir au menu précédent (x) ?"
        Switch ($choix_installation_logiciel_oui_non) {
            "1" {   
                # On demande à l'utilisateur le programme qu'il souhaite installer 
                $choix_logiciel_install_via_chocolatey = Read-Host "Quel logiciel souhaitez-vous installer sur le poste client "
                Invoke-Command -ComputerName $ipAddress -ScriptBlock { param($choix_logiciel_install_via_chocolatey) choco list --local-only | Select-String -Pattern $choix_logiciel_install_via_chocolatey } -ArgumentList $choix_logiciel_install_via_chocolatey
                #On lance le processus d'installation
                Write-Host "Installation en cours..."
                Invoke-Command -ComputerName $ipAddress -ScriptBlock { param($choix_logiciel_install_via_chocolatey) choco install $choix_logiciel_install_via_chocolatey -y } -ArgumentList $choix_logiciel_install_via_chocolatey
                $eventLog = "Installation Logiciel sur $clientName"
                eventLogTask
                Write-Host "Retour au menu précédent..."
                Start-Sleep -Seconds 1
                # Retourner au menu précédent
                Menu_actions_ordinateur_client
            }

            "x" {
                Menu_actions_ordinateur_client
            }

            default {
                Write-Host "Commande invalide, veuillez ressaisir :"
            }
        }
    }
}



#Fonction Desinstaller logiciel

function Desinstaller_logiciel() {
    # Boucle pour demander à l'utilisateur une réponse valide
    While ($true) {
        #SWITCH, soit on file dans le processus de désinstallation, soit on revient au menu précédent
        $choix_desinstallation_logiciel_oui_non = Read-Host "Voulez-vous poursuivre pour désinstaller un logiciel sur le poste client (1) ou revenir au menu précédent (x) ?"
        Switch ($choix_desinstallation_logiciel_oui_non) {
            "1" {
                #On demande à l'utilisateur de donner le nom du logiciel qu'il souhaite désinstaller
                $logiciel_pour_desinstallation = Read-Host "Veuillez donner le nom du logiciel que vous souhaitez désinstaller :"
                Invoke-Command -ComputerName $ipAddress -ScriptBlock { param($logiciel_pour_desinstallation) choco list --local-only | Select-String -Pattern $logiciel_pour_desinstallation } -ArgumentList $logiciel_pour_desinstallation
                #On lance la désinstallation 
                Write-Host "Désinstallation en cours..."
                Invoke-Command -ComputerName $ipAddress -ScriptBlock { param($logiciel_pour_desinstallation) choco uninstall $logiciel_pour_desinstallation } -ArgumentList $logiciel_pour_desinstallation
                $eventLog = "Désinstallation Logiciel sur $clientName"
                eventLogTask
                Write-Host "Retour au menu précédent..."
                Start-Sleep -Seconds 1
                #Retour menu précédent
                Menu_actions_ordinateur_client
            }

            "x" 
            { Menu_actions_ordinateur_client }

            default 
            { Write-Host "Commande invalide, veuillez ressaisir" }
        }
    }
}




#Fonction Exécution de script

function Execution_de_script() {
    #Script PowerShell qui demande le nom de l'utilisateur et crée un fichier sur son bureau qui porte son 'nom' et qui contient du texte en relation
    param ([string[]]$prenoms)

    #Demande à l'utilisateur son prénom
    $prenoms = Read-Host "Nom"

    #chemin vers le bureau de l'utilisateur actuel
    $bureauClient = "C:\Users\wilder\Desktop\$prenoms.txt"

    Foreach ($prenom in $prenoms) {
        #Contenu du fichier
        $bonne_humeur = "Aujourd'hui, $prenom est de bonne humeur !"

        #Définir le nom de fichier avec le prénom
        $nomFichier = $($bureauClient)

        #Try and Catch 
        Try {
            Invoke-Command -ComputerName $ipAddress -ScriptBlock { param($bonne_humeur, $bureauClient)
                Set-Content -Path $bureauClient -Value $bonne_humeur } -ArgumentList $bonne_humeur, $bureauClient
            $eventLog = "Exécution Script sur $clientName"
            eventLogTask
            Write-Host "Fichier crée : $nomFichier"
        }
        Catch {
            Write-Host "Erreur lors de la création du fichier pour $prenom !"
        }

    }
}




#Fonction Creation de répertoire

function Creation_de_repertoire() {
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
        if (-not $existenceDossier) {
            # Créer le dossier
            Invoke-Command -ComputerName $ipAddress -ScriptBlock { param ($nomdossier, $existenceDossier, $cheminDossier) New-Item -Path $cheminDossier\$nomdossier -ItemType Directory -ErrorAction SilentlyContinue } -ArgumentList $nomDossier, $existenceDossier, $cheminDossier; 

            #Test et confirmation de la création du dossier sur le poste client
            $nouvelleExistenceDossierDistant = $(Invoke-Command -ComputerName $ipAddress -ScriptBlock { param ($cheminDossier) Test-Path -Path $cheminDossier } -ArgumentList $cheminDossier)
            if ($nouvelleExistenceDossierDistant) {
                Write-Host "Le dossier $nomDossier a été créé avec succès sur le poste distant."
                $eventLog = "Création repertoire sur $clientName"
                eventLogTask
            }
            else {
                Write-Host "Erreur : Impossible de créer le dossier $nomDossier sur le poste distant."
            }
            Menu_actions_ordinateur_client
        }   
        else {
            Write-Host "Le dossier $nomDossier existe déjà sur le poste client distant !"
            Menu_actions_ordinateur_client
        }
    }
}



#Fonction Suppression de répertoire

function Suppression_de_repertoire() {
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
        If ($existence_dossier_a_supprimer) {
            Invoke-Command -ComputerName $ipAddress -ScriptBlock { param($choix_dossier_suppression, $existence_dossier_a_supprimer, $chemin_dossier_a_supprimer) Write-Host "Suppression du dossier $choix_dossier_suppression en cours..."; Start-Sleep -Seconds 1; Remove-Item -Path $chemin_dossier_a_supprimer -Recurse -Force; Write-Host "Le dossier $choix_dossier_suppression a été supprimé avec succès. Félicitations."; $eventLog = "Suppression repertoire sur $clientName" ; eventLogTask ; Start-Sleep -Seconds 1; Write-Host "Retour au menu précédent..."; Start-Sleep -Seconds 1 } -ArgumentList $choix_dossier_suppression, $existence_dossier_a_supprimer, $chemin_dossier_a_supprimer
            Menu_actions_ordinateur_client
        }
        Else {
            Write-Host "Le dossier $choix_dossier_suppression n'existe pas !"
            Write-Host "Retour au menu précédent..."
            Start-Sleep -Seconds 2
            Menu_actions_ordinateur_client
        }
    }
}


#Fonction Modification de répertoire

function Modification_de_repertoire() {

    function switch1modification() {
        #On demande le nom du dossier qu'il souhaite rename
        $choix_modification_dossier = Read-Host "Veuillez indiquer le nom du dossier que vous souhaitez renommer"

        #Chemin du dossier à modifier
        $chemin_dossier_modification = "C:\Users\wilder\Desktop\$choix_modification_dossier"

        #On vérifie son existence
        $verification_existence_dossier_modif = $(Invoke-Command -ComputerName $ipAddress -ScriptBlock { param($chemin_dossier_modification) Test-Path -Path $chemin_dossier_modification } -ArgumentList $chemin_dossier_modification )

        #On pose la condition SI, soit il existe et on go, soit non et on revient au sous_menu 'Modification_de_repertoire'
        If ($verification_existence_dossier_modif) {
            $choix_nouveau_nom_modification_dossier = Read-Host "Indiquez le nouveau nom"
            Invoke-Command -ComputerName $ipAddress -ScriptBlock { param($chemin_dossier_modification, $verification_existence_dossier_modif, $choix_modification_dossier, $choix_nouveau_nom_modification_dossier) Rename-Item -Path $chemin_dossier_modification -NewName $choix_nouveau_nom_modification_dossier } -ArgumentList $chemin_dossier_modification, $verification_existence_dossier_modif, $choix_modification_dossier, $choix_nouveau_nom_modification_dossier
            Start-Sleep -Seconds 1
            Write-Host "Opération réalisée avec succès. Félicitations."
            $eventLog = "Modification repertoire sur $clientName"
            eventLogTask
            Start-Sleep -Seconds 1
            Write-Host "Retour au menu précédent..."
            Start-Sleep -Seconds 1
            Menu_actions_ordinateur_client
        }
        Else {
            Write-Host "Le dossier $choix_modification_dossier n'existe pas et ne peut donc être modifié !"
            Write-Host "Retour au menu précédent..."
            Start-Sleep -Seconds 2
            Modification_de_repertoire
        }
    }


    While ($true) {
        #On demande à l'utilisateur ce qu'il souhaite faire : renommer un dossier existant ou revenir au menu précédent
        $choix_sous_menu_modification_dossier = Read-Host "Veuillez choisir :`n - Renommer un dossier (1)`n - Revenir au menu précédent (x)`n"

        #On renseigne le nom du dossier en question


        #On renseigne le chemin du dossier que l'on souhaite modifier 
        #On pose un SWITCH, 1 on rename, x on revient au menu précédent, commande invalide on reprend
        Switch ($choix_sous_menu_modification_dossier) {
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
}



#Fonction Quitter le sous-menu

function Quitter_le_sousmenu() {
    $choix_quitter_sous_menu = Read-Host "Êtes-vous sur(e) de vouloir revenir au menu précédent ? (o/n) "
    If ( $choix_quitter_sous_menu -eq "o" ) {
        Menu_principal_ps
    }
    Else {
        Menu_actions_ordinateur_client
    }
}

# Menu Consulations Logs
function menuLogMenu {
    # Listing des options
    Write-Host "MENU CONSULATIONS LOGS" -ForegroundColor Cyan
    Write-Host "Sélectionnez un choix parmi :" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "1 - Client Windows CLIWIN01"
    Write-Host "2 - Client Windows CLIWIN02"
    #    Write-Host "3 - Client Ubuntu CLILIN01"
    #    Write-Host "4 - Client Ubuntu CLILIN02"
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
        "2" {
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
        #        "3" {
        #            # Nom du Client prédéfini dans variable
        #            $clientName = "CLILIN01"
        #            Write-Host "`nVous avez sélectionné le Client $clientName`n"
        #            # Demande de confirmation du Client
        #            $clientValidate = Read-Host "`nConfirmez-vous vouloir faire une recherche pour le Client $clientName ? (O/n)"
        #            if ($clientValidate -eq "O") {
        #                # Si OK >> Continue
        #                # Vérification que le Client apparaît dans les Logs
        #                if (Get-Content -Path C:\Windows\System32\LogFiles\log_evt.log | Select-String -Pattern "$clientName") {
        #                    # Si OK >> Affichage des Logs
        #                    Write-Host "`nVous recherchez les Logs pour le Client $clientName`n" -ForegroundColor Cyan
        #                    Get-Content -Path C:\Windows\System32\LogFiles\log_evt.log | Select-String -Pattern "$clientName"
        #                    menuLogMenu
        #                }
        #                else {
        #                    # Sinon >> Retour au Menu
        #                    Write-Host "`nErreur : Le Client $clientName n'apparaît pas dans les Logs`n" -ForegroundColor Yellow
        #                    menuLogMenu
        #                }
        #            }
        #            else {
        #                # Sinon >> Retour au Menu
        #                notConfirmed
        #                menuLogMenu                
        #            }
        #        }
        #        "4" {
        #            # Nom du Client prédéfini dans variable
        #            $clientName = "CLILIN02"
        #            Write-Host "`nVous avez sélectionné le Client $clientName`n"
        #            # Demande de confirmation du Client
        #            $clientValidate = Read-Host "`nConfirmez-vous vouloir faire une recherche pour le Client $clientName ? (O/n)"
        #            if ($clientValidate -eq "O") {
        #                # Si OK >> Continue
        #                # Vérification que le Client apparaît dans les Logs
        #                if (Get-Content -Path C:\Windows\System32\LogFiles\log_evt.log | Select-String -Pattern "$clientName") {
        #                    # Si OK >> Affichage des Logs
        #                    Write-Host "`nVous recherchez les Logs pour le Client $clientName`n" -ForegroundColor Cyan
        #                    Get-Content -Path C:\Windows\System32\LogFiles\log_evt.log | Select-String -Pattern "$clientName"
        #                    menuLogMenu
        #                }
        #                else {
        #                    # Sinon >> Retour au Menu
        #                    Write-Host "`nErreur : Le Client $clientName n'apparaît pas dans les Logs`n" -ForegroundColor Yellow
        #                    menuLogMenu
        #                }
        #            }
        #            else {
        #                # Sinon >> Retour au Menu
        #                notConfirmed
        #                menuLogMenu                
        #            }
        #        }
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
    $infoLogPreview | Out-File -Append -FilePath C:\Users\Administrator\Documents\info_$eventTarget`_$(Get-Date -Format yyyyMMdd).txt
}

#Choix de la cible
#Clear-Host
#$ipAddress = Read-Host "Veuillez entrer l'adresse IP de la cible"
#Write-Host "Adresse IP saisie : $ipAddress" -ForegroundColor Green

#Menu_principal_ps

Clear-Host
# Début de la prise de Log
beginLogTask
Write-host "Bienvenue dans l'outil d'Administration" -ForegroundColor Cyan
$eventLog = "Démarrage du Menu Principal"
eventLogTask
# Démarrage du Menu Principal
menuMainMenu
