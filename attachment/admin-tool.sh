#!/bin/bash

clear

##########FONCTIONS_MENUS##########

# Menu Principal (Main Menu)
function menu-main-menu() {
    # Choix Menu principal : Connexion Client / Logs / Quit
    echo -e "\n\e[1;96mMENU PRINCIPAL\e[0m\n\e[96mSélectionnez une option parmi :\e[0m\n"
    echo -e "A - Connexion Client Ubuntu CLILIN01\nB - Connexion Client Ubuntu CLILIN02"
#    echo -e "C - Connexion Client Windows CLIWIN01\nD - Connexion Client Windows CLIWIN02"
    echo -e "L - Consultation des Logs\nx - Quitter l'outil d'Administration\n"
    # Enregistrement du choix du du Menu principal
    read -p "Votre choix de Client : " targetMainMenu

    case $targetMainMenu in
    A)
        clientName="CLILIN01"
        echo -e "\n\e[94mVous avez choisi le Client $clientName\e[0m\n"
        # Demande de confirmation du Client
        read -p "Confirmez-vous choisir le Client $clientName ? (O/n) " clientValidate
        if [ $clientValidate = "O" ]; then
            # Si OK >> Continue
            # Variables pour anticiper la connexion ssh
            clientIP="172.16.10.30" && sshCommand="ssh wilder@$clientIP"
            echo -e "\n\e[94mL'IP de $clientName est $clientIP\e[0m\n"
            # Prise de Log en lien avec Navigation Menu + Bascule vers Menu Action/Information
            eventLog="Redirection vers Menu Action Information"
            log-event-server
            menu-action-info-menu
        else
            # Sinon >> Retour au Menu principal
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU PRINCIPAL\e[0m"
            menu-main-menu
        fi
        ;;
    B)
        clientName="CLILIN02"
        echo -e "\n\e[94mVous avez choisi le Client $clientName\e[0m\n"
        # Demande de confirmation du Client
        read -p "Confirmez-vous choisir le Client $clientName ? (O/n) " clientValidate
        if [ $clientValidate = "O" ]; then
            # Si OK >> Continue
            # Variables pour anticiper la connexion ssh
            clientIP="172.16.10.31" && sshCommand="ssh wilder@$clientIP"
            echo -e "\n\e[94mL'IP de $clientName est $clientIP\e[0m\n"
            # Prise de Log en lien avec Navigation Menu + Bascule vers Menu Action/Information
            eventLog="Redirection vers Menu Action Information"
            log-event-server
            menu-action-info-menu
        else
            # Sinon >> Retour au Menu principal
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU PRINCIPAL\e[0m"
            menu-main-menu
        fi
        ;;
#    C)
#        clientName="CLIWIN01"
#        echo -e "\n\e[94mVous avez choisi le Client $clientName\e[0m\n"
#        # Demande de confirmation du Client
#        read -p "Confirmez-vous choisir le Client $clientName ? (O/n) " clientValidate
#        if [ $clientValidate = "O" ]; then
#            # Si OK >> Continue
#            # Variables pour anticiper la connexion ssh
#            clientIP="172.16.10.20" && sshCommand="ssh wilder@$clientIP"
#            echo -e "\n\e[94mL'IP de $clientName est $clientIP\e[0m\n"
#            # Prise de Log en lien avec Navigation Menu + Bascule vers Menu Action/Information
#            eventLog="Redirection vers Menu Action Information"
#            log-event-server
#            menu-action-info-menu
#        else
#            # Sinon >> Retour au Menu principal
#            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU PRINCIPAL\e[0m"
#            menu-main-menu
#        fi
#        ;;
#    D)
#        clientName="CLIWIN02"
#        echo -e "\n\e[94mVous avez choisi le Client $clientName\e[0m\n"
#        # Demande de confirmation du Client
#        read -p "Confirmez-vous choisir le Client $clientName ? (O/n) " clientValidate
#        if [ $clientValidate = "O" ]; then
#            # Si OK >> Continue
#            # Variables pour anticiper la connexion ssh
#            clientIP="172.16.10.21" && sshCommand="ssh wilder@$clientIP"
#            echo -e "\n\e[94mL'IP de $clientName est $clientIP\e[0m\n"
#            # Prise de Log en lien avec Navigation Menu + Bascule vers Menu Action/Information
#            eventLog="Redirection vers Menu Action Information"
#            log-event-server
#            menu-action-info-menu
#        else
#            # Sinon >> Retour au Menu principal
#            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU PRINCIPAL\e[0m"
#            menu-main-menu
#        fi
#        ;;
    L)
        echo -e "\n\e[94mVous avez opté pour une Consultation des Logs\e[0m\n"
        # Prise de Log en lien avec Navigation Menu
        eventLog="Redirection vers Menu Consultation Logs"
        log-event-server
        # Redirection vers le Menu Consulation Logs
        menu-log-menu
        ;;
    x)
        # Quitter le script + Fin de la prise de log
        log-end-server
        exit 0
        ;;
    *)
        # Le choix ne correspond pas aux options proposées + retour au menu en cours
        echo -e "\n\e[33mErreur : Cette option n'est pas disponible. Veuillez recommencer.\e[0m"
        menu-main-menu
        ;;
    esac
}

# Menu Action/Information
function menu-action-info-menu() {
    # Choix Menu Action/Information : Action User / Action Client / Info User / Info Client / Main Menu / Quit
    echo -e "\n\e[1;96mMENU ACTION/INFORMATION\e[0m\n\e[96mSélectionnez une option parmi :\e[0m\n"
    echo -e "1 - Action sur un Utilisateur\n2 - Action sur un Client"
    echo -e "3 - Information sur un Utilisateur\n4 - Information sur un Client"
    echo -e "M - Retour au Menu Principal\nx - Quitter l'outil d'Administration"
    echo -e "\n\e[94mVous êtes actuellement en connexion avec le Client $clientName\e[0m\n"
    # Enregistrement du choix du du Menu Action/Information
    read -p "Votre choix : " targetActionInfoMenu

    case $targetActionInfoMenu in
    1)
        echo -e "\n\e[94mVous avez opté pour un Action Utilisateur sur le Client $clientName\e[0m"
        # Prise de Log en lien avec Navigation Menu + Bascule vers Menu Action Utilisateur
        eventLog="Redirection vers Menu Action Utilisateur"
        log-event-server
        menu-action-user
        ;;
    2)
        echo -e "\n\e[94mVous avez opté pour un Action Client sur $clientName\e[0m"
        # Prise de Log en lien avec Navigation Menu + Bascule vers Menu Action Client
        eventLog="Redirection vers Menu Action Client"
        log-event-server
        menu-action-client
        ;;
    3)
        echo -e "\n\e[94mVous avez opté pour un Information Utilisateur sur $clientName\e[0m"
        # Prise de Log en lien avec Navigation Menu + Bascule vers Menu Information Utilisateur
        eventLog="Redirection vers Menu Information Utilisateur"
        log-event-server
        menu-info-user
        ;;
    4)
        echo -e "\n\e[94mVous avez opté pour un Information Client sur $clientName\e[0m"
        # Prise de Log en lien avec Navigation Menu + Bascule vers Menu Information Client
        eventLog="Redirection vers Menu Information Client"
        log-event-server
        menu-info-client
        ;;
    M)
        # Prise de Log en lien avec Navigation Menu + Bascule vers Menu Principal
        eventLog="Redirection vers Menu Principal"
        log-event-server
        menu-main-menu
        ;;
    x)
        # Quitter le script + Fin de la prise de log
        log-end-server
        exit 0
        ;;
    *)
        # Le choix ne correspond pas aux options proposées + retour au menu en cours
        echo -e "\n\e[33mErreur : Cette option n'est pas disponible. Veuillez recommencer.\e[0m"
        menu-action-info-menu
        ;;
    esac
}

