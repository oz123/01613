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
  Minimum := maxint; 
  Zahl := maxint; 
  writeln('Geben Sie die integer-Zahlen ein. 0 beendet die Eingabe.');
  repeat
    writeln('begin');
    if (Zahl < Minimum) then
      begin
      Minimum := Zahl ;
      writeln('assignd');
      writeln('New Minimum ', Minimum);
      end;
    writeln('Type a number:');
    readln (Zahl);
  until Zahl = 0;
  if (Minimum = maxint) and (Zahl = 0) then 
    writeln('Only a 0 was given')
  else 
    writeln('Die kleinste Zahl lautet ', Minimum, '.')
end. {end kleinsteZahl2}

