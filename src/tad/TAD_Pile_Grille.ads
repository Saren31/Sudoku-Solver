with TAD_grilleSudoku; use TAD_grilleSudoku;
package TAD_Pile_Grille is

   TAILLE_MAX : constant := 255;
   type Type_Pile_Grille is private ;

   PILE_VIDE : exception;
   PILE_PLEINE : exception;

   -- construit une pile vide
   function construirePile return Type_Pile_Grille;

   -- retourne VRAI si une pile est vide
   function estVide (pile : in Type_Pile_Grille) return Boolean;

   -- retourne l'element le plus récent de la pile
   function dernier (pile : in Type_Pile_Grille) return Type_Grille;

   -- ajoute un élément à la pile
   function empiler (pile : in out Type_Pile_Grille ; e : in Type_Grille) return Type_Pile_Grille;

   -- supprime l'element le plus recent de la pile
   function depiler (pile : in out Type_Pile_Grille) return Type_Pile_Grille;

private

   type Tableau is array (1 .. TAILLE_MAX) of Type_Grille;

   type Type_Pile_Grille is record
      elements          : Tableau;
      nb_elements       : Integer   := 0;
   end record;

end TAD_Pile_Grille;
