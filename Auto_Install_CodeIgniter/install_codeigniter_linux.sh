#!/bin/bash

progress_bar() {
    local duration=$1
    local current=0
    local total=50
    echo -n "["
    while [ $current -lt $total ]; do
        printf "#"
        sleep $((duration / total))
        current=$((current + 1))
    done
    echo "]"
}

read -p "Veuillez entrer le nom de votre projet : " PROJECT_NAME

if [ -z "$PROJECT_NAME" ]; then
  echo "Erreur : Vous devez fournir un nom pour votre projet."
  exit 1
fi

PROJECT_PATH="$HOME/public_html/$PROJECT_NAME"

if [ -d "$PROJECT_PATH" ]; then
  echo "Erreur : Le projet '$PROJECT_NAME' existe déjà à l'emplacement '$PROJECT_PATH'."
  read -p "Voulez-vous choisir un autre nom de projet ? (y/n) : " choice
  if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    exec "$0"
  else
    echo "Opération annulée. Le projet existe déjà."
    exit 1
  fi
fi

echo "Création du projet '$PROJECT_NAME'..."
progress_bar 5

composer create-project codeigniter4/appstarter "$PROJECT_PATH" > /dev/null 2>&1

cd "$PROJECT_PATH" || exit

echo "Installation des dépendances..."
progress_bar 10

composer require nabcellent/codeigniter4-eloquent --with-all-dependencies > /dev/null 2>&1

chmod -R 777 "$PROJECT_PATH/writable"

mv "$PROJECT_PATH/env" "$PROJECT_PATH/.env" > /dev/null 2>&1

sed -i 's/^#\s*CI_ENVIRONMENT\s*=\s*production/CI_ENVIRONMENT = development/' "$PROJECT_PATH/.env" > /dev/null 2>&1

sed -i "/parent::initController(\$request, \$response, \$logger);/a \ \ \ \ \ \ \ \ service('eloquent');" "$PROJECT_PATH/app/Controllers/BaseController.php" > /dev/null 2>&1

echo "Configuration des fichiers et des permissions..."
progress_bar 3

codium "$PROJECT_PATH" > /dev/null 2>&1

echo -e "\n"
echo "+============================================================================+"
echo "|                        Projet Créé avec Succès !                           |"
echo "+============================================================================+"
echo "|                                                                             "
printf "|  Projet          : \e[1;32m'%-5s'\e[0m \n" "$PROJECT_NAME"
printf "|  Chemin          : \e[1;34m'%-40s'\e[0m \n" "$PROJECT_PATH"
printf "|  Package         : \e[1;36m'%-36s \e[0m \n" "codeigniter4-eloquent'"
printf "|  Permissions     : \e[1;33m'%-30s \e[0m \n" "writable' défini sur 777"
printf "|  Fichier         : \e[1;35m'%-30s \e[0m \n" ".env' configuré"
printf "|  Ajouté          : \e[1;35m'%-36s \e[0m \n" "service('eloquent');'"
echo "|                                                                             "
echo "+============================================================================+"
echo "|                Le projet est maintenant ouvert dans VSCodium.              |"
echo "+============================================================================+"
echo -e "\n"
