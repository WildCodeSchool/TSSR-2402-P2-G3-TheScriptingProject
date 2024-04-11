# Menu principal
#Fonction qui permettra de revenir sur le menu principal du script
function Menu_principal_ps
{
    $finished = $false

    while ( -not $finished ) 
    {
        Write-Host "`nMenu action et information" -ForegroundColor Cyan
        Write-Host "1 - Action Utilisateur"
        Write-Host "2 - Information Utilisateur"
        Write-Host "3 - Action Ordinateur Client"
        Write-Host "4 - Info Ordinateur Client"
        Write-Host "5 - Pour quitter tapez x`n"

        $choix = Read-Host "Faites votre choix et appuyez Entrée"

        switch ($choix) 
        {
            "1" { fonction_menu_action_utilisateur }
            "2" { fonction_menu_info_utilisateur }
            "3" { Menu_actions_ordinateur_client }
            "4" { fonction_menu_info_ordinateur_client }
            "x" { $finished = $true }
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
    Write-Host
    $choix = Read-Host "Faites votre choix et appuyez Entrée:"

    switch ($choix) {
        "1" { Creation_compte_utilisateur_local }
        "2" { Changement_de_mot_de_passe }
        "3" { Suppression_de_compte }
        "4" { Desactivation_compte_utilisteur }
        "5" { Ajout_utilisateur_a_groupe }
        "6" { Supp_user_from_group }
        "7" { Write-Host "retour au menu principal"; Menu_principal_ps }
        default { Write-Host "Commande invalide" }
    }
}

# Création d'utilisateur 
Invoke-Command -ComputerName 172.16.10.20 -ScriptBlock { function Creation_compte_utilisateur_local {
    $answer = Read-Host "Voulez-vous creer un nouveau compte utilisateur local ? (o/n)"
    if ($answer -eq "o") {
        $createUser = Read-Host "Rentrez le nom de l'utilisateur a creer"
        # Vérification que l'utilisateur existe
        if (Get-LocalUser -Name $createUser -ErrorAction SilentlyContinue) {
            Write-Host "L'utilisateur $createUser existe deja."
        }
        # Si non création de l'utilisateur
        else {
            New-LocalUser $createUser 
            Write-Host "Le compte $createUser a ete cree avec succes."
        }
    }
    else {
        if ($answer -eq "n") {
            Write-Host "Operation annulee."
        }
    }
}
Creation_compte_utilisateur_local } -Credential wilder


# Suppresion d'utilisateur 
Invoke-Command -ComputerName 172.16.10.20 -ScriptBlock { function Suppression_de_compte {
    $answer = Read-Host "Voulez-vous supprimer un compte utilisateur local ? (o/n)"
    if ($answer -eq "o") {
        $delUser = Read-Host "Rentrez le nom de l'utilisateur a supprimer"
        # Vérification que l'utilisateur existe
        if (Get-LocalUser -Name $delUser -ErrorAction SilentlyContinue) {
            # Si oui suppression de l'utilisateur
            Remove-LocalUser $delUser 
            Write-Host "Le compte $delUser a ete supprime avec succes."
        }
    }
    else {
        if ($answer -eq "n") {
            Write-Host "Operation annulee."
    }
}
}
Suppression_de_compte } -Credential wilder

# Changement de mdp
Invoke-Command -ComputerName 172.16.10.20 -ScriptBlock { function Changement_de_mot_de_passe {
    $answer = Read-Host "Voulez-vous modifier le mot de passer d'un compte utilisateur local ? (o/n)"
    if ($answer -eq "o") {
        $modUser = Read-Host "Rentrez le nom de l'utilisateur"
        # Vérification que l'utilisateur existe
        if (Get-LocalUser -Name $modUser -ErrorAction SilentlyContinue) {
            # Si oui changement de mot de passe de l'utilisateur
            Set-LocalUser -Name $modUser -Password (ConvertTo-SecureString -AsPlainText -Force) 
            Write-Host "Le mot de passe de $modUser a ete modifie avec succes."
        }
    }
    else {
        if ($answer -eq "n") {
            Write-Host "Operation annulee."
    }
}
}
Changement_de_mot_de_passe } -Credential wilder

# Desactivation d'un compte
Invoke-Command -ComputerName 172.16.10.20 -ScriptBlock { function Desactivation_compte_utilisateur {
    $answer = Read-Host "Voulez-vous désactiver un compte utilisateur local ? (o/n)"
    if ($answer -eq "o") {
        $deacUser = Read-Host "Rentrez le nom de l'utilisateur"
        # Vérification que l'utilisateur existe
        if (Get-LocalUser -Name $deacUser -ErrorAction SilentlyContinue) {
            # Si oui suppression de l'utilisateur
            Disable-LocalUser toto -Confirm
            Write-Host "Le compte $deacUser a ete supprime avec succes."
        }
    }
    else {
        Write-Host "Retour au menu precedent."
    }
}
Desactivation_compte_utilisateur } -Credential wilder

# Ajout d'un utilisateur à un groupe local
Invoke-Command -ComputerName 172.16.10.20 -ScriptBlock { function Ajout_utilisateur_a_groupe {
    $answer = Read-Host "Voulez-vous ajouter un utilisateur local à un groupe ? (o/n)"
    if ($answer -eq "o") {
        $user = Read-Host "Rentrez le nom de l'utilisateur"
        $addGroup = Read-Host "Rentrer le nom du groupe"
        # Vérification que l'utilisateur existe
        if (Get-LocalUser -Name $user -ErrorAction SilentlyContinue) {
            # Si oui suppression de l'utilisateur
            Add-LocalGroupMember $addGroup -Member $user -Confirm
            Write-Host "L'utilsateur $user a ete ajoute au groupe $addGroup avec succes."
        }
    }
    else {
        if ($answer -eq "n") {
            Write-Host "Operation annulee."
            }
    }
}
Ajout_utilisateur_a_groupe } -Credential wilder

# Suppression d'un utilisateur d'un groupe local
Invoke-Command -ComputerName 172.16.10.20 -ScriptBlock { function Supp_user_from_group {
    $answer = Read-Host "Voulez-vous retirer un utilisateur local à un groupe ? (o/n)"
    if ($answer -eq "o") {
        $user = Read-Host "Rentrez le nom de l'utilisateur"
        $delGroup = Read-Host "Rentrer le nom du groupe"
        # Vérification que l'utilisateur existe
        if (Get-LocalUser -Name $user -ErrorAction SilentlyContinue) {
            # Si oui suppression de l'utilisateur
            Remove-LocalGroupMember $delGroup -Member $user -Confirm
            Write-Host "L'utilsateur $user a ete retire au groupe $delGroup avec succes."
        }
    }
    else {
        if ($answer -eq "n") {
            Write-Host "Operation annulee."
            }
    }
}
Supp_user_from_group } -Credential wilder

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
        "11" { Write-Host "Retour au menu principal"; Menu_principal_ps }
        default { Write-Host "Commande invalide" }
    }
}

