"use strict";

/* global lesEtudiants */

let row = document.createElement('div');
row.classList.add('row');
for (const etudiant of lesEtudiants) {
    let col = document.createElement('div');
    col.classList.add("col-xxl-2", "col-xl-2", "col-lg-3", "col-md-4", "col-sm-6", "col-12");
    let carte = document.createElement('div');
    carte.classList.add("card", "mb-3");

    let entete = document.createElement('div');
    entete.classList.add("card-header", "bg-secondary", "text-white", "text-center");
    entete.innerHTML = etudiant.nom + "<br>" + etudiant.prenom;
    carte.appendChild(entete);

    let corps = document.createElement('div');
    corps.classList.add("card-body", "text-center");
    let img = new Image();
    img.src = 'data/photoetudiant/' + etudiant.fichier;
    img.alt = "photo de l'étudiant";

    corps.appendChild(img);
    carte.appendChild(corps);

    let pied = document.createElement('div');
    pied.classList.add("card-footer", "text-muted", "text-center");
    pied.innerText = etudiant.libelleCourt;
    carte.appendChild(pied);
    col.appendChild(carte);
    row.appendChild(col);
}
document.getElementById('lesCartes').appendChild(row);

