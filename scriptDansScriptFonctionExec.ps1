#Script PowerShell qui dit bonjour à l'argument donné à l'appel du script

$nom_utilisateur_script_exec = Read-Host "What's ya name"

Foreach ($name in $nom_utilisateur_script_exec)
{
    $wassupfella = Read-Host "wassup $name ?"; Write-Host "alright, let's call it a day !"
}