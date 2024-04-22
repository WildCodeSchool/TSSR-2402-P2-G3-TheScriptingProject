# **TSSR-2402-P2-G3-TheScriptingProject**

##  **Sommaire**

1) Présentation du Projet et Objectifs finaux

2) Mise en contexte

3) Présentation des membres du groupe et rôles par Sprint

4) Choix techniques et contraintes

5) Difficultés rencontrées

6) Solutions et/ou alternatives trouvées pour palier aux problèmes

7) Next-step : Améliorations possibles envisagées

8) Conclusion

## **Présentation du Projet et Objectifs finaux**

Le Projet **_Scripting_** consiste à créer deux scripts qui s'exécutent depuis un serveur et effectuent des tâches sur des machines distantes.

Le premier est sous _bash_ pour commander depuis un Serveur _Debian_ des Clients sous _Ubuntu_.

Le second est sous _Powershell_ afin de commander depuis un Serveur _Windows Server 2022_ des Clients sous _Windows 10 Pro_.

La documentation jointe au Projet est constituée de 5 fichiers (dont 3 au format markdown, ainsi que les deux scripts respectivement en extension .sh (pour le script bash) et .ps1 (pour le script Powershell)) :
* une documentation générale (README.md)
* une documentation administrateur (INSTALL.md)
* une documentation utilisateur (USER_GUIDE.md)
* un script _bash_ fonctionnel
* un script _Powershell_ fonctionnel

Les deux scripts Powershell et bash se trouvent dans le dossier `attachment` du dépôt, ainsi que toutes les captures d'écran nécessaires à l'élaboration de la documentation.