# 1 Version de l'OS

function Version_de_l_OS {
    Clear-Host
    Write-Host "Version de l'OS :"
    Invoke-Command -ComputerName $ipAddress -ScriptBlock { $osVersion = (Get-WmiObject -Class Win32_OperatingSystem).Caption
        Write-Host "Version de l'OS : $osVersion"
    }
    fonction_menu_info_ordinateur_client
}

# 2 Nombre de disques

function Nombre_de_disques {
    Clear-Host
    Write-Host "Nombre de disques installés :"
    Invoke-Command -ComputerName $ipAddress -ScriptBlock { $numberOfDisks = (Get-CimInstance -ClassName Win32_DiskDrive).Count
        Write-Host "Nombre de disques installés : $numberOfDisks"
    }
    fonction_menu_info_ordinateur_client
}

# 3 Infos sur les partitions
function Info_partitions {
    Clear-Host
    Write-Host "Infos sur les partitions :"
    Invoke-Command -ComputerName $ipAddress -ScriptBlock { Get-WmiObject -Class Win32_DiskPartition | Select-Object DeviceID, Name, Size, Type
    }
    fonction_menu_info_ordinateur_client
}

# 4 Liste des applications installées = a revoir description et commande
function Liste_des_appli_installées {
    Clear-Host
    Write-Host "Liste des paquets installés :"
    Invoke-Command -ComputerName $ipAddress -ScriptBlock { Get-WmiObject -Class Win32_Product | Select-Object -Property Name
    }
    fonction_menu_info_ordinateur_client
}

