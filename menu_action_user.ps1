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
