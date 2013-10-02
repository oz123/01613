{ vim: set expandtab ts=2 sw=2 ai :}
{$B+}
{$R+}

program ggtBerechnung(input, output);
{ berechnent den grossten gemeinsamen Teiler zweier 
einzulesender integer-Zahlen x und y grosser Null
example 4.1.2.2 page 87}

  var
  x, 
  y : integer ;
  
begin
  writeln('Bittegeben Sie die 2 natuerliche Zahlen > 0 ein:');
  readln(x);
  readln(y);
  if (x<=0) or (y<=0) then
    writeln('Eingabefehler!')
  else
  begin
    write('Der ggT von ', x, ' und ', y, ' ist :');
    { Ausgabe von x und y schon hier, da nach der while-
      Schleife die Originalwerte nicht mehr existieren }
    while x <> y do
      if x > y then
        x := x - y
      else
        y := y - x;
    writeln(x, '.')
  end 
end. {end ggtBerechnung}

