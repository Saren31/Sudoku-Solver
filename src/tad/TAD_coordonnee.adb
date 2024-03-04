pragma Ada_2012;
with Ada.Text_IO; use Ada.Text_IO;
package body TAD_Coordonnee is

   ---------------------------
   -- construireCoordonnees --
   ---------------------------

   function construireCoordonnees
     (ligne : Integer; colonne : Integer) return Type_Coordonnee
   is
      coordonnee : Type_Coordonnee;
   begin
      coordonnee.ligne   := ligne;
      coordonnee.colonne := colonne;
      return coordonnee;
   end construireCoordonnees;

   ------------------
   -- obtenirLigne --
   ------------------

   function obtenirLigne (c : Type_Coordonnee) return Integer is
      ligne : Integer;
   begin
      ligne := c.ligne;
      return ligne;
   end obtenirLigne;

   --------------------
   -- obtenirColonne --
   --------------------

   function obtenirColonne (c : Type_Coordonnee) return Integer is
      colonne : Integer;
   begin
      colonne := c.colonne;
      return colonne;
   end obtenirColonne;

   ------------------
   -- obtenirCarre --
   ------------------

   function obtenirCarre (c : Type_Coordonnee) return Integer is
      Nbrc : Integer;
   begin
      Nbrc := (3 * ((c.ligne - 1) / 3)) + ((c.colonne - 1) / 3 + 1);
      return Nbrc;
   end obtenirCarre;

   ----------------------------
   -- obtenirCoordonneeCarre --
   ----------------------------

   function obtenirCoordonneeCarre (numCarre : Integer) return Type_Coordonnee
   is
      c : Type_Coordonnee;
   begin
      if numCarre = 1 then
         c.ligne   := 1;
         c.colonne := 1;
      elsif numCarre = 2 then
         c.ligne   := 1;
         c.colonne := 4;
      elsif numCarre = 3 then
         c.ligne   := 1;
         c.colonne := 7;
      elsif numCarre = 4 then
         c.ligne   := 4;
         c.colonne := 1;
      elsif numCarre = 5 then
         c.ligne   := 4;
         c.colonne := 4;
      elsif numCarre = 6 then
         c.ligne   := 4;
         c.colonne := 7;
      elsif numCarre = 7 then
         c.ligne   := 7;
         c.colonne := 1;
      elsif numCarre = 8 then
         c.ligne   := 7;
         c.colonne := 4;
      else
         c.ligne   := 7;
         c.colonne := 7;
      end if;
      return c;
   end obtenirCoordonneeCarre;
end TAD_Coordonnee;