# 5 Liste des services en cours d'utilisation
function Liste_des_services_en_cours_d_utilisation {
    Clear-Host
    Write-Host "Liste des services en cours d'utilisation :"
    Invoke-Command -ComputerName $ipAddress -ScriptBlock { Get-Service | Where-Object { $_.Status -eq 'Running' }
    }
    fonction_menu_info_ordinateur_client
}

# 6 Liste des utilisateurs locaux
function Liste_des_utilisateurs_locaux {
    Clear-Host
    Write-Host "Liste des utilisateurs locaux :"
    Invoke-Command -ComputerName $ipAddress -ScriptBlock { Get-LocalUser | Select-Object Name
    }
    fonction_menu_info_ordinateur_client
}

# 7 Infos sur le CPU
function Infos_sur_le_CPU {
    Clear-Host
    Write-Host "Infos sur le CPU :"
    Invoke-Command -ComputerName $ipAddress -ScriptBlock { Get-WmiObject Win32_Processor | Select-Object Name, Manufacturer, MaxClockSpeed, NumberOfCores, NumberOfLogicalProcessors
    }
    
    fonction_menu_info_ordinateur_client
}

# 8 Mémoire RAM totale et utilisation
function Memoire_RAM_totale {
    Clear-Host
    Write-Host "RAM totale et utilisation :"
    Invoke-Command -ComputerName $ipAddress -ScriptBlock { Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object TotalVisibleMemorySize, FreePhysicalMemory
    }
    fonction_menu_info_ordinateur_client
}

# 9 Utilisation du disque
function Utilisation_du_disque {
    Clear-Host
    Write-Host "Utilisation du disque :"
    Invoke-Command -ComputerName $ipAddress -ScriptBlock { Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'" | Select-Object -Property FreeSpace, Size
    }
    fonction_menu_info_ordinateur_client
}

# 10 Utilisation du processeur
function Utilisation_du_processeur {
    Clear-Host
    Write-Host "Utilisation du processeur :"
    Invoke-Command -ComputerName $ipAddress -ScriptBlock { Get-Counter '\Processor(_Total)\% Processor Time'
    }
    fonction_menu_info_ordinateur_client
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
        "8" { Write-Host "Retour au menu principal"; Menu_principal_ps }
        default { Write-Host "Commande invalide" }
    }
}

#1 Date de dernières connexion d'un utilisateur
function Derniere_connection_utilisateur {
    $UserName = Read-Host "Rentrez un nom d'utilisateur "
    Invoke-Command -ComputerName $ipAddress -ScriptBlock { Get-WinEvent -LogName Security | Where-Object {$_.ID -eq 4624} | Select-Object -Property TimeCreated, @{Name='UserName';Expression={$_.Properties[5].Value}} -First 1
    }
}
#2 Date de dernière modification du mode de passe
function Derniere_modification_mdp {
    Read-Host "Rentrez un nom d'utilisateur "
    Invoke-Command -ComputerName $ipAddress -ScriptBlock { Get-LocalUser | Select-Object Name, LastPasswordChangeTimestamp 
    }
}

#3 Liste des sessions ouvertes par l'utilisateur
function Liste_sessions_ouverte_par_utilisateur {
    Read-Host "Rentrez un nom d'utilisateur "
    Invoke-Command -ComputerName $ipAddress -ScriptBlock { Get-WmiObject -Class Win32_ComputerSystem | Select-Object UserName
    }
}

#4 Groupe d’appartenance d’un utilisateur
function Groupe_utilisateur {
    $UserName = Read-Host "Rentrez un nom d'utilisateur "
    Invoke-Command -ComputerName $ipAddress -ScriptBlock { Get-LocalGroup -Member $UserName
    }
}
#5 Historique des commandes exécutées par l'utilisateur
function Historique_utilisateur {
    $ = Read-Host "Rentrez un nom d'utilisateur "
    
}