# Menu Action Utilisateur
function menu-action-user() {
    # Choix Menu Action Utilisateur : Create Account / Change Password / Delete Account / Disable Account / Add to Group / Extract from Group / Action/Info Menu / Main Menu / Quit
    echo -e "\n\e[1;96mMENU ACTION UTILISATEUR\e[0m\n\e[96mSélectionnez une option parmi :\e[0m\n"
    echo -e "1 - Création de compte Utilisateur local\n2 - Changement de mot de passe d'un Utilisateur"
    echo -e "3 - Suppression d'un compte Utilisateur local\n4 - Désactivation d'un compte Utilisateur local"
    echo -e "5 - Ajout d'un Utilisateur à un Groupe local\n6 - Sortie d'un Utilisateur d'un Groupe local"
    echo -e "R - Retour au Menu Action/Information\nM - Retour au Menu Principal\nx - Quitter l'outil d'Administration"
    echo -e "\n\e[94mVous êtes actuellement en connexion avec le Client $clientName\e[0m\n"
    # Enregistrement du choix du du Menu Action Utilisateur
    read -p "Votre choix : " targetActionUserMenu
    case $targetActionUserMenu in
    1)
        echo -e "\n\e[94mVous souhaitez créer un compte Utilisateur sur le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            echo ""
            read -p "Merci de renseigner un nom d'Utilisateur à créer : " userName
            echo ""
            read -p "Confirmez-vous vouloir créer le compte $userName ? (O/n) " userValidate
            echo ""
            if [ $userValidate = "O" ]; then
                # Si OK >> Continue
                # Vérification si le compte existe déjà
                if $sshCommand cat /etc/passwd | grep $userName > /dev/null; then
                    # le compte existe >> Retour au menu
                    echo -e "\n\e[33mErreur : Utilisateur $userName existe déjà - Retour au MENU ACTION UTILISATEUR\e[0m\n"
                    menu-action-user
                else
                    #le compte n'existe pas
                    dataCommand="sudo -S adduser $userName"
                    $sshCommand $dataCommand
                    #verification création du compte
                    if $sshCommand cat /etc/passwd | grep $userName > /dev/null; then
                        #le compte $userName existe donc compte existant OK
                        echo -e "\n\e[94mUtilisateur $userName créé avec succés\e[0m\n"
                        eventLog="Création du compte $userName sur $clientName"
                        log-event-server
                        menu-action-user
                    else
                        #le compte $userName n'existe pas ==> message erreur"
                        echo -e "\n\e[94mUtilisateur $userName créé avec succés\e[0m\n"
                        menu-action-user
                    fi
                fi
            else
                # Sinon >> Retour au Menu Action Utilisateur
                echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU ACTION UTILISATEUR\e[0m"
                menu-action-user
            fi
        else
            # Sinon >> Retour au Menu Action Utilisateur
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU ACTION UTILISATEUR\e[0m"
            menu-action-user
        fi
        ;;
    2)
        echo -e "\n\e[94mVous souhaitez changer le mot de passe d'Utilisateur sur le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        echo ""
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            read -p "Merci de renseigner un nom d'Utilisateur pour lequel vous souhaitez changer le mot de passe : " userName
            echo ""
            read -p "Confirmez-vous la modification de mot de passe de $userName ? (O/n) " userValidate
            echo ""
            if [ $userValidate = "O" ]; then
                #Si OK >> Continue
                # Vérification si le compte existe
                if $sshCommand cat /etc/passwd | grep $userName > /dev/null; then
                    # si OK >> Continue
                    dataCommand="sudo -S passwd $userName"
                    $sshCommand $dataCommand
                    echo -e "\n\e[94mLe mot de passe de $userName a été modifié avec succés\e[0m\n"
                    eventLog="Modification Mot de Passe de $userName sur $clientName"
                    log-event-server
                    menu-action-user
                else
                    # Sinon
                    echo -e "\n\e[33mErreur : Utilisateur $userName n'existe pas - Retour au MENU ACTION UTILISATEUR\e[0m\n"
                    menu-action-user
                fi
            else
                # Sinon >> Retour au Menu Action Utilisateur
                echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU ACTION UTILISATEUR\e[0m"
                menu-action-user
            fi
        else
            # Sinon >> Retour au Menu Action Utilisateur
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU ACTION UTILISATEUR\e[0m"
            menu-action-user
        fi
        ;;
    3)
        echo -e "\n\e[94mVous souhaitez supprimer un compte Utilisateur sur le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            echo ""
            read -p "Merci de renseigner un nom d'Utilisateur à supprimer : " userName
            echo ""
            read -p "Confirmez-vous vouloir supprimer le compte $userName ? (O/n) " userValidate
            echo ""
            if [ $userValidate = "O" ]; then
                # Si OK >> Continue
                # Vérification si le compte existe déjà
                if $sshCommand cat /etc/passwd | grep $userName > /dev/null; then
                    # Si le compte existe
                    dataCommand="sudo -S userdel -r -f $userName"
                    $sshCommand $dataCommand
                    if cat /etc/passwd | grep $userName > /dev/null; then
                        # Si le compte existe toujours
                        echo -e "\n\e[33mErreur : Utilisateur $userName existe toujours - Retour au MENU ACTION UTILISATEUR\e[0m\n"
                        menu-action-user
                    else
                        # Si le compte n'existe plus
                        echo -e "\n\e[94mLe compte $userName a été supprimé avec succés\e[0m\n"
                        eventLog="Suppression du compte $userName sur $clientName"
                        log-event-server
                        menu-action-user
                    fi
                else
                    # Si le compte n'existe pas
                    echo -e "\n\e[33mErreur : Utilisateur $userName n'existe pas - retour au MENU ACTION UTILISATEUR\e[0m\n"
                    menu-action-user
                fi
            else
                # Sinon >> Retour au Menu Action Utilisateur
                echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU ACTION UTILISATEUR\e[0m"
                menu-action-user
            fi
        else
            # Sinon >> Retour au Menu Action Utilisateur
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU ACTION UTILISATEUR\e[0m"
            menu-action-user
        fi
        ;;
    4)
        echo -e "\n\e[94mVous souhaitez désactiver un compte Utilisateur sur le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            echo ""
            read -p "Merci de renseigner un nom d'Utilisateur à désactiver : " userName
            echo ""
            read -p "Confirmez-vous vouloir désactiver le compte $userName ? (O/n) " userValidate
            echo ""
            if [ $userValidate = "O" ]; then
                # Si OK >> Continue
                # Vérification si le compte existe déjà
                if $sshCommand cat /etc/passwd | grep $userName > /dev/null; then
                    # Si le compte existe
                    dataCommand="sudo usermod -L -e 1 $userName"
                    $sshCommand $dataCommand > /dev/null
                    echo -e "\n\e[94mLe compte $userName a été désactivé avec succés\e[0m\n"
                    eventLog="Désactivation du compte $userName sur $clientName"
                    log-event-server
                    menu-action-user
                else
                    # Si le compte  n'existe pas
                    echo -e "\n\e[33mErreur : Utilisateur $userName n'existe pas - Retour au MENU ACTION UTILISATEUR\e[0m\n"
                    menu-action-user
                fi
            else
                # Sinon >> Retour au Menu Action Utilisateur
                echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU ACTION UTILISATEUR\e[0m"
                menu-action-user
            fi
        else
            # Sinon >> Retour au Menu Action Utilisateur
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU ACTION UTILISATEUR\e[0m"
            menu-action-user
        fi
        ;;
    5)
        echo -e "\n\e[94mVous souhaitez ajouter un Utilisateur à un groupe local sur le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            echo ""
            read -p "Merci de renseigner un nom d'Utilisateur à ajouter à un groupe : " userName
            echo ""
            read -p "Confirmez-vous vouloir ajouter le compte $userName à un groupe ? (O/n) " userValidate
            echo ""
            if [ $userValidate = "O" ]; then
                # Si OK >> Continue
                # Vérification si le compte existe déjà
                if $sshCommand cat /etc/passwd | grep $userName > /dev/null; then
                    # Si le compte existe
                    read -p "A quel groupe voulez vous ajouter $userName ? " groupName
                    # Vérification si le groupe existe
                    if $sshCommand cat /etc/passwd | grep $groupName > /dev/null; then
                        # Si OK >> Continue
                        dataCommand="sudo -S usermod -G $groupName $userName"
                        $sshCommand $dataCommand > /dev/null
                        echo -e "\n\e[94mL'Utilisateur $userName a été ajouté au groupe $groupName\e[0m\n"
                        eventLog="Ajout de $userName au groupe $groupName sur $clientName"
                        log-event-server
                        menu-action-user
                    else
                        # Sinon
                        echo -e "\n\e[33mErreur : Groupe $groupName n'existe pas - Retour au MENU ACTION UTILISATEUR\e[0m\n"
                        menu-action-user
                    fi
                else
                    # Si le compte  n'existe pas
                    echo -e "\n\e[33mErreur : Utilisateur $userName n'existe pas - Retour au MENU ACTION UTILISATEUR\e[0m\n"
                    menu-action-user
                fi
            else
                # Sinon >> Retour au Menu Action Utilisateur
                echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU ACTION UTILISATEUR\e[0m"
                menu-action-user
            fi
        else
            # Sinon >> Retour au Menu Action Utilisateur
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU ACTION UTILISATEUR\e[0m"
            menu-action-user
        fi
        ;;
    6)
        echo -e "\n\e[94mVous souhaitez supprimer un Utilisateur d'un groupe local sur le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            echo ""
            read -p "Merci de renseigner un nom d'Utilisateur à supprimer d'un groupe : " userName
            echo ""
            read -p "Confirmez-vous vouloir supprimer le compte $userName d'un groupe ? (O/n) " userValidate
            echo ""
            if [ $userValidate = "O" ]; then
                # Si OK >> Continue
                # Vérification si le compte existe déjà
                if $sshCommand cat /etc/passwd | grep $userName > /dev/null; then
                    # Si le compte existe
                    read -p "A quel groupe voulez vous supprimer $userName ? " groupName
                    # Vérification si le groupe existe
                    if $sshCommand cat /etc/passwd | grep $groupName > /dev/null; then
                        # Si OK >> Continue
                        dataCommand="sudo -S gpasswd -d $userName $groupName"
                        $sshCommand $dataCommand > /dev/null
                        echo -e "\n\e[94mL'Utilisateur $userName a été supprimé du groupe $groupName\e[0m\n"
                        eventLog="Suppression de $userName du groupe $groupName sur $clientName"
                        log-event-server
                        menu-action-user
                    else
                        # Sinon
                        echo -e "\n\e[33mErreur : Groupe $groupName n'existe pas - Retour au MENU ACTION UTILISATEUR\e[0m\n"
                        menu-action-user
                    fi
                else
                    # Si le compte  n'existe pas
                    echo -e "\n\e[33mErreur : Utilisateur $userName n'existe pas - Retour au MENU ACTION UTILISATEUR\e[0m\n"
                    menu-action-user
                fi
            else
                # Sinon >> Retour au Menu Action Utilisateur
                echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU ACTION UTILISATEUR\e[0m"
                menu-action-user
            fi
        else
            # Sinon >> Retour au Menu Action Utilisateur
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU ACTION UTILISATEUR\e[0m"
            menu-action-user
        fi
        ;;
    R)
        # Prise de Log en lien avec Navigation Menu + Bascule vers Menu Action/Information
        eventLog="Redirection vers Menu Action Information"
        log-event-server
        menu-action-info-menu
        ;;
    M)
        # Prise de Log en lien avec Navigation Menu + Bascule vers Menu Principal
        eventLog="Redirection vers Menu Principal"
        log-event-server
        menu-main-menu
        ;;
    x)
        # Quitter le script + Fin de la prise de log
        log-end-server
        exit 0
        ;;
    *)
        # Le choix ne correspond pas aux options proposées + retour au menu en cours
        echo -e "\n\e[33mErreur : Cette option n'est pas disponible. Veuillez recommencer.\e[0m"
        menu-action-user
        ;;
    esac
}

# Menu Action Client
function menu-action-client() {
    # Choix Menu Action Client : Shutdown/Reboot/Lock Client / Create/Modify/Delete Folder / Remote Control / Enable/Rules/Disable Firewall / Install/Uninstall Software / Script / Action/Info Menu / Main Menu / Quit
    echo -e "\n\e[1;96mMENU ACTION CLIENT\e[0m\n\e[96mSélectionnez une option parmi :\e[0m\n"
    echo -e "1 - Arrêt du Client\n2 - Redémarage du Client\n3 - Verrouillage du Client\n4 - Mise-à-jour du Système"
    echo -e "5 - Création d'un répertoire\n6 - Modification d'un répertoire\n7 - Suppression d'un répertoire"
    echo -e "8 - Prise en main à distance (CLI)\n9 - Activation du Pare-feu\n10 - Définition de règles du Pare-feu\n11 - Désactivation du Pare-feu"
    echo -e "12 - Installation d'un logiciel\n13 - Désinstallation d'un logiciel\n14 - Exécution d'un Script sur la machine distante"
    echo -e "R - Retour au Menu Action/Information\nM - Retour au Menu principal\nx - Quitter l'outil d'Administration"
    echo -e "\n\e[94mVous êtes actuellement en connexion avec le Client $clientName\e[0m\n"
    # Enregistrement du choix du du Menu Action Client
    read -p "Votre choix : " targetActionClientMenu
    case $targetActionClientMenu in
    1)
        echo -e "\n\e[94mVous souhaitez arrêter le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            dataCommand="sudo -S shutdown -h now"
            $sshCommand $dataCommand > /dev/null
            echo -e "\n\e[94mLe Client $clientName est en cours d'arrêt\e[0m\n"
            # Verrouillage de la cible pour les Logs
            targetLog="$clientName"
            eventLog="Arrêt $clientName"
            log-event-server
            menu-action-client
        else
            # Sinon >> Retour au Menu Action Client
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU ACTION CLIENT\e[0m"
            menu-action-client
        fi
        ;;
    2)
        echo -e "\n\e[94mVous souhaitez redémarrer le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            dataCommand="sudo -S reboot -h now"
            $sshCommand $dataCommand > /dev/null
            echo -e "\n\e[94mLe Client $clientName est en cours de redémarrage\e[0m\n"
            # Verrouillage de la cible pour les Logs
            targetLog="$clientName"
            eventLog="Redémarrage $clientName"
            log-event-server
            menu-action-client
        fi
        ;;
    3)
        echo -e "\n\e[94mVous souhaitez verrouiller le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            dataCommand="skill -KILL -u wilder"
            $sshCommand $dataCommand > /dev/null
            echo -e "\n\e[94mLe Client $clientName est en cours de verrouillage\e[0m\n"
            # Verrouillage de la cible pour les Logs
            targetLog="$clientName"
            eventLog="Verrouillage $clientName"
            log-event-server
            menu-action-client
        else
            # Sinon >> Retour au Menu Action Client
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU ACTION CLIENT\e[0m"
            menu-action-client
        fi
        ;;
    4)
        echo -e "\n\e[94mVous souhaitez mettre à jour le Système du Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            dataCommand="sudo -S apt update && sudo -S apt upgrade -y"
            $sshCommand $dataCommand > /dev/null
            echo -e "\n\e[94mLe Client $clientName a été mis à jour\e[0m\n"
            # Verrouillage de la cible pour les Logs
            targetLog="$clientName"
            eventLog="Mise à jour $clientName"
            log-event-server
            menu-action-client
        else
            # Sinon >> Retour au Menu Action Client
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU ACTION CLIENT\e[0m"
            menu-action-client
        fi
        ;;
    5)
        echo -e "\n\e[94mVous souhaitez créer un répertoire sur le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            echo ""
            read -p "Veuillez indiquer le nom du dossier à créer : " repoName
            if $sshCommand test -d $repoName > /dev/null; then
                #nom existant donc erreur
                echo "\n\e[33mErreur : Le répertoire $repoName existe déjà - Retour au MENU ACTION CLIENT\e[0m\n"
                menu-action-client
            else
                dataCommand="mkdir $repoName"
                $sshCommand $dataCommand
                echo -e "\n\e[94mLe répertoire $repoName a été créé avec succès.\e[0m\n"
                # Verrouillage de la cible pour les Logs
                targetLog="$clientName"
                eventLog="Création du répertoire $repoName sur $clientName"
                log-event-server
                menu-action-client
            fi
        else
            # Sinon >> Retour au Menu Action Client
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU ACTION CLIENT\e[0m"
            menu-action-client
        fi
        ;;
    6)
        echo -e "\n\e[94mVous souhaitez modifier un répertoire sur le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            read -p "Quel dossier voulez-vous renommer ? " repoName
            echo ""
            if $sshCommand test -d $repoName > /dev/null; then
                read -p "Entrez un nouveau nom pour le dossier $repoName : " repoNewName
                echo ""
                dataCommand="mv $repoName $repoNewName"
                $sshCommand $dataCommand
                echo -e "\n\e[94mLe répertoire $repoName a été renommé avec succès en $repoNewName.\e[0m\n"
                # Verrouillage de la cible pour les Logs
                targetLog="$clientName"
                eventLog="Modification du répertoire $repoName sur $clientName"
                log-event-server
                menu-action-client
            else
                echo -e "\n\e[33mErreur : Le dossier $repoName n'existe pas - Retour au MENU ACTION CLIENT\e[0m"
                menu-action-client
            fi
        else
            # Sinon >> Retour au Menu Action Client
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU ACTION CLIENT\e[0m"
            menu-action-client
        fi
        ;;
    7)
        echo -e "\n\e[94mVous souhaitez supprimer un répertoire sur le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            echo ""
            read -p "Quel dossier voulez-vous supprimer ? " repoName
            if $sshCommand test -d $repoName > /dev/null; then
                dataCommand="rm -r $repoName"
                $sshCommand $dataCommand > /dev/null
                echo -e "\n\e[94mLe répertoire $repoName a été supprimé avec succès.\e[0m\n"
                # Verrouillage de la cible pour les Logs
                targetLog="$clientName"
                eventLog="Suppression du répertoire $repoName sur $clientName"
                log-event-server
                menu-action-client
            else
                echo -e "\n\e[33mErreur : Le dossier $repoName n'existe pas - Retour au MENU ACTION CLIENT\e[0m"
                menu-action-client
            fi
        else
            # Sinon >> Retour au Menu Action Client
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU ACTION CLIENT\e[0m"
            menu-action-client
        fi
        ;;
    8)
        echo -e "\n\e[94mVous souhaitez procéder à une Prise en main à distance du Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            dataCommand="-p 22"
            $sshCommand $dataCommand
            echo -e "\n\e[94mVous avez pris la main en CLI sur le Client $clientName\e[0m\n"
            # Verrouillage de la cible pour les Logs
            targetLog="$clientName"
            eventLog="Prise en main CLI $clientName"
            log-event-server
            menu-action-client
        else
            # Sinon >> Retour au Menu Action Client
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU ACTION CLIENT\e[0m"
            menu-action-client
        fi
        ;;
    9)
        echo -e "\n\e[94mVous souhaitez activer le Pare-feu du Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            dataCommand="sudo -S ufw enable"
            $sshCommand $dataCommand
            echo -e "\n\e[94mLe Pare-feu de $clientName a été activé\e[0m\n"
            # Verrouillage de la cible pour les Logs
            targetLog="$clientName"
            eventLog="Activation du Parefeu $clientName"
            log-event-server
            menu-action-client
        else
            # Sinon >> Retour au Menu Action Client
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU ACTION CLIENT\e[0m"
            menu-action-client
        fi
        ;;
    10)
        echo -e "\n\e[94mVous souhaitez définir les règles du Pare-feu du Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            dataCommand="sudo -S iptables -L"
            $sshCommand $dataCommand > /dev/null
            echo -e "\n\e[94mLes règles du Pare-feu de $clientName ont été définies\e[0m\n"
            # Verrouillage de la cible pour les Logs
            targetLog="$clientName"
            eventLog="Définition des règles du Parefeu $clientName"
            log-event-server
            menu-action-client
        else
            # Sinon >> Retour au Menu Action Client
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU ACTION CLIENT\e[0m"
            menu-action-client
        fi
        ;;
    11)
        echo -e "\n\e[94mVous souhaitez désactiver le Pare-feu du Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            dataCommand="sudo -S ufw disable"
            $sshCommand $dataCommand > /dev/null
            echo -e "\n\e[94mLe Pare-feu de $clientName a été désactivé\e[0m\n"
            # Verrouillage de la cible pour les Logs
            targetLog="$clientName"
            eventLog="Désactivation du Parefeu $clientName"
            log-event-server
            menu-action-client
        else
            # Sinon >> Retour au Menu Action Client
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU ACTION CLIENT\e[0m"
            menu-action-client
        fi
        ;;
    12)
        echo -e "\n\e[94mVous souhaitez installer un logiciel sur le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            read -p "Quel logiciel voulez-vous installer ? " softwareName
            dataCommand="sudo -S apt install $softwareName"
            $sshCommand $dataCommand
            echo -e "\n\e[94mLe logiciel $softwareName a été installé avec succès\e[0m\n"
            # Verrouillage de la cible pour les Logs
            targetLog="$clientName"
            eventLog="Installation du logiciel $softwareName sur $clientName"
            log-event-server
            menu-action-client
        else
            # Sinon >> Retour au Menu Action Client
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU ACTION CLIENT\e[0m"
            menu-action-client
        fi
        ;;
    13)
        echo -e "\n\e[94mVous souhaitez désinstaller un logiciel sur le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            read -p "Quel logiciel voulez-vous désinstaller ? " softwareName
            dataCommand="sudo -S apt remove --purge $softwareName"
            $sshCommand $dataCommand
            echo -e "\n\e[94mLe logiciel $softwareName a été désinstallé avec succès\e[0m\n"
            # Verrouillage de la cible pour les Logs
            targetLog="$clientName"
            eventLog="Désinstallation du logiciel $softwareName sur $clientName"
            log-event-server
            menu-action-client
        else
            # Sinon >> Retour au Menu Action Client
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU ACTION CLIENT\e[0m"
            menu-action-client
        fi
        ;;
    14)
        echo -e "\n\e[94mVous souhaitez exécuter un script sur le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            echo -e "Voici la liste des scripts exécutables :\n - hello"
            scriptName="hello"
            dataCommand="bash hello.sh"
            $sshCommand $dataCommand
            echo -e "\n\e[94mLe script $scriptName a été exécuté sur $clientName\e[0m\n"
            # Verrouillage de la cible pour les Logs
            targetLog="$clientName"
            eventLog="Exécution du script sur $clientName"
            log-event-server
            menu-action-client
        else
            # Sinon >> Retour au Menu Action Client
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU ACTION CLIENT\e[0m"
            menu-action-client
        fi
        ;;
    R)
        # Prise de Log en lien avec Navigation Menu + Bascule vers Menu Action/Information
        eventLog="Redirection vers Menu Action Information"
        log-event-server
        menu-action-info-menu
        ;;
    M)
        # Prise de Log en lien avec Navigation Menu + Bascule vers Menu Principal
        eventLog="Redirection vers Menu Principal"
        log-event-server
        menu-main-menu
        ;;
    x)
        # Quitter le script + Fin de la prise de log
        log-end-server
        exit 0
        ;;
    *)
        # Le choix ne correspond pas aux options proposées + retour au menu en cours
        echo -e "\n\e[33mErreur : Cette option n'est pas disponible. Veuillez recommencer.\e[0m"
        menu-action-client
        ;;
    esac
}

