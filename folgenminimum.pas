{ vim: set expandtab ts=2 sw=2 ai :}
{$B+}
{$R+}

program FolgenMinimum(input, output);
{ liest eine Folge von 20 integer-Zahlen ein 
  und bestimmt das Minimum und seine Index.
  aufgabe 4.2.1.3 s. 99
}
  
  const
  FELDGROESSE = 20; 

  type 
  tIndex = 1..FELDGROESSE;
  tZahlenFeld = array [tIndex] of integer;

  var
  Feld : tZahlenFeld;
  i : tIndex;
  
  MinimumLoc,
  Minimum : integer;

begin
  { einlesen des Feldes }
  writeln( 'Geben Sie ', FELDGROESSE:2, ' Werte ein:');
  for i := 1 to FELDGROESSE do 
  begin
    write('Bitte ', i,'. Zahl eingeben: ');
    readln( Feld[i] )
  end;
  { Bestimmen des Maximums }
  Minimum := Feld[1];
  MinimumLoc := 1;
  for i := 2 to FELDGROESSE do 
    if Feld[i] < Minimum then
      begin
      Minimum := Feld[i];
      MinimumLoc := i;
    end;
  { Ausgabe des Maximums }
  writeln ('Die kleinste Zahl ist ', Minimum, '.');
  writeln ('Das Feld index ist ', MinimumLoc, '.');
end. { FolgenMinimum }

