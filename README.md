# Étude de la génération de documents PDF

L'application consiste à générer deux documents PDF à partir d'informations contenues dans la table MySQL etudiant

Elle met en œuvre le framework [FPDF](http://www.fpdf.org/) pour la génération des documents PDF

Ce framework est une classe PHP qui permet de générer des documents PDF.
Il est intégré dans le projet dans le répertoire classetechnique.
La classe PDF est une classe dérivée de la classe FPDF dans laquelle on a ajouté des méthodes pour personnaliser l'entête et le pied de page et générer des tableaux.

* Le premier document est la liste des étudiants générée sous la forme d'un tableau
* Le second document est le trombinoscope de la classe

Pour cloner ce référentiel sans oublier les sous-modules, utiliser la commande suivante :

```bash
  git clone add https://github.com/verghote/trombinoscope.git --recurse-submodules
```

Pour automatiser le clonage du référentiel et l'ajout du repertoire vendor utilise le script trombinoscope.ps1