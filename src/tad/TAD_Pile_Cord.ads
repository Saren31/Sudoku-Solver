with TAD_Coordonnee; use TAD_Coordonnee;
package TAD_Pile_Cord is

   TAILLE_MAX : constant := 255;
   type Type_Pile_Cord is private ;

   PILE_VIDE : exception;
   PILE_PLEINE : exception;

   -- construit une pile vide
   function construirePile return Type_Pile_Cord;

   -- retourne VRAI si une pile est vide
   function estVide (pile : in Type_Pile_Cord) return Boolean;

   -- retourne l'element le plus récent de la pile
   function dernier (pile : in Type_Pile_Cord) return Type_Coordonnee;

   -- ajoute un élément à la pile
   function empiler (pile : in out Type_Pile_Cord ; e : in Type_Coordonnee) return Type_Pile_Cord;

   -- supprime l'element le plus recent de la pile
   function depiler (pile : in out Type_Pile_Cord) return Type_Pile_Cord;

private

   type Tableau is array (1 .. TAILLE_MAX) of Type_Coordonnee;

   type Type_Pile_Cord is record
      elements          : Tableau;
      nb_elements       : Integer   := 0;
   end record;

end TAD_Pile_Cord;
