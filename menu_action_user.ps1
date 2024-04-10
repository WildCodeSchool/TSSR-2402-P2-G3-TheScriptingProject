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
            #Invoke-Command -ComputerName $ipadress -ScriptBlock { New-LocalUser $userName } -Credential wilder
            New-LocalUser $createUser 
            Write-Host "Le compte $createUser a ete cree avec succes."
        }
    }
    else {
        Write-Host "Retour au menu precedent."
    }
}

# Suppresion d'utilisateur 
function Suppression_de_compte {
    $answer = Read-Host "Voulez-vous supprimer un compte utilisateur local ? (o/n)"
    if ($answer -eq "o") {
        $delUser = Read-Host "Rentrez le nom de l'utilisateur a supprimer"
        # Vérification que l'utilisateur existe
        if (Get-LocalUser -Name $delUser -ErrorAction SilentlyContinue) {
            # Si oui suppression de l'utilisateur
            #Invoke-Command -ComputerName $ipadress -ScriptBlock { Remove-LocalUser $userName } -Credential wilder
            Remove-LocalUser $delUser 
            Write-Host "Le compte $delUser a ete supprime avec succes."
        }
    }
    else {
        Write-Host "Retour au menu precedent."
    }
}

# Changement de mdp
function Changement_de_mot_de_passe {
    $answer = Read-Host "Voulez-vous modifier le mot de passer d'un compte utilisateur local ? (o/n)"
    if ($answer -eq "o") {
        $modUser = Read-Host "Rentrez le nom de l'utilisateur"
        # Vérification que l'utilisateur existe
        if (Get-LocalUser -Name $userName -ErrorAction SilentlyContinue) {
            # Si oui suppression de l'utilisateur
            #Invoke-Command -ComputerName $ipadress -ScriptBlock { Set-LocalUser $userName -Password -Force } -Credential wilder
            Set-LocalUser -Name $modUser -Password (ConvertTo-SecureString -AsPlainText -Force) 
            Write-Host "Le compte $userName a ete supprime avec succes."
        }
    }
    else {
        Write-Host "Retour au menu precedent."
    }
}

Creation_compte_utilisateur_local
Suppression_de_compte
Changement_de_mot_de_passe
Desactivation_compte_utilisteur
Ajout_utilisateur_a_groupe
Supp_user_from_group