function Progress-Bar {
    param (
        [int]$Duration
    )
    $current = 0
    $total = 50
    Write-Host -NoNewline "["
    while ($current -lt $total) {
        Write-Host -NoNewline "#"
        Start-Sleep -Milliseconds ($Duration / $total * 1000)
        $current++
    }
    Write-Host "]"
}

$PROJECT_NAME = Read-Host "Veuillez entrer le nom de votre projet"

if ([string]::IsNullOrWhiteSpace($PROJECT_NAME)) {
    Write-Host "Erreur : Vous devez fournir un nom pour votre projet."
    exit 1
}

$server_choice = Read-Host "Utilisez-vous XAMPP ou WAMP ? (entrez xampp ou wamp)"

if ($server_choice -eq 'xampp') {
    $SERVER_PATH = "C:\xampp\htdocs"
} elseif ($server_choice -eq 'wamp') {
    $SERVER_PATH = "C:\wamp\www"
} else {
    Write-Host "Erreur : Veuillez choisir entre xampp ou wamp."
    exit 1
}

$PROJECT_PATH = "$SERVER_PATH\$PROJECT_NAME"

if (Test-Path $PROJECT_PATH) {
    Write-Host "Erreur : Le projet '$PROJECT_NAME' existe déjà à l'emplacement '$PROJECT_PATH'."
    $choice = Read-Host "Voulez-vous choisir un autre nom de projet ? (y/n)"
    if ($choice -eq 'y' -or $choice -eq 'Y') {
        powershell.exe -File $MyInvocation.MyCommand.Path
    } else {
        Write-Host "Opération annulée. Le projet existe déjà."
        exit 1
    }
}

Write-Host "Création du projet '$PROJECT_NAME' dans '$SERVER_PATH'..."
Progress-Bar 5

composer create-project codeigniter4/appstarter $PROJECT_PATH | Out-Null

Set-Location -Path $PROJECT_PATH

Write-Host "Installation des dépendances..."
Progress-Bar 10

composer require nabcellent/codeigniter4-eloquent --with-all-dependencies | Out-Null

icacls "$PROJECT_PATH\writable" /grant Everyone:(OI)(CI)F

Rename-Item "$PROJECT_PATH\env" "$PROJECT_PATH\.env"

(Get-Content "$PROJECT_PATH\.env").replace('# CI_ENVIRONMENT = production', 'CI_ENVIRONMENT = development') | Set-Content "$PROJECT_PATH\.env"

(Get-Content "$PROJECT_PATH\app\Controllers\BaseController.php") -replace '(parent::initController\(\$request, \$response, \$logger\);)', '$0`n        service(''eloquent'');' | Set-Content "$PROJECT_PATH\app\Controllers\BaseController.php"

Write-Host "Configuration des fichiers et des permissions..."
Progress-Bar 3

Start-Process codium $PROJECT_PATH

Write-Host "`n"
Write-Host "+============================================================================+"
Write-Host "|                        Projet Créé avec Succès !                           |"
Write-Host "+============================================================================+"
Write-Host "|                                                                             "
Write-Host ("|  Projet          : {0,-5}" -f $PROJECT_NAME)
Write-Host ("|  Chemin          : {0,-40}" -f $PROJECT_PATH)
Write-Host ("|  Package         : {0,-36}" -f "codeigniter4-eloquent")
Write-Host ("|  Permissions     : {0,-30}" -f "writable défini sur 777")
Write-Host ("|  Fichier         : {0,-30}" -f ".env configuré")
Write-Host ("|  Ajouté          : {0,-36}" -f "service('eloquent')")
Write-Host "|                                                                             "
Write-Host "+============================================================================+"
Write-Host "|                Le projet est maintenant ouvert dans VSCodium.              |"
Write-Host "+============================================================================+"
Write-Host "`n"
