<?php

class Impression
{

    /**
     * @return PDF
     */
    public static function createPdf($titre = '')
    {
        // création du pdf et initialisation de la première page
        $pdf = new PDF('P', 'mm', 'A4');
        $pdf->SetFont($pdf->getPolice(), '', $pdf->getTaillePolice());
        $pdf->SetFillColor(255, 255, 255); // 237 gris
        $pdf->SetTextColor(0);
        $pdf->SetDrawColor(0, 0, 0);
        $pdf->SetLineWidth(0.1);
        $pdf->SetMargins(10, 10, 10);  // G, H, D
        $pdf->setHeader("", "../img/logo.png");
        $uneDate = new DateFr();
        $txtPied = mb_convert_encoding("Date d'édition : " . $uneDate->toFormatLong(), 'latin1');
        $pdf->setFooter($txtPied);
        $pdf->setTitre(mb_convert_encoding($titre, 'latin1'));
        $pdf->AliasNbPages();
        $pdf->AddPage();
        return $pdf;
    }
}