# Menu Information Utilisateur
function menu-info-user() {
    # Choix Menu Information Utilisateur : Last Connection / Last Password / User Session / Group User / History / Folder Permission / File Permission / Action/Info Menu / Main Menu / Quit
    echo -e "\n\e[1;96mMENU INFORMATION UTILISATEUR\e[0m\n\e[96mSélectionnez une option parmi :\e[0m\n"
    echo -e "1 - Date de dernière connexion Utilisateur\n2 - Date de dernière modification du mot de passe"
    echo -e "3 - Liste des sessions ouvertes par l'Utilisateur\n4 - Groupe d'appartenance d'un Utilisateur\n5 - Historique des commandes exécutées par l'Utilisateur"
    echo -e "6 - Droits/Permissions de l'utilisateur sur un dossier\n7 - Droits/Permissions de l'Utilisateur sur un fichier"
    echo -e "R - Retour au Menu Action/Information\nM - Retour au Menu principal\nx - Quitter l'outil d'Administration"
    echo -e "\n\e[94mVous êtes actuellement en connexion avec le Client $clientName\e[0m\n"
    # Enregistrement du choix du du Menu Information Utilisateur
    read -p "Votre choix : " targetInfoUserMenu
    case $targetInfoUserMenu in
    1)
        echo -e "\n\e[94mVous souhaitez connaître la date de dernière connexion d'un Utilisateur sur le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            echo ""
            read -p "Pour quel Utilisateur souhaitez-vous connaitre la date de dernière connexion ? " userName
            # Verrouillage de la cible pour les Logs
            # Verrouillage de la commande pour les Logs
            targetLog="$userName"
            dataCommand="last $userName"
            echo -e "\n\e[94mDate de dernière connexion de $userName sur $clientName : \e[0m\n"
            $sshCommand $dataCommand
            echo ""
            eventLog="Date dernière connexion de $userName sur $clientName"
            # Prise de log + Retour au Menu en cours
            log-desktop
            log-event-server
            menu-info-user
        else
            # Sinon >> Retour au Menu Information Utilisateur
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU INFORMATION UTILISATEUR\e[0m"
            menu-info-user
        fi
        ;;
    2)
        echo -e "\n\e[94mVous souhaitez connaître la date de dernière modification de mot de passe d'un Utilisateur sur le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            echo ""
            read -p "Pour quel Utilisateur souhaitez-vous connaître la date de dernière modification du mot de passe ? " userName
            # Verrouillage de la cible pour les Logs
            # Verrouillage de la commande pour les Logs
            targetLog="$userName"
            dataCommand="chage -l $userName"
            echo -e "\n\e[94mDate de dernière modification de Mot de passe de $userName sur $clientName : \e[0m\n"
            $sshCommand $dataCommand
            echo ""
            eventLog="Date de dernière modification de mot de passe de $userName sur $clientName"
            # Prise de log + Retour au Menu en cours
            log-desktop
            log-event-server
            menu-info-user
        else
            # Sinon >> Retour au Menu Information Utilisateur
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU INFORMATION UTILISATEUR\e[0m"
            menu-info-user
        fi
        ;;
    3)
        echo -e "\n\e[94mVous souhaitez connaître la liste des sessions ouvertes par un Utilisateur sur le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            echo ""
            read -p "Pour quel Utilisateur souhaitez-vous connaitre la liste des sessions ouvertes ? " userName
            # Verrouillage de la cible pour les Logs
            # Verrouillage de la commande pour les Logs
            targetLog="$userName"
            dataCommand="who -a | grep $userName"
            echo -e "\n\e[94mListes des sessions ouvertes de $userName sur $clientName : \e[0m\n"
            $sshCommand $dataCommand
            echo ""
            eventLog="Liste des sessions ouvertes de $userName sur $clientName"
            # Prise de log + Retour au Menu en cours
            log-desktop
            log-event-server
            menu-info-user
        else
            # Sinon >> Retour au Menu Information Utilisateur
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU INFORMATION UTILISATEUR\e[0m"
            menu-info-user
        fi
        ;;
    4)
        echo -e "\n\e[94mVous souhaitez connaître le(s) groupe(s) d'appartenance d'un Utilisateur sur le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            echo ""
            read -p "Pour quel Utilisateur souhaitez-vous connaitre les groupes d'appartenance ? " userName
            # Verrouillage de la cible pour les Logs
            # Verrouillage de la commande pour les Logs
            targetLog="$userName"
            dataCommand="id -gn $userName"
            echo -e "\n\e[94mGroupe d'appartenance de $userName sur $clientName : \e[0m\n"
            $sshCommand $dataCommand
            echo ""
            eventLog="Groupe appartenance de $userName sur $clientName"
            # Prise de log + Retour au Menu en cours
            log-desktop
            log-event-server
            menu-info-user
        else
            # Sinon >> Retour au Menu Information Utilisateur
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU INFORMATION UTILISATEUR\e[0m"
            menu-info-user
        fi
        ;;
    5)
        echo -e "\n\e[94mVous souhaitez connaître l'historique des commandes exécutées par un Utilisateur sur le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            echo ""
            read -p "Pour quel Utilisateur souhaitez-vous connaitre l'historiques des commandes exécutées ? " userName
            # Verrouillage de la cible pour les Logs
            # Verrouillage de la commande pour les Logs
            targetLog="$userName"
            dataCommand="cat /home/$userName/.bash_history"
            echo -e "\n\e[94mHistorique des commandes exécutées de $userName sur $clientName : \e[0m\n"
            $sshCommand $dataCommand
            echo ""
            eventLog="Historique des commandes exécutées de $userName sur $clientName"
            # Prise de log + Retour au Menu en cours
            log-desktop
            log-event-server
            menu-info-user
        else
            # Sinon >> Retour au Menu Information Utilisateur
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU INFORMATION UTILISATEUR\e[0m"
            menu-info-user
        fi
        ;;
    6)
        echo -e "\n\e[94mVous souhaitez connaître les droits/permissions d'un Utilisateur sur un dossier sur le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            echo ""
            read -p "Pour quel Utilisateur souhaitez-vous connaître les droits sur un dossier ? " userName
            # Verrouillage de la cible pour les Logs
            # Verrouillage de la commande pour les Logs
            targetLog="$userName"
            dataCommand="ls -ld $folderName"
            echo -e "\n\e[94mDroits et Permissions sur le dossier $folderName de $userName sur $clientName : \e[0m\n"
            $sshCommand $dataCommand
            echo ""
            eventLog="Obtention des droits permissions dossier $folderName $userName sur $clientName"
            # Prise de log + Retour au Menu en cours
            log-desktop
            log-event-server
            menu-info-user
        else
            # Sinon >> Retour au Menu Information Utilisateur
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU INFORMATION UTILISATEUR\e[0m"
            menu-info-user
        fi
        ;;
    7)
        echo -e "\n\e[94mVous souhaitez connaître les droits/permissions d'un Utilisateur sur un fichier sur le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            echo ""
            read -p "Pour quel Utilisateur souhaitez-vous connaître les droits sur un fichier ? " userName
            # Verrouillage de la cible pour les Logs
            # Verrouillage de la commande pour les Logs
            targetLog="$userName"
            dataCommand="ls -l $fileName"
            echo -e "\n\e[94mDroits et Permissions sur le fichier $fileName de $userName sur $clientName : \e[0m\n"
            $sshCommand $dataCommand
            echo ""
            eventLog="Obtention des droits permissions fichier $fileName $userName sur $clientName"
            # Prise de log + Retour au Menu en cours
            log-desktop
            log-event-server
            menu-info-user
        else
            # Sinon >> Retour au Menu Information Utilisateur
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU INFORMATION UTILISATEUR\e[0m"
            menu-info-user
        fi
        ;;
    R)
        # Prise de Log en lien avec Navigation Menu + Bascule vers Menu Action/Information
        eventLog="Redirection vers Menu Action Information"
        log-event-server
        menu-action-info-menu
        ;;
    M)
        # Prise de Log en lien avec Navigation Menu + Bascule vers Menu Principal
        eventLog="Redirection vers Menu Principal"
        log-event-server
        menu-main-menu
        ;;
    x)
        # Quitter le script + Fin de la prise de log
        log-end-server
        exit 0
        ;;
    *)
        # Le choix ne correspond pas aux options proposées + retour au menu en cours
        echo -e "\n\e[33mErreur : Cette option n'est pas disponible. Veuillez recommencer.\e[0m"
        menu-info-user
        ;;
    esac
}

