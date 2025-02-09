<# 1 #>
Set-Location C:\
New-Item -ItemType Directory -Name kprod
Set-Location kprod
New-Item -ItemType Directory -Name Main
New-Item -ItemType Directory -Name Second
Set-Location Main
New-Item -ItemType File -Name test.txt
Set-Location ..\Second
Move-Item ..\Main\test.txt .
Set-Location ..\Main
Copy-Item ..\Second\test.txt .
Remove-Item ..\Second -Recurse
Set-Location .. 
Rename-Item Main Main_new 

<# 2 #>
Set-Location Env:
New-Item -Path "MEWO-promo" -Value "SLAM"
Set-Location "C:/"
Get-ChildItem Env:Mewo-promo
Remove-Item Env:Mewo-promo

<# 3 #>
$operation1 = 3+8*3
$operation2 = (3+8)*3 
write-host = "Le resultat de l'opération 1 est : $operation1"
write-host = "Le resultat de l'opération 2 est : $operation2"

<# 4 #>
$ExpReg = "^(2019: 01/03 - save ok|2020: 04/01 -save nok)$"

# Chaînes à tester
$string1 = "2019: 01/03 - save ok"
$string2 = "2020: 04/01 -save nok"
$string3 = "2018: 12/12 - save ok"

#test -match chaine 1
if ($string1 -match $ExpReg) {
    Write-host "`$string1 correspond à l'expression régulière"
} else {
    Write-host "`$string1 ne correspond pas à l'expression régulière"
}

#test -match chaine 2 
if ($string2 -match $ExpReg) {
    Write-host "`$string2 correspond à l'expression régulière"
} else {
    Write-Output "`$string2 ne correspond pas à l'expression régulière"
}

#test -nomatch chaine 3
if ($string3 -notmatch $ExpReg) {
    Write-host "`$string3 ne correspond pas à l'expression régulière"
} else {
    Write-host "`$string3 correspond à l'expression régulière"
}

<# 5 #>
$regex = '^((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])\.){3}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])$'

$ipAddress = "192.168.0.1"

if ($ipAddress -match $regex) {
    Write-Host "IP valide"
} else {
    Write-Host "IP invalide"
}

<# 6 #>
[int[]]$Table1 = @(1..100)

[array]$alphabet = [char[]](65..90)

[char[]]$Table2 = $alphabet

$Table1[0,1]
$Table2[0,1]

$Table1.Length
$Table2.Length

<# 7 #>
$Folder = "C:\MEWO"
$File = "C:\MEWO\test.txt"
$x = @"
Name : Lukas
Version : 1.0
Description : Fichier d'essaie 
"@
 
 
if (Test-Path $Folder) {
    Write-Host "Le dossier existe déjà."
} else {
    Write-Host "Le dossier n'existe pas. Création du dossier."
    New-Item -ItemType Directory -Path $Folder
}

Set-Location $Folder

if (Test-Path $File) {
    Write-Host "Le fichier existe déjà."
} else {
    Write-Host "Le fichier n'existe pas. Création du fichier."
    New-Item -ItemType File -Path $File -Value $x
}

$Contenu = Get-Content -Path $File

$Ligne = $Contenu | Select-String -Pattern "^Name :"
if ($Ligne) {
    $Nom = $Ligne -replace "^Name : ", ""
} else {
    Write-Host "Aucun nom trouvé dans le fichier."
    exit
}

$NomEntree = Read-Host "Veuillez entrer un mot"

if ($NomEntree -eq $Nom) {
    Write-Host "Noms identiques."
} else {
    Write-Host "Noms différents."
}