Un dépôt GitHub a été créé à cet effet : [TSSR-2402-P2-G3-TheScriptingProject](https://github.com/WildCodeSchool/TSSR-2402-P2-G3-TheScriptingProject)

L'objectif secondaire prévoit d'administrer depuis un Serveur Windows des Clients Linux et/ou depuis un Serveur Debian des Clients Windows.
L'équipe de projet a fait le choix de ne pas le réaliser afin de remplir toutes les cases de l'objectif principal.

## **Mise en contexte**

L'intérêt du Projet consiste à faciliter et rassembler les différentes tâches d'Administration, afin d'effectuer des actions ou d'extraire des informations sur les postes Clients et les Utilisateurs depuis le Serveur.

Des fichiers de logs sont également conservés dans le Serveur, afin d'avoir un historique complet et ainsi une traçabilité.

Ces fichiers comprennent la navigation au sein des différents menus du script, ainsi que le suivi des actions effectuées, et la centralisation des informations récoltées.

## **Présentation des membres du groupe et rôles par Sprint**

Le groupe du Projet **_Scripting_** est composé de :
* **Julien Guillot**
* **Anthony Javault**
* **Nicolas Maggirori**
* **Sébastien Taiclet**

### **Sprint 1 : semaine du 25 au 31 mars 2024**

|PO|SM|
|:-:|:-:|
|Sébastien Taiclet|Nicolas Maggiori|

Activités et répartitions des tâches

||Julien Guillot|Anthony Javault|Nicolas Maggiori|Sébastien Taiclet|
|:-:|:-:|:-:|:-:|:-:|
|Création et partage Serveur Windows||x|||
|Création et partage Serveur Debian|x||||
|Création et partage Client Windows|||x||
|Création et partage Client Ubuntu||||x|
|Duplication des Clients Windows et Ubuntu|x|x|x|x|
|Mise en réseau des éléments|x|x|x|x|
|Recherche sur SSH||||x|
|Installation SSH Serveur et Clients Linux|x|x|x|x|
|Recherche et centralisation des commandes de script|x||x||
|Conception du squelette de script||x|x||
|Préparation slides présentation|||x||
|Présentation|x|x|x|x|

### **Sprint 2 : semaine du 1 au 7 avril 2024**

|PO|SM|
|:-:|:-:|
|Anthony Javault|Julien Guillot|

Activités et répartitions des tâches

||Julien Guillot|Anthony Javault|Nicolas Maggiori|Sébastien Taiclet|
|:-:|:-:|:-:|:-:|:-:|
|Script Action Utilisateur|||x||
|Script Action Client|x||||
|Script Information Utilisateur||||x|
|Script Information Client|x||||
|Script Menus||x|||
|Centralisation des différentes parties de script|x|x|x|x|
|Préparation slides présentation|x||||
|Présentation & Demo|x|x|x|x|

### **Sprint 3 : semaine du 8 au 14 avril 2024**

|PO|SM|
|:-:|:-:|
|Nicolas Maggiori|Sébastien Taiclet|

Activités et répartitions des tâches

||Julien Guillot|Anthony Javault|Nicolas Maggiori|Sébastien Taiclet|
|:-:|:-:|:-:|:-:|:-:|
|Finalisation & Debug bash|x|x|x|x|
|Fonctions Powershell|x|x|x|x|
|Documentation||x|||
|Préparation slides présentation|x|||x|
|Présentation & Demo|x|x|x|x|

### **Sprint 4 : semaine du 15 au 22 avril 2024**

|PO|SM|
|:-:|:-:|
|Julien Guillot|Anthony Javault|

Activités et répartitions des tâches

||Julien Guillot|Anthony Javault|Nicolas Maggiori|Sébastien Taiclet|
|:-:|:-:|:-:|:-:|:-:|
|Fonctions Powershell|x|x|x|x|
|Centralisation Powershell|x|x|x|x|
|Debug Powershell|x|||x|
|Documentation||x|||
|Préparation slides présentation||||x|
|Présentation & Demo|x|x|x|x|

## **Choix techniques et contraintes**

### **Les Serveurs**

||Debian 12.5|Windows Server 2022|
|:-:|:-:|:-:|
|HostName|SRVLX01|SRVWIN01|
|Login|root|administrator|
|Password|Azerty1*|Azerty1*|
|Ip fixe|172.16.10.10/24|172.16.10.5/24|
|Spécificité||Powershell Core 7.4 LTS inclus|

### **Les Clients**

||Ubuntu 22.04 LTS 01|Ubuntu 22.04 LTS 02| Windows 10 Pro 01|Windows 10 Pro 02|
|:-:|:-:|:-:|:-:|:-:|
|HostName|CLILIN01|CLILIN02|CLIWIN01|CLIWIN02|
|Login|wilder|wilder|wilder|wilder|
|Password|Azerty1*|Azerty1*|Azerty1*|Azerty1*|
|Ip fixe|172.16.10.30/24|172.16.10.31/24|172.16.10.20/24|172.16.10.21/24|

## **Difficultés rencontrées**

Le script bash n'a pas présenté de réelles difficultés, nous avons peiné à trouver quelques commandes, mais au final il est entièrement fonctionnel.

En revanche, cela a été une toute autre affaire avec de nombreuses commandes Powershell, nous pensions qu'il aurait été simple de transposer de bash vers Powershell, mais nous avons vite déchanté lorsqu'il a fallu trouver où aller chercher les informations dont nous avions besoin.

## **Solutions et/ou alternatives trouvées pour palier aux problèmes**

Afin de palier aux problèmes rencontrés avec le script Powershell, nous nous sommes servis énormément de la [Documentation Officielle](https://learn.microsoft.com/fr-fr/powershell/), et avons échangé avec les autres équipes, afin de nous entraider.

## **Next-step : Améliorations possibles envisagées**

La solution optimale qui pourrait apporter un vrai plus aux deux scripts, serait une version en mode graphique pour chacun d'eux.

Nous aurions, pour se faire, besoin d'outil tel que [zenity](https://doc.ubuntu-fr.org/zenity) pour le script bash, ou [WPF](https://learn.microsoft.com/fr-fr/archive/msdn-magazine/2011/july/msdn-magazine-windows-powershell-with-wpf-secrets-to-building-a-wpf-application-in-windows-powershell) pour le Powershell

## **Conclusion**

L'équipe de projet est fière d'avoir réussi à accomplir l'objectif principal, les deux scripts sont fonctionnels et ergonomiques, ils respectent les pré-requis exigés par le partenaire.
