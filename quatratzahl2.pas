{vim: tabstop=2}

{$B+}
{$R+}

program Quadratzahl2(input, output);
{ berechnet die Quadrate der Zahlen von 1 bis 10 
  example 4.1.1.1 page 82}

const 
MAXINDEX = 10;

type
tIndex = 1..MAXINDEX;

var       
i : tIndex; { Laufvariable }


begin {no semicolon}
  for i := 1 to MAXINDEX do
      writeln(i:2, sqr(i):5)
end. {end Quadratzahl2}

