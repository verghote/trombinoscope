<?php
// activation du chargement dynamique des ressources
require $_SERVER['DOCUMENT_ROOT'] . "/include/autoload.php";

// génération d'un token pour garantir l'origine des appels vers les autres scripts du module
$token = Jeton::creer();

// alimentation de l'interface
$lesEtudiants = json_encode(Etudiant::getLesEtudiant());

// transmission des données à l'interface
$head =<<<EOD
<script >
    let lesEtudiants = $lesEtudiants;
    const token = '$token';
</script>
EOD;

// chargement de l'interface
require RACINE . "/include/interface.php";


