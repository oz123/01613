{ vim: set expandtab ts=2 sw=2 ai :}
{$B+}
{$R+}

program kleinsteZahl2(input, output);
{ gibt die kleinste Zahl der Integer Eingabezahlen aus
example 4.1.2.1 page 86}

  var
  Zahl, 
  Minimum : Integer ;
  
begin
  writeln('Geben Sie die integer-Zahlen ein. 0 beendet die Eingabe.');
  readln(Zahl);
  Minimum := Zahl ;
  if Zahl <> 0 then
    repeat
      if Zahl < Minimum then
        Minimum := Zahl ; 
      readln (Zahl)
    until Zahl = 0;
  if Minimum <> 0 then
    writeln('Die kleinste Zahl lautet ', Minimum, '.')
  else
    writeln('Es wurde nuer eine 0 eingegeben.')
end. {end kleinsteZahl2}