#6 Droits et permissions de l’utilisateur sur un dossier
function Droit_sur_un_dossier {
    $dossier = Read-Host "Saisissez le chemin du dossier"
    Invoke-Command -ComputerName $ipAddress -ScriptBlock {
    param($dossier, $UserName)
    Get-Acl -Path $dossier | 
    Select-Object -ExpandProperty Access | 
    Where-Object { $_.IdentityReference -match $UserName }
} -ArgumentList $dossier, $UserName


}

#7 Droits/permissions de l’utilisateur sur un fichier
function Droit_sur_un_fichier {
    $fichier = Read-Host "Saisissez le chemin du fichier"
    Get-Acl -Path $fichier | Select-Object -ExpandProperty Access | Where-Object { $_.IdentityReference -match $UserName 
    }

}
#Menu actions ordinateur client
#Développement de la fonction qui permettra de revenir au menu des actions sur l'ordi client

function Menu_actions_ordinateur_client()
{

    while ( $true )
    {

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

    
        $choix_menu_actions_ordinateur_client = Read-Host "Faites votre choix et appuyez sur Entrée "

        switch ($choix_menu_actions_ordinateur_client)
        {
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
            "x" { Quitter_le_sousmenu }
            default { Write-Host "Commande invalide. Retour au menu principal..."; Start-Sleep -Seconds 2; Menu_principal_ps }

        }
    }

}



#Fonction Arrêt

function Arret()
{
    #On demande à l'utilisateur s'il confirme sa volonté d'éteindre le poste distant
    $choix_arret_ordi_client = Read-Host "Êtes-vous sur(e) de vouloir procéder à l'arrêt du poste client distant ? (o/n) "
    #On pose la condition Si, et soit on confirme l'extinction, soit on revient au menu précédent
    If ( $choix_arret_ordi_client -eq "o" )
    {
        Stop-Computer #-ComputerName 
    }
    Else
    {
        Write-Host "Opération annulée. Retour au menu précédent..."
        Start-Sleep -Seconds 2
        Menu_actions_ordinateur_client
    }
}



#Fonction Redémarrage

function Redemarrage()
{
    #On demande à l'utilisateur s'il confirme sa volonté de redémarrer
    $choix_redemerrage_ordi_client = Read-Host "Êtes-vous sur(e) de vouloir procéder au redémarrage du poste client distant ? (o/n) "
    #On pose la condition Si, soit on redémarre, soit on revient au menu précédent
    If ( $choix_redemerrage_ordi_client -eq "o" )
    {
        Restart-Computer #-ComputerName 
    }
    Else
    {
        Write-Host "Opération annulée. Retour au menu précédent..."
        Start-Sleep -Seconds 2
        Menu_actions_ordinateur_client
    }

}



#Fonction Verrouillage 

function Verrouillage()
{
    #On demande à l'utilisateur s'il confirme sa volonté de redémarrer l'ordinateur client
    $choix_verrouillage_ordi_client = Read-Host "Êtes-vous sur(e) de vouloir procéder au verrouillage de la session en cours sur le poste client distant ? (o/n) "
    #On pose la condition Si, soit on verrouille, soit on renvoie au menu précédent
    If ( $choix_verrouillage_ordi_client -eq "o" )
    {
        shutdown.exe -l 
    }
    Else
    {
        Write-Host "Opération annulée. Retour au menu précédent..."
        Start-Sleep -Seconds 2
        Menu_actions_ordinateur_client
    }
}



#Fonction Mise à jour système

