<?php

class Etudiant
{


    public static function getLesEtudiant()
    {
        $sql = <<<EOD
           SELECT etudiant.id, nom, prenom , date_format(dateNaissance, '%d/%m/%Y') as dateNaissance, fichier, libelleCourt
            FROM etudiant, options
            WHERE etudiant.idOption = options.id
            ORDER BY nom, prenom;
EOD;
        $select = new Select();
        return  $select->getRows($sql);
    }
}