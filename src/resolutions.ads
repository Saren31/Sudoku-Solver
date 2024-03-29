with TAD_Coordonnee;   use TAD_Coordonnee;
with TAD_ensemble;     use TAD_ensemble;
with TAD_grilleSudoku; use TAD_grilleSudoku;
with Ada.Text_IO; use Ada.Text_IO;
 with TAD_Pile; use TAD_Pile;
 with TAD_Pile_Cord; use TAD_Pile_Cord;
 with TAD_Pile_Grille; use TAD_Pile_Grille;
package resolutions is

   PLUS_DE_UN_CHIFFRE : exception;
   CASE_NON_VIDE : exception;
   ENSEMBLE_VIDE : exception;

   -- retourne VRAI si la valeur v peut rentrer dans la case c de la grille g
   -- et FAUX sinon
   -- nécessite la case c est vide
   -- lève l'exception CASE_NON_VIDE si la case n'est pas vide
   function estChiffreValable
     (g : in Type_Grille;
      v :    Integer;
      c :    Type_Coordonnee) return Boolean;

   -- retourne l'ensemble des valeurs possibles pour la case c de la grille g
   -- necessite que la case c soit vide
   -- lève l'exception CASE_NON_VIDE si la case étudiée n'est pas vide
   function obtenirSolutionsPossibles
     (g : in Type_Grille;
      c : in Type_Coordonnee) return Type_Ensemble;

   -- retourne la valeur unique de v dans le tableau resultats
   -- nécessite qu'il n'y ait qu'un seul chiffre dans resultats
   -- lève l'exception PLUS_DE_UN_CHIFFRE s'il y a plus d'un chiffre dans resultats
   -- lève l'exception ENSEMBLE_VIDE si résultat est vide
   function rechercherSolutionUniqueDansEnsemble
     (resultats : in Type_Ensemble) return Integer;

   -- remplit toutes les cases ou il n'y a qu'une solution possible dans la grille g
   -- si la grille est complete, alors Trouve est a VRAI
   -- sinon Trouve est a FAUX
   -- si il n'y a aucune solution pour une case alors stop est a VRAI et le programme s'arrete
   procedure resolutionSimple
     (g      : in out Type_Grille;
      trouve :    out Boolean;
     stop : out Boolean);

   -- si la solution a ete trouve pour la grille g, alors Trouve est a VRAI et
   -- la grille est complete
   -- sinon Trouve est a FAUX et la grille n'a aucune valeur significative
   -- parcours la grille
   procedure resoudreSudoku
     (g      : in out Type_Grille;
      trouve :    out Boolean);

end resolutions;
