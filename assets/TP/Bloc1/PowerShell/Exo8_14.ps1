<# 8 #>
[int]$joueur1 = Read-Host "Joueur 1, rentrez un chiffre entre 1 et 10"
if (($joueur1 -gt 10) -or ($joueur1 -lt 1)){
    return "Le chiffre n'est pas compris entre 1 et 10"
}

[int]$joueur2 = Read-Host "Joueur 2, rentrez un chiffre entre 1 et 10"
if (($joueur2 -gt 10) -or ($joueur2 -lt 1)){
    return "2Le chiffre n'est pas compris entre 1 et 10"
}

if ($joueur1 -eq $joueur2) {
    echo "Gagné, le joueur 2 à trouver le bon chiffre"
} elseif ($joueur1 -gt $joueur2) {
    echo "Perdu, le joueur 2 à trouver le mauvais chiffre et à un chiffre plus petit"
} else {
    echo "Perdu, le joueur 2 à trouver le mauvais chiffre et à un chiffre plus grand"
}

<# 9 #>
$var=0
while($var -ne 10 ){
$var++
echo $var
}

<# 10 #>
$var = 0
do{
    echo $var
    $var++
} while($var -ne 10 )
 
<# 11 #>
[int]$test = 0
Do
{$test++
echo $test}
While (Get-Process -name "phpstorm64" -ErrorAction SilentlyContinue)
echo "l'appli est eteinte"

<# 12 #>
Do{
    [int]$var = Read-Host "Rentrez un chiffre"
    }
Until (($var -ge 1) -and ($var -le 10))

<# 13 #>
$disk = Get-WmiObject Win32_LogicalDisk

foreach ($disk in $disk) {

[int]$Total = [math]::Round($disk.Size / 1GB, 2)
[int]$Disponible = [math]::Round($disk.FreeSpace / 1GB, 2)

 Write-Host "Votre espace total sur le disque est de $Total Go"
 Write-Host "L'espace dispo sur le disque est de $Disponible Go"
}

<# 14 #>
# Défini les questions et les réponses des deux sujets
$questionsFoot = @(
    @{question="Quel pays a remporte la Coupe du Monde de la FIFA 2018 ?"; reponse="France"},
    @{question="Qui est considere comme le meilleur buteur de tous les temps ?"; reponse="Pele"},
    @{question="Quel club a remporte le plus de Ligues des Champions ?"; reponse="Real Madrid"},
    @{question="Qui a gagne le Ballon d'Or en 2021 ?"; reponse="Lionel Messi"},
    @{question="Quelle equipe nationale est surnommee 'La Selecao' ?"; reponse="Bresil"},
    @{question="Qui a remporte l'Euro 2016 ?"; reponse="Portugal"},
    @{question="Quel joueur a le plus de Ballons d'Or ?"; reponse="Lionel Messi"},
    @{question="Quel est le surnom de l'equipe nationale d'Argentine ?"; reponse="Albiceleste"},
    @{question="Quel club est connu sous le nom de 'Les Gunners' ?"; reponse="Arsenal"},
    @{question="Quel est le plus grand club francais ?"; reponse="OM"}
)

$questionsCobraKai = @(
    @{question="Quel est le prenom du createur de Cobra Kai ?"; reponse="Johnny"},
    @{question="Quel est le prenom de l'adversaire principal de Johnny dans la serie ?"; reponse="Daniel"},
    @{question="Qui est le mentor de Johnny ?"; reponse="Kreese"},
    @{question="Quelle est la devise de Cobra Kai ?"; reponse="Pas de pitie"},
    @{question="Quel personnage rejoint Cobra Kai dans la saison 2 ?"; reponse="Kreese"},
    @{question="Comment s'appelle le dojo de Daniel ?"; reponse="Miyagi-Do"},
    @{question="Quel est le prenom du fils de Johnny ?"; reponse="Robby"},
    @{question="Qui est l'eleve principal de Johnny au debut de la serie ?"; reponse="Miguel"},
    @{question="Quel ancien rival de Daniel revient dans la saison 3 ?"; reponse="Chozen"},
    @{question="Comment s'appelle la fille de Daniel ?"; reponse="Samantha"}
)

