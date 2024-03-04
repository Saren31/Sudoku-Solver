pragma Ada_2012;
package body TAD_Pile_Grille is

   --------------------
   -- construirePile --
   --------------------
   function construirePile return Type_Pile_Grille is
      p: Type_Pile_Grille;
   begin
      p.nb_elements:=0;
      return p;
   end construirePile;

   ------------
   -- empile --
   ------------
   function empiler (pile : in out Type_Pile_Grille; e: in Type_Grille) return Type_Pile_Grille is
   begin
      if pile.nb_elements=TAILLE_MAX then
         raise PILE_PLEINE;
      end if;
      pile.nb_elements:=pile.nb_elements+1;
      pile.elements(pile.nb_elements):=e;
      return pile ;
   end empiler;

   ------------
   -- depile --
   ------------
   function depiler (pile : in out Type_Pile_Grille) return Type_Pile_Grille is
   begin
      if pile.nb_elements=0 then
         raise PILE_VIDE;
      end if;
      pile.nb_elements:=pile.nb_elements-1;
      return pile;
   end depiler;

   -------------
   -- estVide --
   -------------
   function estVide (pile: in Type_Pile_Grille) return Boolean is
   begin
      return pile.nb_elements=0;
   end estVide;

   -------------
   -- dernier --
   -------------
   function dernier (pile: in Type_Pile_Grille) return Type_Grille is
   begin
      if pile.nb_elements=0 then
         raise PILE_VIDE;
      end if;
      return pile.elements(pile.nb_elements);
   end dernier;


end TAD_pile_Grille;
