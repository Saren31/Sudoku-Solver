pragma Ada_2012;
package body TAD_grilleSudoku is

   ----------------------
   -- construireGrille --
   ----------------------

   function construireGrille return Type_Grille is
      grille : Type_Grille;
   begin
      for i in 1 .. 9 loop
         for j in 1 .. 9 loop
            grille (i, j) := 0;
         end loop;
      end loop;
      return grille;
   end construireGrille;

   --------------
   -- caseVide --
   --------------

   function caseVide
     (g : in Type_Grille; c : in Type_Coordonnee) return Boolean
   is
   begin
      if g (obtenirLigne (c), obtenirColonne (c)) = 0 then
         return True;
      else
         return False;
      end if;

   end caseVide;

   --------------------
   -- obtenirChiffre --
   --------------------

   function obtenirChiffre
     (g : in Type_Grille; c : in Type_Coordonnee) return Integer
   is
   begin
      if g (obtenirLigne (c), obtenirColonne (c)) = 0 then
         raise OBTENIR_CHIFFRE_NUL;
      else
         return g (obtenirLigne (c), obtenirColonne (c));
      end if;

   end obtenirChiffre;

   --------------------
   -- nombreChiffres --
   --------------------

   function nombreChiffres (g : in Type_Grille) return Integer is
      res : Integer := 0;
   begin
      for i in 1 .. 9 loop
         for j in 1 .. 9 loop
            if g (i, j) /= 0 then
               res := res + 1;
            end if;
         end loop;
      end loop;
      return res;

   end nombreChiffres;

   ------------------
   -- fixerChiffre --
   ------------------

   procedure fixerChiffre
     (g : in out Type_Grille; c : in Type_Coordonnee; v : in Integer)
   is
   begin
      g (obtenirLigne (c), obtenirColonne (c)) := v;
   end fixerChiffre;

   ---------------
   -- viderCase --
   ---------------

   procedure viderCase (g : in out Type_Grille; c : in out Type_Coordonnee) is
   begin
      g (obtenirLigne (c), obtenirColonne (c)) := 0;
   end viderCase;

   ----------------
   -- estRemplie --
   ----------------

   function estRemplie (g : in Type_Grille) return Boolean is
   begin
      if nombreChiffres (g) = 81 then
         return True;
      else
         return False;
      end if;
   end estRemplie;

   ------------------------------
   -- obtenirChiffresDUneLigne --
   ------------------------------

   function obtenirChiffresDUneLigne
     (g : in Type_Grille; numLigne : in Integer) return Type_Ensemble
   is
      res : Type_Ensemble;
      v   : Integer;
      c   : Type_Coordonnee;
   begin
      res := construireEnsemble;
      for i in 1 .. 9 loop
         c := construireCoordonnees (numLigne, i);
         if not caseVide(g,c) then
            v := obtenirChiffre (g, c);
            ajouterChiffre (res, v);
         end if;
      end loop;
      return res;
   end obtenirChiffresDUneLigne;

   --------------------------------
   -- obtenirChiffresDUneColonne --
   --------------------------------

   function obtenirChiffresDUneColonne
     (g : in Type_Grille; numColonne : in Integer) return Type_Ensemble
   is
      res : Type_Ensemble;
      v   : Integer;
      c   : Type_Coordonnee;
   begin
      res := construireEnsemble;
      for i in 1 .. 9 loop
         c := construireCoordonnees (i, numColonne);
         if not caseVide(g,c) then
            v := obtenirChiffre (g, c);
            ajouterChiffre (res, v);
         end if;
      end loop;
      return res;
   end obtenirChiffresDUneColonne;

   -----------------------------
   -- obtenirChiffresDUnCarre --
   -----------------------------

   function obtenirChiffresDUnCarre
     (g : in Type_Grille; numCarre : in Integer) return Type_Ensemble
   is
      res      : Type_Ensemble;
      v        : Integer;
      c        : Type_Coordonnee;
   begin
      res := construireEnsemble;
      c := obtenirCoordonneeCarre(numCarre);
      for i in 0..2 loop
         c := construireCoordonnees (obtenirLigne(c)+i, obtenirColonne(c));
         if not caseVide(g,c) then
            v := obtenirChiffre(g,c);
            ajouterChiffre(res,v);
         end if;
         if i /= 2 then
            c := construireCoordonnees (obtenirLigne(c)-i, obtenirColonne(c));
         end if;
      end loop;
      c := construireCoordonnees (obtenirLigne(c)-2, obtenirColonne(c)+1);
      for i in 0..2 loop
         c := construireCoordonnees (obtenirLigne(c)+i, obtenirColonne(c));
         if not caseVide(g,c) then
            v := obtenirChiffre(g,c);
            ajouterChiffre(res,v);
         end if;
         if i /= 2 then
            c := construireCoordonnees (obtenirLigne(c)-i, obtenirColonne(c));
         end if;
      end loop;
      c := construireCoordonnees (obtenirLigne(c)-2, obtenirColonne(c)+1);
      for i in 0..2 loop
         c := construireCoordonnees (obtenirLigne(c)+i, obtenirColonne(c));
         if not caseVide(g,c) then
            v := obtenirChiffre(g,c);
            ajouterChiffre(res,v);
         end if;
         if i /= 2 then
            c := construireCoordonnees (obtenirLigne(c)-i, obtenirColonne(c));
         end if;
      end loop;
      return res;
   end obtenirChiffresDUnCarre;

   function copierGrille
     (g : in Type_Grille) return Type_Grille
   is
      g2 : Type_Grille;
   begin
      for i in 1..9 loop
         for j in 1..9 loop
            g2(i,j) := g(i,j);
         end loop;
      end loop;
      return g2;
   end copierGrille;
end TAD_grilleSudoku;
