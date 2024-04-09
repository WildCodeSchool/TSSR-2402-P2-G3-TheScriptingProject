# Menu principal
#Fonction qui permettra de revenir sur le menu principal du script
function Menu_principal_ps
{
    $finished = $false

    while (-not $finished) 
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

    
        $choix_menu_actions_ordinateur_client = Read-Host "Faites votre choix et appuyez sur Entrée: "

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

        Write-Host "Opération annulée. Retour au menu précédent..."
        Start-Sleep -Seconds 2
        Menu_actions_ordinateur_client
}



#Fonction Desactivation du parefeu

function Desactivation_du_parefeu()
{

        Write-Host "Opération annulée. Retour au menu précédent..."
        Start-Sleep -Seconds 2
        Menu_actions_ordinateur_client
}



#Fonction Installer logiciel

function Installer_logiciel()
{

        Write-Host "Opération annulée. Retour au menu précédent..."
        Start-Sleep -Seconds 2
        Menu_actions_ordinateur_client
}



#Fonction Desinstaller logiciel

function Desinstaller_logiciel()
{

        Write-Host "Opération annulée. Retour au menu précédent..."
        Start-Sleep -Seconds 2
        Menu_actions_ordinateur_client
}



#Fonction Exécution de script

function Execution_de_script()
{
function helloWorld()
    {
        .\helloworld.ps1
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


}



#Fonction Suppression de répertoire

function Suppression_de_repertoire()
{


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