# Menu Information Client
function menu-info-client() {
    # Choix Menu Information Client :  OS Version / Hard Disk / Partition / Apps/Packages Installed / Running Services / Local Users / CPU / RAM / Processor / Action/Info Menu / Main Menu / Quit
    echo -e "\n\e[1;96mMENU INFORMATION CLIENT\e[0m\n\e[96mSélectionnez une option parmi :\e[0m\n"
    echo -e "1 - Version de l'OS\n2 - Nombre de disques\n3 - Partitions(s) (Nombre, nom, FS, taille) par disque"
    echo -e "4 - Liste des applications/paquets installés\n5 - Liste des services en cours d'exécution\n6 - Liste des utilisateurs locaux"
    echo -e "7 - Type de CPU, nombre de coeurs,etc\n8 - Mémoire RAM totale\n9 - Utilisation de la RAM\n10 - Utilisation des disque\n11 - Utilisation du processeur"
    echo -e "R - Retour au Menu Action/Information\nM - Retour au Menu principal\nx - Quitter l'outil d'Administration"
    echo -e "\n\e[94mVous êtes actuellement en connexion avec le Client $clientName\e[0m\n"
    # Enregistrement du choix du du Menu Information Client
    read -p "Votre choix : " targetInfoClientMenu
    case $targetInfoClientMenu in
    1)
        echo -e "\n\e[94mVous souhaitez connaître la version de l'OS du Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            # Verrouillage de la cible pour les Logs
            targetLog="$clientName"
            # Verrouillage de la commande pour les Logs
            dataCommand="lsb_release -idrc"
            echo -e "\n\e[94mVersion de l'OS de $clientName : \e[0m\n"
            $sshCommand $dataCommand
            echo ""
            eventLog="Obtention de la version OS"
            # Prise de log + Retour au Menu en cours
            log-desktop
            log-event-server
            menu-info-client
        else
            # Sinon >> Retour au Menu Information Client
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU INFORMATION CLIENT\e[0m"
            menu-info-client
        fi
        ;;
    2)
        echo -e "\n\e[94mVous souhaitez connaître le nombre de disques du Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            # Verrouillage de la cible pour les Logs
            targetLog="$clientName"
            # Verrouillage de la commande pour les Logs
            dataCommand="lsblk | grep sd"
            echo -e "\n\e[94mNombre de disques de $clientName : \e[0m\n"
            $sshCommand $dataCommand
            echo ""
            eventLog="Obtention du nombre de disques"
            # Prise de log + Retour au Menu en cours
            log-desktop
            log-event-server
            menu-info-client
        else
            # Sinon >> Retour au Menu Information Client
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU INFORMATION CLIENT\e[0m"
            menu-info-client
        fi
        ;;
    3)
        echo -e "\n\e[94mVous souhaitez connaître le détail des partitions du Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            # Verrouillage de la cible pour les Logs
            targetLog="$clientName"
            # Verrouillage de la commande pour les Logs
            dataCommand="df -hT"
            echo -e "\n\e[94mDétail des partitions de $clientName : \e[0m\n"
            $sshCommand $dataCommand
            echo ""
            eventLog="Obtention du détail des partitions"
            # Prise de log + Retour au Menu en cours
            log-desktop
            log-event-server
            menu-info-client
        else
            # Sinon >> Retour au Menu Information Client
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU INFORMATION CLIENT\e[0m"
            menu-info-client
        fi
        ;;
    4)
        echo -e "\n\e[94mVous souhaitez connaître la liste des applications et paquets installés sur le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            # Verrouillage de la cible pour les Logs
            targetLog="$clientName"
            # Verrouillage de la commande pour les Logs
            dataCommand="dpkg --get-selections"
            echo -e "\n\e[94mListe des applications/paquets installés de $clientName : \e[0m\n"
            $sshCommand $dataCommand
            echo ""
            eventLog="Obtention de la liste des applications paquets installés"
            # Prise de log + Retour au Menu en cours
            log-desktop
            log-event-server
            menu-info-client
        else
            # Sinon >> Retour au Menu Information Client
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU INFORMATION CLIENT\e[0m"
            menu-info-client
        fi
        ;;
    5)
        echo -e "\n\e[94mVous souhaitez connaître la liste des services en cours d'exécution sur le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            # Verrouillage de la cible pour les Logs
            targetLog="$clientName"
            # Verrouillage de la commande pour les Logs
            dataCommand="ps -aux"
            echo -e "\n\e[94mListe des services en cours d'exécution de $clientName : \e[0m\n"
            $sshCommand $dataCommand
            echo ""
            eventLog="Obtention de la liste des services en cours exécution"
            # Prise de log + Retour au Menu en cours
            log-desktop
            log-event-server
            menu-info-client
        else
            # Sinon >> Retour au Menu Information Client
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU INFORMATION CLIENT\e[0m"
            menu-info-client
        fi
        ;;
    6)
        echo -e "\n\e[94mVous souhaitez connaître la liste des utilisateurs locaux sur le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            # Verrouillage de la cible pour les Logs
            targetLog="$clientName"
            # Verrouillage de la commande pour les Logs
            dataCommand="cat /etc/passwd | column -t -s ":""
            echo -e "\n\e[94mListe des utilisateurs locaux de $clientName : \e[0m\n"
            $sshCommand $dataCommand
            echo ""
            eventLog="Obtention de la liste des Utilisateurs locaux"
            # Prise de log + Retour au Menu en cours
            log-desktop
            log-event-server
            menu-info-client
        else
            # Sinon >> Retour au Menu Information Client
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU INFORMATION CLIENT\e[0m"
            menu-info-client
        fi
        ;;
    7)
        echo -e "\n\e[94mVous souhaitez connaître le détail concernant le CPU sur le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            # Verrouillage de la cible pour les Logs
            targetLog="$clientName"
            # Verrouillage de la commande pour les Logs
            dataCommand="lscpu"
            echo -e "\n\e[94mType de CPU de $clientName : \e[0m\n"
            $sshCommand $dataCommand
            echo ""
            eventLog="Obtention du type de CPU"
            # Prise de log + Retour au Menu en cours
            log-desktop
            log-event-server
            menu-info-client
        else
            # Sinon >> Retour au Menu Information Client
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU INFORMATION CLIENT\e[0m"
            menu-info-client
        fi
        ;;
    8)
        echo -e "\n\e[94mVous souhaitez connaître le détail concernant la mémoire RAM sur le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            # Verrouillage de la cible pour les Logs
            targetLog="$clientName"
            # Verrouillage de la commande pour les Logs
            dataCommand="free -h"
            echo -e "\n\e[94mDétail mémoire RAM de $clientName : \e[0m\n"
            $sshCommand $dataCommand
            echo ""
            eventLog="Obtention du détail RAM"
            # Prise de log + Retour au Menu en cours
            log-desktop
            log-event-server
            menu-info-client
        else
            # Sinon >> Retour au Menu Information Client
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU INFORMATION CLIENT\e[0m"
            menu-info-client
        fi
        ;;
    9)
        echo -e "\n\e[94mVous souhaitez connaître l'utilisation de la mémoire RAM sur le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            # Verrouillage de la cible pour les Logs
            targetLog="$clientName"
            # Verrouillage de la commande pour les Logs
            dataCommand="free -h | grep Mem:"
            echo -e "\n\e[94mDétail mémoire RAM de $clientName : \e[0m\n"
            $sshCommand $dataCommand
            echo ""
            eventLog="Obtention de utilisation RAM"
            # Prise de log + Retour au Menu en cours
            log-desktop
            log-event-server
            menu-info-client
        else
            # Sinon >> Retour au Menu Information Client
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU INFORMATION CLIENT\e[0m"
            menu-info-client
        fi
        ;;
    10)
        echo -e "\n\e[94mVous souhaitez connaître l'utilisation des disques sur le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            # Verrouillage de la cible pour les Logs
            targetLog="$clientName"
            # Verrouillage de la commande pour les Logs
            dataCommand="df -h"
            echo -e "\n\e[94mDétail Utillisatioon du disque de $clientName : \e[0m\n"
            $sshCommand $dataCommand
            echo ""
            eventLog="Obtention du détail utilisation des disques"
            # Prise de log + Retour au Menu en cours
            log-desktop
            log-event-server
            menu-info-client
        else
            # Sinon >> Retour au Menu Information Client
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU INFORMATION CLIENT\e[0m"
            menu-info-client
        fi
        ;;
    11)
        echo -e "\n\e[94mVous souhaitez connaître l'utilisation du CPU sur le Client $clientName\e[0m\n"
        read -p "Confirmez-vous ce choix ? (O/n) " optionValidate
        if [ $optionValidate = "O" ]; then
            # Si OK >> Continue
            # Verrouillage de la cible pour les Logs
            targetLog="$clientName"
            # Verrouillage de la commande pour les Logs
            dataCommand="mpstat"
            echo -e "\n\e[94mDétail Utillisatioon du processeur de $clientName : \e[0m\n"
            $sshCommand $dataCommand
            echo ""
            eventLog="Obtention de utilisation du Processeur"
            # Prise de log + Retour au Menu en cours
            log-desktop
            log-event-server
            menu-info-client
        else
            # Sinon >> Retour au Menu Information Client
            echo -e "\n\e[33mErreur : Vous n'avez pas confirmé le choix - Retour au MENU INFORMATION CLIENT\e[0m"
            menu-info-client
        fi
        ;;
    R)
        # Prise de Log en lien avec Navigation Menu + Bascule vers Menu Action/Information
        eventLog="Redirection vers Menu Action Information"
        log-event-server
        menu-action-info-menu
        ;;
    M)
        # Prise de Log en lien avec Navigation Menu + Bascule vers Menu Principal
        eventLog="Redirection vers Menu Principal"
        log-event-server
        menu-main-menu
        ;;
    x)
        # Quitter le script + Fin de la prise de log
        log-end-server
        exit 0
        ;;
    *)
        # Le choix ne correspond pas aux options proposées + retour au menu en cours
        echo -e "\n\e[33mErreur : Cette option n'est pas disponible. Veuillez recommencer.\e[0m"
        menu-info-client
        ;;
    esac
}

