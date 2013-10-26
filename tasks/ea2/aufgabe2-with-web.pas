{$B+}
{$R+}

program merge (input, output);
{ liest ohne Eingabeueberpruefung zwei sortierte Felder mit
  integer-Zahlen ein; beide Felder werden in Feld sortiert
  zusammengefuegt; das Ergebnis wird ausgegeben; ist die Ein-
  gabe unsortiert, so ist das Ergebnisfeld nicht sortiert }

  const
  GRENZE1 = 5;
  GRENZE2 = 8;
  GRENZE = 13; { GRENZE1 + GRENZE2 }
  GRENZE1PLUS1 = 6;
  GRENZE2PLUS1 = 9;
  GRENZEPLUS1 = 14;

  type
  tIndex1 = 1..GRENZE1;
  tIndex2 = 1..GRENZE2;
  tIndex = 1..GRENZE;
  tIndex1Plus1 = 1..GRENZE1PLUS1;
  tIndex2Plus1 = 1..GRENZE2PLUS1;
  tIndexPlus1 = 1..GRENZEPLUS1;
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
  fi : tIndex;
  push  : integer;

  function Find2Push(i, Zahl: integer; Feld: tFeld): integer;
  {Find how many elements in an array need to be 
  * right shifted
  * i - The number of cells to check 
  * Zahl - The number to be checked
  * Feld - The given array
  * 
  * example: 
  * Find2Push(4, 2, [1, 2, 3, 4, 0, 0])
  * will return 2, since two elements in the array are
  * larger than 2. 
  *  }   
    var
    k : tIndex;
    topush : integer;  
  begin
    topush := 0;
    for k := i downto 1 do
    begin
      if Zahl < Feld[k] then  
        topush := topush + 1;
    end;
  
  Find2Push := topush 
  end; { end FindNPush }

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
  { initialise array }
  
  for fi := 1 to GRENZE do
    Feld[i] := 0; 
  
  { Koppieren des Erste Feld}
  for i := 1 to GRENZE1 do
    Feld[i] := Feld1[i];
    
  {Feld := KoppieFirstArray(Feld, Feld1);}
  for fi := GRENZE1PLUS1 to  GRENZE do
  begin
    push := 0;
    push := Find2Push(fi-1, Feld2[fi-GRENZE1], Feld); 
    { push element to the right}
    if push > 0 then
    begin
      for k:= fi downto fi-push do
        begin
        if k > 1 then
          Feld[k] := Feld[k-1]
      end;
    Feld[k] := Feld2[fi-GRENZE1];
    end
    else
      Feld[fi] := Feld2[fi-GRENZE1];
  end;   

  writeln ('Das Ergebnisfeld ist:');
  for k := 1 to GRENZE do
    write (Feld[k]:8);
  writeln

end. { End Merge }
