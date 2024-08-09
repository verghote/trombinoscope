<?php
require $_SERVER['DOCUMENT_ROOT'] .  '/include/autoload.php';

// chargement des données
$lesLignes = Etudiant::getLesEtudiant();

//paramètres de l'impression


// création de l'objet PDF avec initialisation de l'entête et du pied de page


// Génération du corps du document
// $pdf->setY(50);

