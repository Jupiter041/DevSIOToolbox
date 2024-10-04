#!/bin/bash
read -p "Veuillez entrer le nom de votre projet : " PROJECT_NAME


if [ -z "$PROJECT_NAME" ]; then
  echo "Erreur : Vous devez fournir un nom pour votre projet."
  exit 1
fi

PROJECT_PATH="$HOME/public_html/$PROJECT_NAME"


composer create-project codeigniter4/appstarter $PROJECT_PATH


cd $PROJECT_PATH


composer require nabcellent/codeigniter4-eloquent --with-all-dependencies

echo "Le projet '$PROJECT_NAME' a été créé avec succès dans '$PROJECT_PATH' et le package 'codeigniter4-eloquent' a été ajouté."
