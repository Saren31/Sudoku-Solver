package TAD_Pile is

   TAILLE_MAX : constant := 255;
   type Type_Pile is private ;

   PILE_VIDE : exception;
   PILE_PLEINE : exception;

   -- construit une pile vide
   function construirePile return Type_Pile;

   -- retourne VRAI si une pile est vide
   function estVide (pile : in Type_Pile) return Boolean;

   -- retourne l'element le plus récent de la pile
   function dernier (pile : in Type_Pile) return Integer;

   -- ajoute un élément à la pile
   function empiler (pile : in out Type_Pile ; e : in Integer) return Type_Pile;

   -- supprime l'element le plus recent de la pile
   function depiler (pile : in out Type_Pile) return Type_Pile;

private

   type Tableau is array (1 .. TAILLE_MAX) of Integer;

   type Type_Pile is record
      elements          : Tableau;
      nb_elements       : Integer   := 0;
   end record;

end TAD_Pile;
