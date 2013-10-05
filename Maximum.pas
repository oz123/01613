{vim: tabstop=2, softtabstop=2}

{$B+}
{$R+}

program Maximum(input, output);
{ Bestimmt das Maximum einer Folge von einzulesenden integer-Zahlen
example 4.1.1.3 page 84}

  const
  ANZ = 4;

  type
  tIndex = 0..ANZ;

  var 
  i : tIndex; { Laufvariable }
  Zahl, 
  Max : Integer ;


 begin 
   writeln('Geben Sie ', ANZ, ' ganze Zahlen ein, ');
   writeln('deren Maximum bestimmt werden soll.');
   write ('1. Wert: ');
   readln(Zahl);
   Max := Zahl;
   for i := 2 to ANZ do
   begin
     write (i, '. Wert: ');
     readln (Zahl);
     if Zahl > Max then
       Max := Zahl
   end; {end for loop}
   writeln( 'Das Maximum ist: ', Max, '.' );
end. {end Quadratzahl2}

