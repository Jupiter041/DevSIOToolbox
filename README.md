# DevSIOToolbox

## Description

DevSIOToolbox est un projet créé pour faciliter le développement des étudiants en BTS SIO option SLAM. Ce projet contient des outils et des scripts pour aider à la configuration et à la gestion des environnements de développement.

## Installation

Pour installer DevSIOToolbox, suivez ces étapes :

1. Clonez le dépôt :
    ```bash
    git clone https://github.com/VOTRE_NOM_UTILISATEUR/DevSIOToolbox.git
    cd DevSIOToolbox
    ```

2. Assurez-vous que le fichier `install_codeigniter.sh` a les bonnes permissions :
    ```bash
    chmod 777 install_codeigniter.sh
    ```

3. Exécutez le script d'installation :
    ```bash
    ./install_codeigniter.sh
    ```

## Utilisation

### Raccourcis personnalisés pour Konsole

Pour améliorer votre expérience de développement, configurez des raccourcis personnalisés dans Konsole :

- **` Allez dans "Raccourcis personnalisés" et créez une nouvelle commande `**
- **` avec un raccourci clavier de votre choix, dans l'onglet "Action" `**
- **` Entrez la commande suivante : `**

```bash
konsole --nofork -e "bash -c 'le/chemin/complet/jusqu'au/bash; exec bash'"
```

## Explications des Commandes

### 1. Clonage du Dépôt

```bash
git clone https://github.com/VOTRE_NOM_UTILISATEUR/DevSIOToolbox.git
cd DevSIOToolbox
```
- **`git clone https://github.com/VOTRE_NOM_UTILISATEUR/DevSIOToolbox.git`** : 
  - Clone le dépôt GitHub sur votre machine locale. Remplacez `VOTRE_NOM_UTILISATEUR` par votre nom d'utilisateur GitHub.
  
- **`cd DevSIOToolbox`** : 
  - Change le répertoire courant pour celui du projet cloné.

### 2. Changement de Permissions

```bash
chmod 777 install_codeigniter.sh
```
- **`chmod 777 install_codeigniter.sh`** : 
  - Donne les permissions de lecture, écriture et exécution à tous les utilisateurs pour le fichier `install_codeigniter.sh`, permettant ainsi de l'exécuter sans problème.

### 3. Exécution du Script

```bash
./install_codeigniter.sh
```
- **`./install_codeigniter.sh`** : 
  - Exécute le script d'installation.

### 4. Raccourcis Personnalisés

```bash
konsole --nofork -e "bash -c 'le/chemin/complet/jusqu'au/bash; exec bash'"
```
- **`konsole --nofork -e "bash -c 'le/chemin/complet/jusqu'au/bash; exec bash'"`** : 
  - Ouvre un nouveau terminal Konsole et exécute le script spécifié. 
  - Remplacez `le/chemin/complet/jusqu'au/bash` par le chemin complet vers votre script.

## Contribuer

Les contributions sont les bienvenues ! Si vous avez des idées d'amélioration ou des fonctionnalités à ajouter, n'hésitez pas à ouvrir une issue ou à soumettre une demande de tirage.

## License

Ce projet est sous la licence MIT. Voir le fichier [LICENSE](LICENSE) pour plus d'informations.

Si vous avez d'autres ajustements ou ajouts en tête, n'hésitez pas à demander !
