{ vim: set expandtab ts=2 sw=2 ai :}
{$B+}
{$R+}

program Maximum(input, output);
{
  Find the Maximum in a row of numbers 
}

  var
  Zahl, 
  Groesste : Integer ;
  
begin
  writeln('Geben Sie die integer-Zahlen ein. 0 beendet die Eingabe.');
  readln(Zahl);
  Groesste := Zahl ;
    while Zahl <> 0 do
    begin
      if Zahl > Groesste then
        Groesste := Zahl ; 
    readln (Zahl)
    end;
    if Groesste <> 0 then
      writeln('Die Groesste Zahl lautet ', Groesste, '.')
    else
      writeln('Leere Eingabefolge!')
end. {end Maximum}