# Menu Consultation Logs
function menu-log-menu() {
    # Choix Menu Consultation Logs : Client Ubuntu 01 / Client Ubuntu 02 / Client Windows 01 / Client Windows 02 / Users Logs / Main Menu / Quit
    echo -e "\n\e[1;96mMENU CONSULTATION LOGS\e[0m\n\e[96mSélectionnez une option parmi :\e[0m\n"
    echo -e "A - Logs Client CLILIN01\nB - Logs Client CLILIN02"
    echo -e "C - Logs Client CLIWIN01\nD - Logs Client CLIWIN02"
    echo -e "U - Logs Utilisateur\nM - Retour au Menu principal\nx - Quitter l'outil d'Administration"
    echo -e ""
    # Enregistrement du choix Menu Consultation Logs
    read -p "Votre choix : " targetLogMenu
    # Enumération des choix disponibles
    case $targetLogMenu in
    A)
        # Nom du Client inséré dans variable
        clientName="CLILIN01"
        echo -e "\n\e[94mVousavez opté pour le Client $clientName\e[0m\n"
        # Demande de confirmation du Client
        read -p "Confirmez-vous vouloir faire une recherche sur $clientName ? (O/n) " clientValidate
        echo ""
        # Vérification que la confirmation est faite et que le Client apparaît dans les Logs
        if [ $clientValidate = "O" ]; then
            if cat /var/log/log_evt.log | grep $clientName > /dev/null; then
                # Si Tout OK >> Affichage des Logs dédiés au Client + Retour au Menu en cours
                echo -e "\n\e[94mVous recherchez les Logs pour le client $ clientName\e[0m\n"
                cat /var/log/log_evt.log | grep $clientName
                # Retour au Menu Consulation Logs
                menu-log-menu
            else
                # Sinon >> Message pour avertir que le Client n'est pas recensé + Retour au Menu en cours
                echo -e "\n\e[33mErreur : Les Client $clientName n'apparaît pas dans les Logs\e[0m"
                menu-log-menu
            fi
        else
            # Si autre choix que O >> Retour au Menu en cours
            echo -e "\n\e[33mErreur : Cette option n'est pas disponible. Veuillez recommencer.\e[0m"
            menu-log-menu
        fi
        ;;
    B)
        # Nom du Client inséré dans variable
        clientName="CLILIN02"
        echo -e "\n\e[94mVousavez opté pour le Client $clientName\e[0m\n"
        # Demande de confirmation du Client
        read -p "Confirmez-vous vouloir faire une recherche sur $clientName ? (O/n) " clientValidate
        echo ""
        # Vérification que la confirmation est faite et que le Client apparaît dans les Logs
        if [ $clientValidate = "O" ]; then
            if cat /var/log/log_evt.log | grep $clientName > /dev/null; then
                # Si Tout OK >> Affichage des Logs dédiés au Client + Retour au Menu en cours
                echo -e "\n\e[94mVous recherchez les Logs pour le client $ clientName\e[0m\n"
                cat /var/log/log_evt.log | grep $clientName
                # Retour au Menu Consulation Logs
                menu-log-menu
            else
                # Sinon >> Message pour avertir que le Client n'est pas recensé + Retour au Menu en cours
                echo -e "\n\e[33mErreur : Les Client $clientName n'apparaît pas dans les Logs\e[0m"
                menu-log-menu
            fi
        else
            # Si autre choix que O >> Retour au Menu en cours
            echo -e "\n\e[33mErreur : Cette option n'est pas disponible. Veuillez recommencer.\e[0m"
            menu-log-menu
        fi
        ;;
    C)
        # Nom du Client inséré dans variable
        clientName="CLIWIN01"
        echo -e "\n\e[94mVousavez opté pour le Client $clientName\e[0m\n"
        # Demande de confirmation du Client
        read -p "Confirmez-vous vouloir faire une recherche sur $clientName ? (O/n) " clientValidate
        echo ""
        # Vérification que la confirmation est faite et que le Client apparaît dans les Logs
        if [ $clientValidate = "O" ]; then
            if cat /var/log/log_evt.log | grep $clientName > /dev/null; then
                # Si Tout OK >> Affichage des Logs dédiés au Client + Retour au Menu en cours
                echo -e "\n\e[94mVous recherchez les Logs pour le client $ clientName\e[0m\n"
                cat /var/log/log_evt.log | grep $clientName
                # Retour au Menu Consulation Logs
                menu-log-menu
            else
                # Sinon >> Message pour avertir que le Client n'est pas recensé + Retour au Menu en cours
                echo -e "\n\e[33mErreur : Les Client $clientName n'apparaît pas dans les Logs\e[0m"
                menu-log-menu
            fi
        else
            # Si autre choix que O >> Retour au Menu en cours
            echo -e "\n\e[33mErreur : Cette option n'est pas disponible. Veuillez recommencer.\e[0m"
            menu-log-menu
        fi
        ;;
    D)
        # Nom du Client inséré dans variable
        clientName="CLIWIN02"
        echo -e "\n\e[94mVousavez opté pour le Client $clientName\e[0m\n"
        # Demande de confirmation du Client
        read -p "Confirmez-vous vouloir faire une recherche sur $clientName ? (O/n) " clientValidate
        echo ""
        # Vérification que la confirmation est faite et que le Client apparaît dans les Logs
        if [ $clientValidate = "O" ]; then
            if cat /var/log/log_evt.log | grep $clientName > /dev/null; then
                # Si Tout OK >> Affichage des Logs dédiés au Client + Retour au Menu en cours
                echo -e "\n\e[94mVous recherchez les Logs pour le client $clientName\e[0m\n"
                cat /var/log/log_evt.log | grep $clientName
                # Retour au Menu Consulation Logs
                menu-log-menu
            else
                # Sinon >> Message pour avertir que le Client n'est pas recensé + Retour au Menu en cours
                echo -e "\n\e[33mErreur : Les Client $clientName n'apparaît pas dans les Logs\e[0m"
                menu-log-menu
            fi
        else
            # Si autre choix que O >> Retour au Menu en cours
            echo -e "\n\e[33mErreur : Cette option n'est pas disponible. Veuillez recommencer.\e[0m"
            menu-log-menu
        fi
        ;;
    U)
        # Requête de nom d'Utilisateur à rechercher
        echo ""
        read -p "Pour quel Utilisateur souhaitez-vous rechercher les évènements ? " userName
        echo ""
        # Demande de validation de l'Utilisateur
        read -p "Confirmez-vous vouloir faire une recherche sur l'Utilisateur $userName ? (O/n) " userValidate
        echo ""
        # Vérification que la confirmation est faite et que l'Utilisateur apparaît dans les Logs
        if [ $userValidate = "O" ]; then
            # Vérification de la présence de l'Utilisateur dans les Logs
            if cat /var/log/log_evt.log | grep $userName > /dev/null; then
                # Si Tout OK >> Affichage des Logs dédiés au Client + Retour au Menu en cours
                echo -e "\n\e[94mVous recherchez les Logs pour l'Utilisateur $userName\e[0m\n"
                cat /var/log/log_evt.log | grep $userName
                # Retour au Menu Consulation Logs
                menu-log-menu
            else
                # Sinon >> Message pour avertir que l'Utilisateur n'est pas recensé dans les Logs + Retour au Menu de Logs
                echo -e "\n\e[33mErreur : L'utilisateur $userName n'apparaît pas dans les Logs\e[0m"
                menu-log-menu
            fi
        else
            # Si autre choix que O
            echo -e "\n\e[33mErreur : Cette option n'est pas disponible. Veuillez recommencer.\e[0m"
            menu-log-menu
        fi
        ;;
    M)
        # Prise de Log en lien avec Navigation Menu + Bascule vers Menu Principal
        eventLog="Redirection vers Menu Principal"
        log-event-server
        menu-main-menu
        ;;
    x)
        # Quitter le script + Fin de la prise de log
        log-end-server
        exit 0
        ;;
    *)
        # Le choix ne correspond pas aux options proposées + retour au menu en cours
        echo -e "\n\e[33mErreur : Cette option n'est pas disponible. Veuillez recommencer.\e[0m"
        menu-log-menu
        ;;
    esac
}

