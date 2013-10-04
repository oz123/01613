{ vim: set expandtab ts=2 sw=2 ai :}
{$B+}
{$R+}

program FolgenMaximum(input, output);
{ liest eine Folge von 5 integer-Zahlen ein 
  und bestimmt das Maximum.
  example 4.2.1.2 s. 98
}
  
  const
  FELDGROESSE = 5; 

  type 
  tIndex = 1..FELDGROESSE;
  tZahlenFeld = array [tIndex] of integer;

  var
  Feld : tZahlenFeld;
  i : tIndex;
  Maximum : integer;

begin
  { einlesen des Feldes }
  writeln( 'Geben Sie ', FELDGROESSE:2, ' Werte ein:');
  for i := 1 to FELDGROESSE do 
  begin
    write('Bitte ', i,'. Zahl eingeben: ');
    readln( Feld[i] )
  end;
  { Bestimmen des Maximums }
  Maximum := Feld[1];
  for i := 2 to FELDGROESSE do 
    if Feld[i] > Maximum then
      Maximum := Feld[i];
  { Ausgabe des Maximums }
  writeln ('Die groesste Zahl ist ', Maximum, '.');
end. { FolgenMaximum }

