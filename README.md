# DevSIOToolbox

**DevSIOToolbox** est un projet créé pour faciliter le développement des étudiants en BTS SIO option SLAM. Ce projet contient des outils et des scripts pour aider à la configuration et à la gestion des environnements de développement.

## Fonctionnalités

- Installation automatisée de CodeIgniter 4.
- Intégration de la bibliothèque **Eloquent** pour la gestion des bases de données.
- Configuration de l'environnement de développement avec les permissions correctes.
- Compatibilité avec Linux et Windows.
- Ouverture directe du projet dans VSCodium après configuration.

## Prérequis

### Linux

- **Composer** : [Installation Composer](https://getcomposer.org/download/)
- **VSCodium** : [Installation VSCodium](https://vscodium.com)
- Terminal supportant Bash

### Windows

- **Composer** : [Installation Composer](https://getcomposer.org/download/)
- **VSCodium** : [Installation VSCodium](https://vscodium.com)
- PowerShell (inclus dans Windows)

## Installation

### 1. Cloner le dépôt

```bash
git clone https://github.com/votreutilisateur/DevSIOToolbox.git
cd DevSIOToolbox
```

### 2. Donnez les droits d'exécution au script (Linux uniquement)

```bash
chmod +x install_codeigniter_linux.sh
```

### 3. Exécutez le script d'installation

#### Pour Linux :

```bash
./install_codeigniter_linux.sh
```

#### Pour Windows (XAMPP/WAMP) :

1. Clonez ou téléchargez le fichier `install_codeigniter.ps1`.
2. Ouvrez **PowerShell** en tant qu'administrateur.
3. Exécutez le script :

    ```powershell
    .\install_codeigniter.ps1
    ```

4. Suivez les instructions à l'écran pour entrer le nom du projet et choisir entre **XAMPP** et **WAMP**. Le projet sera créé dans le dossier `C:\xampp\htdocs\` (pour XAMPP) ou `C:\wamp\www\` (pour WAMP).

## Utilisation

### Linux

Pour améliorer votre expérience de développement, vous pouvez configurer un raccourci pour lancer l'installation directement.

2. **Allez dans `Paramètres` > `Raccourcis` > `Raccourcis personnalisés`**.
3. **Créez une nouvelle commande** avec un raccourci clavier de votre choix.
4. Dans l'onglet "Action", entrez la commande suivante pour exécuter le script :

```bash
konsole --nofork -e "bash -c '/chemin/complet/vers/install_codeigniter_linux.sh; exec bash'"
```

### Windows (PowerShell)

Sur Windows, vous pouvez aussi créer un raccourci sur le bureau ou utiliser un script `.bat` pour lancer facilement PowerShell avec votre script :

1. **Créez un fichier `.bat`** avec le contenu suivant :

```batch
powershell -ExecutionPolicy Bypass -File "C:\chemin\complet\vers\install_codeigniter_windows.ps1"
```

2. **Double-cliquez sur ce fichier** pour exécuter le script à tout moment.

## Contribuer

Les contributions sont les bienvenues ! Si vous avez des idées d'amélioration ou des fonctionnalités à ajouter, n'hésitez pas à ouvrir une issue ou à soumettre une demande de tirage.

## License

Ce projet est sous la licence MIT. Voir le fichier [LICENSE](LICENSE.md) pour plus d'informations.

Si vous avez d'autres ajustements ou ajouts en tête, n'hésitez pas à demander !