##########FONCTIONS_LOGS##########

function log-begin-server() {
    # Inscription avec ajout/création de la ligne Début du Script au fichier log_evt situé dans /var/log
    echo "$(date +%4Y%m%d)-$(date +%H%M%S)-$USER-********StartScript********" >>/var/log/log_evt.log
}

function log-end-server() {
    # Inscription avec ajout/création de la ligne Fin du Script au fichier log_evt situé dans /var/log
    echo "$(date +%4Y%m%d)-$(date +%H%M%S)-$USER-********EndScript********" >>/var/log/log_evt.log
}

function log-event-server() {
    # Inscription avec ajout/création de la ligne Evènement du Script au fichier log_evt situé dans /var/log
    echo "$(date +%4Y%m%d)-$(date +%H%M%S)-$USER-$eventLog" >> /var/log/log_evt.log
}

function log-desktop() {
    # Vérification de l'existence du dossier Documents dans le dossier personnel de l'utilisateur
    if [ -d ~/Documents ]; then
        # Inscription avec ajout/création de la ligne Evènement du Script au fichier info_<Cible>-<Date>.txt  situé dans le /Documents du dossier personnel de l'utilisateur qui a initié l'évènement
        echo "$(date +%4Y%m%d)-$(date +%H%M%S)-$USER-$eventLog" >> ~/Documents/info_$targetLog\_$(date +%4Y%m%d).txt
        $sshCommand $dataCommand >>~/Documents/info_$targetLog\_$(date +%4Y%m%d).txt
        echo -e "\nLes informations recueillies sont disponibles dans le fichier \e[94minfo_${targetLog}_$(date +%4Y%m%d).txt\e[0m situé dans le dossier ~/Documents\n"
    else
        # Création du dossier Documents dans le dossier personnel de l'utilisateur
        mkdir ~/Documents
        echo "$(date +%4Y%m%d)-$(date +%H%M%S)-$USER-$eventLog" >> ~/Documents/info_$targetLog\_$(date +%4Y%m%d).txt
        $sshCommand $dataCommand >> ~/Documents/info_$targetLog\_$(date +%4Y%m%d).txt
        echo -e "\nLes informations recueillies sont disponibles dans le fichier \e[94minfo_${targetLog}_$(date +%4Y%m%d).txt\e[0m situé dans le dossier ~/Documents\n"
    fi
}

##########SCRIPT_LAUNCH##########

# Lancement du script et début de la prise de log
log-begin-server
# Message de bienvenue
echo -e "\e[1;96mBienvenue dans l'outil d'Administration\e[0m"
# Prise de Log en lien avec Navigation Menu
eventLog="Démarrage du Menu Principal"
log-event-server
# Démarrage du Menu principal
menu-main-menu