function PoserQuestion {
    # recup les infos pour le nombre de question attendu et question
    param (
        [string]$questionTexte,
        [string]$reponseAttendue
    )
    # Nombre de tentatives restantes pour chaque question
    $tentativesRestantes = 3
    $bonneReponseTrouvee = $false

    # Boucle jusqu'à ce que les tentatives soient épuisées ou que la bonne réponse soit trouvée
    while ($tentativesRestantes -gt 0 -and -not $bonneReponseTrouvee) {
        # Lire la réponse de l'utilisateur
        $reponseUtilisateur = Read-Host $questionTexte
        # Vérifie si la réponse est correct
        if ($reponseUtilisateur -eq $reponseAttendue) {
            Write-Host "Correct !" -ForegroundColor Green
            $bonneReponseTrouvee = $true
        } else {
            # Décrémente les tentatives restantes
            $tentativesRestantes--
            if ($tentativesRestantes -gt 0) {
                Write-Host "Incorrect. Il vous reste $tentativesRestantes tentatives." -ForegroundColor Red
            } else {
                Write-Host "Incorrect. La bonne reponse etait '$reponseAttendue'." -ForegroundColor Red
            }
        }
    }

    return $bonneReponseTrouvee
}

function JouerQuiz {
    # recup les infos pour le nombre de question attendu et question
    param (
        [array]$listeQuestions,
        [int]$nombreQuestions
    )
    # Initialise le score
    $scoreUtilisateur = 0
    # Sélection des questions aléatoire
    $questionsSelectionnees = $listeQuestions | Get-Random -Count $nombreQuestions

    # Pose question sélectionné
    foreach ($questionObjet in $questionsSelectionnees) {
        $questionTexte = $questionObjet.question
        $reponseAttendue = $questionObjet.reponse
        if (PoserQuestion -questionTexte $questionTexte -reponseAttendue $reponseAttendue) {
            $scoreUtilisateur++
        }
    }

    # Affiche le score 
    Write-Host "Votre score est $scoreUtilisateur sur $nombreQuestions."
}

function LancerJeu {
    do {
        # choix du sujet
        $sujetChoisi = Read-Host "Choisissez un sujet: Foot ou Cobra Kai"
        # choix niveau
        $niveauChoisi = Read-Host "Choisissez un niveau: 1 (3 questions), 2 (5 questions), 3 (10 questions)"
        switch ($sujetChoisi.ToLower()) {
            "foot" {
                # Foot et niv choisi
                switch ($niveauChoisi) {
                    1 { JouerQuiz -listeQuestions $questionsFoot -nombreQuestions 3 }
                    2 { JouerQuiz -listeQuestions $questionsFoot -nombreQuestions 5 }
                    3 { JouerQuiz -listeQuestions $questionsFoot -nombreQuestions 10 }
                    default { Write-Host "Niveau invalide. Veuillez choisir 1, 2, ou 3." }
                }
            }
            "cobra kai" {
                # Cobra Kai et niveau choisi
                switch ($niveauChoisi) {
                    1 { JouerQuiz -listeQuestions $questionsCobraKai -nombreQuestions 3 }
                    2 { JouerQuiz -listeQuestions $questionsCobraKai -nombreQuestions 5 }
                    3 { JouerQuiz -listeQuestions $questionsCobraKai -nombreQuestions 10 }
                    default { Write-Host "Niveau invalide. Veuillez choisir 1, 2, ou 3." }
                }
            }
            # Erreur
            default {
                Write-Host "Sujet invalide. Veuillez choisir 'Foot' ou 'Cobra Kai'."
            }
        }
        # fonction rejouer
        $rejouerChoisi = Read-Host "Voulez-vous rejouer ? (o/n)"
    } while ($rejouerChoisi -eq 'o')
}

# Lance le jeu
LancerJeu