function Mise_a_jour_systeme()
{
    #On demande à l'utilisateur s'il souhaite procéder aux maj
    $choix_mises_a_jour_systeme = Read-Host "Êtes-vous sur(e) de vouloir procéder aux mises à jour du système ? (o/n) "
    #On pose la condition If, soit oui et go, soit non et retour menu précédent
    If ( $choix_mises_a_jour_systeme -eq "o" )
    {
        Write-Host "Recherche des mises à jour disponibles..."
        #Au préalable : 
        #Install-Module -Name PSWindowsUpdate -RequiredVersion 2.2.0.3
        #Ensuite : Set-ExecutionPolicy Unrestricted > oui pour tout (pour l'exécution des scripts)
        $resultat_mises_a_jour = $(Get-WindowsUpdate)
        #On demande à l'utilisateur s'il veut continuer après l'affichage des éventuelles maj SI il y en a :
        If ( $resultat_mises_a_jour.Count -gt 0 )
        {
            $resultat_mises_a_jour
            $choix_mises_a_jour_systeme2 = Read-Host "Des mises à jour sont disponibles. Voulez-vous les installer ? (o/n) "
                # Vérifie la réponse de l'utilisateur
                If ($choix_mises_a_jour_systeme2 -eq "o") 
                {
                    # Installe les mises à jour
                    Install-WindowsUpdate -AcceptAll
                } 
                Else 
                {
                    Write-Host "Les mises à jour ne seront pas installées."
                    Start-Sleep -Seconds 1
                }
        }
        Else
        {
            Write-Host "Aucune mise à jour disponible."
            Start-Sleep -Seconds 1
        }
    }
    Else
    {
        Write-Host "Opération annulée. Retour au menu précédent..."
        Start-Sleep -Seconds 2
        Menu_actions_ordinateur_client
    }
}



#Fonction Prise en main à distance

function Prise_en_main_a_distance()
{
    #Confirmation
    $choix_prise_en_main_a_distance = Read-Host "Voulez-vous prendre la main à distance sur la machine ? (o/n) "
    #On pose la condition SI, soit on y va, soit on revient au menu précédent
    If ( $choix_prise_en_main_a_distance -eq "o" )
    {
        #Etapes préliminaires, voir PowerShell - à distance
        Enter-PSSession -ComputerName $ipadresse -Credential $(Get-Credential)
    }
    Else
    {
        Write-Host "Opération annulée. Retour au menu précédent..."
        Start-Sleep -Seconds 2
        Menu_actions_ordinateur_client
    }
}



#Fonction définition des règles de parefeu

function Definition_des_regles_de_parefeu()
{
    Write-Host "Etat des règles de pare-feu :"
    Get-NetFirewallProfile
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
}



#Fonction Activation du parefeu

function Activation_du_parefeu()
{
    #Boucle WHILE pour continuer tant qu'on n'a pas une "bonne" réponse
    While ($true)
    {
        #On offre à l'utilisateur la possibilité de choisir sur quel profil il souhaite agir
        #il pourra choisir une combinaison au besoin
        #On pose un SWITCH avec toutes les possibilités
        $choix_activation_parefeu = Read-Host "Indiquer le ou les profils sur que vous souhaitez activer:`n - Domain (1)`n - Private (2)`n - Public (3)`n - Tous (4)`n - Revenir au menu précédent (q)`n"
        Switch ($choix_activation_parefeu)
        {
            "1" {Set-NetFirewallProfile -Profile Domain -Enabled True; Write-Host "Pare-feu activé pour le profil Domain"; Start-Sleep -Seconds 2; Activation_du_parefeu}
            "2" {Set-NetFirewallProfile -Profile Private -Enabled True; Write-Host "Pare-feu activé pour le profil Private"; Start-Sleep -Seconds 2; Activation_du_parefeu}
            "3" {Set-NetFirewallProfile -Profile Public -Enabled True; Write-Host "Pare-feu activé pour le profil Public"; Start-Sleep -Seconds 2; Activation_du_parefeu}
            "1,2" {Set-NetFirewallProfile -Profile Domain,Private -Enabled True; Write-Host "Pare-feu activé pour les profils Domain et Private"; Start-Sleep -Seconds 2; Activation_du_parefeu}
            "2,3" {Set-NetFirewallProfile -Profile Private,Public -Enabled True; Write-Host "Pare-feu activé pour les profils Public et Private"; Start-Sleep -Seconds 2; Activation_du_parefeu}
            "1,3" {Set-NetFirewallProfile -Profile Domain,Public -Enabled True; Write-Host "Pare-feu activé pour les profils Domain et Public"; Start-Sleep -Seconds 2; Activation_du_parefeu}
            "4" {Set-NetFirewallProfile -Profile Domain,Private,Public -Enabled True; Write-Host "Pare-feu activé pour tous les profils"; Start-Sleep -Seconds 2; Activation_du_parefeu}
            default {Write-Host "Commande invalide. Veuillez ressaisir"; Activation_du_parefeu}
        }
    }
}



