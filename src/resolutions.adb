pragma Ada_2012;
package body resolutions is

   -----------------------
   -- estChiffreValable --
   -----------------------

   function estChiffreValable
     (g : in Type_Grille; v : Integer; c : Type_Coordonnee) return Boolean
   is
      ligne   : Boolean;
      colonne : Boolean;
      carre   : Boolean;
   begin
      if not caseVide (g, c) then
         raise CASE_NON_VIDE;
      else
         ligne :=
           appartientChiffre
             (obtenirChiffresDUneLigne (g, obtenirLigne (c)), v);
         colonne :=
           appartientChiffre
             (obtenirChiffresDUneColonne (g, obtenirColonne (c)), v);
         carre :=
           appartientChiffre
             (obtenirChiffresDUnCarre (g, obtenirCarre (c)), v);
         if not ligne and not colonne and not carre then
            return True;
         else
            return False;
         end if;
      end if;
   end estChiffreValable;

   -------------------------------
   -- obtenirSolutionsPossibles --
   -------------------------------

   function obtenirSolutionsPossibles
     (g : in Type_Grille; c : in Type_Coordonnee) return Type_Ensemble
   is
      ligne   : Type_Ensemble;
      colonne : Type_Ensemble;
      carre   : Type_Ensemble;
      res     : Type_Ensemble;
   begin
      if not caseVide (g, c) then
         raise CASE_NON_VIDE;
      else
         res     := construireEnsemble;
         ligne   := construireEnsemble;
         colonne := construireEnsemble;
         carre   := construireEnsemble;
         ligne   := obtenirChiffresDUneLigne (g, obtenirLigne (c));
         colonne := obtenirChiffresDUneColonne (g, obtenirColonne (c));
         carre   := obtenirChiffresDUnCarre (g, obtenirCarre (c));
         for i in 1 .. 9 loop
            if not appartientChiffre (ligne, i) and
              not appartientChiffre (colonne, i) and
              not appartientChiffre (carre, i)
            then
               ajouterChiffre (res, i);
            end if;
         end loop;
         return res;
      end if;
   end obtenirSolutionsPossibles;

   ------------------------------------------
   -- rechercherSolutionUniqueDansEnsemble --
   ------------------------------------------

   function rechercherSolutionUniqueDansEnsemble
     (resultats : in Type_Ensemble) return Integer
   is
      res : Integer;
   begin
      if nombreChiffres (resultats) = 0 then
         raise ENSEMBLE_VIDE;
      elsif nombreChiffres (resultats) = 1 then
         for i in 1 .. 9 loop
            if appartientChiffre (resultats, i) then
               res := i;
            end if;
         end loop;
         return res;
      else
         raise PLUS_DE_UN_CHIFFRE;
      end if;
   end rechercherSolutionUniqueDansEnsemble;

   ----------------------
   -- resolutionSimple --
   ----------------------

   procedure resolutionSimple
     (g : in out Type_Grille; trouve : out Boolean; stop : out Boolean)
   is
      cord      : Type_Coordonnee;
      resultats : Type_Ensemble;
      solution  : Integer;
      i         : Integer := 1;
      j         : Integer := 1;
   begin
      stop := False;
      while i <= 9 loop
         while j <= 9 loop
            cord := construireCoordonnees (i, j);
            if caseVide (g, cord) then
               resultats := obtenirSolutionsPossibles (g, cord);
               if nombreChiffres (resultats) = 1 then
                  solution := rechercherSolutionUniqueDansEnsemble (resultats);
                  fixerChiffre (g, cord, solution);
                  i := 1;
                  j := 1;
               elsif nombreChiffres (resultats) = 0 then
                  i    := 10;
                  j    := 10;
                  stop := True;
               else
                  j := j + 1;
               end if;
            else
               j := j + 1;
            end if;
         end loop;
         i := i + 1;
         j := 1;
      end loop;
      if nombreChiffres (g) = 81 then
         trouve := True;
      else
         trouve := False;
      end if;
   end resolutionSimple;

   --------------------
   -- resoudreSudoku --
   --------------------

   procedure resoudreSudoku (g : in out Type_Grille; trouve : out Boolean) is
      Pile_Grilles : Type_Pile_Grille := construirePile;
      Pile_Cords   : Type_Pile_Cord   := construirePile;
      Pile_Valeurs : Type_Pile        := construirePile;
      k            : Integer          := 1;
      l            : Integer          := 1;
      resultats    : Type_Ensemble;
      cord         : Type_Coordonnee;
      stop         : Boolean          := False;
   begin
      resolutionSimple (g, trouve, stop);
      while trouve = False loop
         while k <= 9 loop
            while l <= 9 loop
               cord := construireCoordonnees (k, l);
               if caseVide (g, cord) then
                  resultats    := obtenirSolutionsPossibles (g, cord);
                  Pile_Grilles := empiler (Pile_Grilles, g);
                  Pile_Cords   := empiler (Pile_Cords, cord);
                  Pile_Valeurs := empiler (Pile_Valeurs, 0);
                  for z in 1 .. 9 loop
                     if appartientChiffre (resultats, z) then
                        Pile_Valeurs := empiler (Pile_Valeurs, z);
                     end if;
                  end loop;
                  fixerChiffre (g, cord, dernier (Pile_Valeurs));
                  resolutionSimple (g, trouve, stop);
                  while stop = True loop
                     Pile_Valeurs := depiler (Pile_Valeurs);
                     while dernier (Pile_Valeurs) = 0 loop
                        Pile_Valeurs := depiler (Pile_Valeurs);
                        Pile_Valeurs := depiler (Pile_Valeurs);
                        Pile_Cords   := depiler (Pile_Cords);
                        Pile_Grilles := depiler (Pile_Grilles);
                     end loop;
                     g    := copierGrille (dernier (Pile_Grilles));
                     cord :=
                       construireCoordonnees
                         (obtenirLigne (dernier (Pile_Cords)),
                          obtenirColonne (dernier (Pile_Cords)));
                     fixerChiffre (g, cord, dernier (Pile_Valeurs));
                     resolutionSimple (g, trouve, stop);
                  end loop;
                  l := obtenirColonne (dernier (Pile_Cords));
                  k := obtenirLigne (dernier (Pile_Cords));
               else
                  l := l + 1;
               end if;
            end loop;
            k := k + 1;
            l := 1;
         end loop;
      end loop;
      trouve := True;
   end resoudreSudoku;
end resolutions;
