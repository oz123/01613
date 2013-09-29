{vim: tabstop=2, softtabstop=2}

{$B+}
{$R+}

program Fakultaet(input, output);
{ berechnet die Fakultaet einer einzulesenden natuerlichen
  Zahl  
  example 4.1.1.2 page 83}

type
tNatZahl = 0..maxint;

var       
i : tNatZahl; { Laufvariable }
Zahl, 
Ergebnis : Integer ;


begin 
  write('Fuer welceh Zahl soll die Fakultaet berechnet werden? ');
  readln(Zahl);
  
  if Zahl < 0 then
    writeln('Fuer negative Zahlen ist die Fakultaet nicht definiert.')
  else
  begin
    Ergebnis :=1;
    for i := 1 to Zahl do
      Ergebnis := Ergebnis * i;
    writeln('Die Fakultaet von ', Zahl ,' lautet ', Ergebnis, '.')  
  end   
end. {end Quadratzahl2}