#Fonction Desactivation du parefeu

function Desactivation_du_parefeu()
{
    #Boucle WHILE pour continuer tant qu'on n'a pas une "bonne" réponse
    While ($true)
    {
        #On offre à l'utilisateur la possibilité de choisir sur quel profil il souhaite agir
        #il pourra choisir une combinaison au besoin
        #On pose un SWITCH avec toutes les possibilités
        $choix_desactivation_parefeu = Read-Host "Indiquer le ou les profils sur que vous souhaitez désactiver:`n - Domain (1)`n - Private (2)`n - Public (3)`n - Tous (4)`n - Revenir au menu précédent (q)`n"
        Switch ($choix_desactivation_parefeu)
        {
            "1" {Set-NetFirewallProfile -Profile Domain -Enabled false; Write-Host "Pare-feu désactivé pour le profil Domain"; Start-Sleep -Seconds 2; Desactivation_du_parefeu}
            "2" {Set-NetFirewallProfile -Profile Private -Enabled false; Write-Host "Pare-feu désactivé pour le profil Private"; Start-Sleep -Seconds 2; Desactivation_du_parefeu}
            "3" {Set-NetFirewallProfile -Profile Public -Enabled false; Write-Host "Pare-feu désactivé pour le profil Public"; Start-Sleep -Seconds 2; Desactivation_du_parefeu}
            "1,2" {Set-NetFirewallProfile -Profile Domain,Private -Enabled false; Write-Host "Pare-feu désactivé pour les profils Domain et Private"; Start-Sleep -Seconds 2; Desactivation_du_parefeu}
            "2,3" {Set-NetFirewallProfile -Profile Private,Public -Enabled false; Write-Host "Pare-feu désactivé pour les profils Public et Private"; Start-Sleep -Seconds 2; Desactivation_du_parefeu}
            "1,3" {Set-NetFirewallProfile -Profile Domain,Public -Enabled false; Write-Host "Pare-feu désactivé pour les profils Domain et Public"; Start-Sleep -Seconds 2; Desactivation_du_parefeu}
            "4" {Set-NetFirewallProfile -Profile Domain,Private,Public -Enabled false; Write-Host "Pare-feu désactivé pour tous les profils"; Start-Sleep -Seconds 2; Desactivation_du_parefeu}
            default {Write-Host "Commande invalide. Veuillez ressaisir"; Desactivation_du_parefeu}
        }
    }
}



#Fonction Installer logiciel

function Installer_logiciel()
{
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
                    # Avec la variable au-dessus, on vérifie si le logiciel donné fait déjà partie des logiciels installés
                    # On pose la condition SI, soit on va vers l'install, soit on dit qu'il est déjà installé et on ressaisit 
                    $logiciel_deja_install = choco list --local-only | Select-String -Pattern $choix_logiciel_install_via_chocolatey
                    If ($logiciel_deja_install)
                    {
                        Write-Host "Le logiciel $choix_logiciel_install_via_chocolatey est déjà installé."
                        #On renvoie au début de la fonction
                        Installer_logiciel
                    }
                    Else
                    {
                        Write-Host "Installation en cours..."
                        choco install $choix_logiciel_install_via_chocolatey -y
                        Write-Host "Retour au menu précédent..."
                        # Retourner au menu précédent
                        Menu_actions_ordinateur_client
                    }           
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
}



#Fonction Desinstaller logiciel

function Desinstaller_logiciel()
{
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
                    #On va vérifier l'existence de ce logiciel dans choco
                    #Condition SI, soit on l'a et on le désinstalle, soit non et on demande de taper autre chose
                    $verif_logiciel_pour_desinstallation = choco list --local-only | Select-String -Pattern $logiciel_pour_desinstallation
                    
                        If ($logiciel_pour_desinstallation)
                        {
                            Write-Host "Désinstallation en cours..."
                            choco uninstall $logiciel_pour_desinstallation
                            Write-Host "Retour au menu précédent..."
                            Menu_actions_ordinateur_client
                        }
                        Else
                        {
                            Write-Host "Aucun logiciel portant le nom de $logiciel_pour_desinstallation n'a été trouvé sur cette machine."
                            Desinstaller_logiciel
                        }
                }

            "x" 
                {Menu_actions_ordinateur_client}

            default 
                {Write-Host "Commande invalide, veuillez ressaisir :"}
        }
    }
}




