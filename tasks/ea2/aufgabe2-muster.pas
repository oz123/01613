program merge (input, output);
{ liest ohne Eingabeueberpruefung zwei sortierte Felder mit 
  integer-Zahlen ein; beide Felder werden in Feld sortiert
  zusammengefuegt; das Ergebnis wird ausgegeben; ist die Ein-
  gabe unsortiert, so ist das Ergebnisfeld nicht sortiert }
  const
  GRENZE1 = 5;
  GRENZE2 = 8;
  GRENZE1PLUS1 = 6;
  GRENZE2PLUS1 = 9;
  GRENZE = 13; { GRENZE1 + GRENZE2 }
        
  type
  tIndex1 = 1..GRENZE1;
  tIndex2 = 1..GRENZE2;
  tIndex = 1..GRENZE;
  tIndex1Plus1 = 1..GRENZE1PLUS1;
  tIndex2Plus1 = 1..GRENZE2PLUS1;
  tIndexPlus1 = 1..GRENZE + 1;
  tFeld1 = array [tIndex1] of integer;
  tFeld2 = array [tIndex2] of integer;
  tFeld = array [tIndex] of integer;

  var
  Feld1 : tFeld1;
  Feld2 : tFeld2;
  Feld : tFeld;
  i : tIndex1Plus1;
  j : tIndex2Plus1;
  k : tIndexPlus1;

begin
  { sortierte Felder einlesen }
  writeln ('Bitte', GRENZE1:2, ' Werte des ersten Feldes ',
                                         'sortiert eingeben!');
  for i := 1 to GRENZE1 do
    readln (Feld1[i]);
  writeln ('Bitte', GRENZE2:2, ' Werte des zweiten Feldes ',
           'sortiert eingeben!');
  for j := 1 to GRENZE2 do
    readln (Feld2[j]);

  { Verschmelzungsprozess beginnen }
  i := 1;
  j := 1;
  k := 1;
  while (i <= GRENZE1) and (j <= GRENZE2) do
    if Feld1[i] < Feld2[j] then
    begin
      Feld[k] := Feld1[i];
      i := i + 1;
      k := k + 1
    end
    else
    begin
      Feld[k] := Feld2[j];
      j := j + 1;
      k := k + 1
    end; { while-Schleife }
  { restliche Elemente des noch nicht komplett abgearbeiteten
    Feldes hinter dem Maximum der zuletzt verglichenen
    Werte anhaengen }
  if i > GRENZE1 then { Feld1 ist erschoepft, restliche
                        Elemente von Feld2 angefuegen }
    while j <= GRENZE2 do
    begin
      Feld[k] := Feld2[j];
      k := k + 1;
      j := j + 1
    end
  else { Feld2 ist erschoepft, restliche Elemente von
         Feld1 angefuegen }
    while i <= GRENZE1 do
    begin
      Feld[k] := Feld1[i];
      k := k + 1;
      i := i + 1
    end;

  writeln ('Das Ergebnisfeld ist:');
  for k := 1 to GRENZE do
    write (Feld[k]:8);
  writeln
end.
