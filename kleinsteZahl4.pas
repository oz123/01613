{ vim: set expandtab ts=2 sw=2 ai :}
{$B+}
{$R+}

program kleinsteZahl3(input, output);
{ gibt die kleinste Zahl der Integer Eingabezahlen aus
task 4.1.3.2 page 86}

  var
  Zahl,
  Minimum : Integer ;
  
begin
  writeln('Geben Sie die integer-Zahlen ein. ', 
          '<Ctrl-D> beendet die Eingabe.');
  if eof then
    writeln('Es wurde keine Zahl eingegeben.')
  else
  begin
    readln(Zahl);
    Minimum := Zahl;
    while not eof do
    begin
      readln(Zahl);
      if Zahl < Minimum then
        Minimum := Zahl
    end;
  writeln('Die kleinste Zahl lautet ', Minimum, '.')
  end
end. {end kleinsteZahl4}

