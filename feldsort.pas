{ vim: set expandtab ts=2 sw=2 ai :}
{$B+}
{$R+}

program FeldSort(input, output);
{
  Sortiert ein einzulesendes Feld von integer-Zahlen
}


  const 
  FELDGROESSE = 5;

  type
  tIndex = 1..FELDGROESSE;
  tFeld = array  [tIndex] of integer;
  
  
  var
  EingabeFeld : tFeld;
  MinPos, 
  i,k : tIndex;
  Tausch : integer;

function FeldMinimumPos( Feld: tFeld; von, bis: tIndex ): tIndex;
{ bestimmt die Position des Minimums im Feld zwischen
 von und bis, 1<= von <= bis <= FELDGROESSE } 

  var
  MinimumsPos, 
  j : tIndex;
  
  begin
    MinimumsPos :=von;
    for j := von +1 to bis do
      if Feld[j] < Feld[MinimumsPos] then
        MinimumsPos := j;
    FeldMinimumPos := MinimumsPos 
  end; { FeldMinimumPos }

begin
  { Einlesen des Feldes }
  writeln ( 'Geben Sie ', FELDGROESSE, ' Werte ein: ' );
  for i := 1 to FELDGROESSE do
    readln(EingabeFeld[i]);

  writeln('Given:');
  for i := 1 to FELDGROESSE do
    write ( EingabeFeld [i]:6);
  writeln; 
  { Sortieren }
  for i:= 1 to FELDGROESSE - 1 do
  begin
    MinPos := FeldMinimumPos(EingabeFeld, i, FELDGROESSE);
    { Minimum gefunden, jetzt muessen wir es mit dem 
      Element auf Position i vertauschen }
    Tausch := EingabeFeld[MinPos];
    EingabeFeld[MinPos] := EingabeFeld[i];
    EingabeFeld[i] := Tausch;
    write('Step ', i,':') ;
    for k := 1 to FELDGROESSE do
      write ( EingabeFeld [k]:6);
    writeln;
  end;

  { Ausgabe des sortierten Felden }
  writeln('Sorted:');
  for i := 1 to FELDGROESSE do
    write ( EingabeFeld [i]:6);
  writeln;
end. { FeldSort }
