{ vim: set expandtab ts=2 sw=2 ai :}
{$B+}
{$R+}

program FeldSuche(input, output);
{ stellt fest, ob ein Suchwert in einem Feld
  von bis zu 100 integer-Zahlen vorkommt
  b 4.2.1.4 s. 99
}
  
  const
  MAX = 100; 
  MAXPLUS1 = 101;

  type 
  tIndex = 1..MAX;
  tFeld = array [tIndex] of integer;
  tIndexPlus1 = 1..MAXPLUS1;

  var
  Feld : tFeld;
  Groesse, 
  Suchwert : integer;
  i : tIndexPlus1;
  gefunden : boolean;

begin
  { Eingabe der Feldgroesse solange, bis eine Feldgroesse zwischen
  1 und MAX eingegeben wird . }
  repeat
    write( 'Anzahl Werte (max.) ', MAX, '): '  );
    readln(Groesse)
  until ( 1 <= Groesse ) and ( Groesse <= Max );
  
  { Eingabe der Zahlen und des Suchwerts }
  for i := 1 to Groesse do
  begin
    write (i, '. Wert:');
    readln (Feld[i])
  end;
  write( 'Suchwert: ' );
  readln(Suchwert);

  { Pruefen des gesamten Feldes bis zum Sucherfolg oder
  bis zum letzten eingelesenen Wert }
  gefunden := false;
  i := 1;
  while ( i <= Groesse ) and ( not gefunden ) do
    if Feld[i] = Suchwert then
      gefunden := true
    else
      i := i+1;
  { Ende der while-Schleife }
  { Fals Groesse = MAX ist und Suchwert nicht gefunden wird, 
    gilt nach Verlassen der while-Schleife
    i = MAXPLUS1. Daher obige Deklaration fuer i. }
  if gefunden then
    writeln('Der Wert steht an Position ', i, '.')
  else 
    writeln('Der Wert kommt nicht vor.')
end. { FeldSuche }