#Fonction Exécution de script

function Execution_de_script()
{
function scriptDansScript()
    {
        .\scriptDansScriptFonctionExec.ps1
    }
        While ( $true )
        { 
            $choix_script_executer = Read-Host "Voici la liste des scripts exécutables :`n - helloWorld (1)`n`nRetour au menu précédent (x)`nVeuillez saisir le chiffre correspondant au script que vous voulez exécuter :`n"
            switch ( $choix_script_executer )
            {
                "1" {helloWorld}
                "x" {Menu_actions_ordinateur_client}
                default { Write-Host "Commande invalide. Veuiller ressaisir :" }
            }
        }
}


#Fonction Creation de répertoire

function Creation_de_repertoire()
{
    #On demande à l'utilisateur le nom qu'il compte donner à son nouveau dossier
    $choix_nom_creation_dossier = Read-Host "Veuillez saisir le nom du dossier que vous souhaitez créer"
    #on vérifie son existence dans le répertoire courant avec traitement d'erreur ?
    #On pose la condition SI, soit il n'existe pas et on le crée, soit il existe et on invite à donner un autre nom
    If ( -not (Test-Path $choix_nom_creation_dossier))
    {
        $chemin_creation_dossier = $PWD.Path
        New-Item -Path $chemin_creation_dossier -ItemType Directory -Name $choix_nom_creation_dossier
        #On confirme sa création
        Write-Host "Le dossier $choix_nom_creation_dossier a bien été crée dans $PWD. Félicitations."
        Start-Sleep -Seconds 1
        Write-Host "Retour au menu précédent..."
        Start-Sleep -Seconds 1
        Menu_actions_ordinateur_client
    }
    Else
    {
        Write-Host "Le dossier $choix_nom_creation_dossier existe déjà."
        #Retour au menu précédent
        Write-Host "Retour au menu précédent..."
        Start-Sleep -Seconds 2
        Menu_actions_ordinateur_client
    }
}



#Fonction Suppression de répertoire

function Suppression_de_repertoire()
{
    #On demande à l'utilisateur le nom du répertoire qu'il souhaite supprimer
    #On vérifie son existence dans le répertoire courant 
    #On pose la condition SI, soit il existe et on le supprime, soit non et on revient au menu précédent
    $choix_dossier_suppression = Read-Host "Veuillez indiquer le nom du dossier que vous souhaitez supprimer (ATTENTION : vous perdrez en même temps ce qui se trouve dans ce dossier)"
    If (Test-Path $choix_dossier_suppression)
    {
        Write-Host "Suppression du dossier $choix_dossier_suppression en cours..."
        Start-Sleep -Seconds 1
        Remove-Item -Path $choix_dossier_suppression -Recurse -Force
        Write-Host "Le dossier $choix_dossier_suppression a été supprimé avec succès. Félicitations."
        Start-Sleep -Seconds 1
        Write-Host "Retour au menu précédent..."
        Start-Sleep -Seconds 1
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



#Fonction Modification de répertoire

function Modification_de_repertoire()
{


}



#Fonction Quitter le sous-menu

function Quitter_le_sousmenu()
{
    $choix_quitter_sous_menu = Read-Host "Êtes-vous sur(e) de vouloir revenir au menu précédent ? (o/n) "
    If ( $choix_quitter_sous_menu -eq "o" )
    {
        Menu_principal_ps
    }
    Else
    {
        Menu_actions_ordinateur_client
    }
}

#Choix de la cible
Clear-Host
$ipAddress = Read-Host "Veuillez entrer l'adresse IP de la cible"
Write-Host "Adresse IP saisie : $ipAddress" -ForegroundColor Green

Menu_principal_ps
