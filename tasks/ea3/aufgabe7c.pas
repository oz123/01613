{$B+}
{$R+}
{won't work, GGT does not return a value or get a reference }
program KuerzenUndAusgeben (input, output);
  
  type
  tNatZahlPlus = 1..maxint;
  
  var
  Zaehler,
  Nenner,
  Teiler : tNatZahlPlus;
  
  procedure Ausgabe (inZaehler,
    inNenner : tNatZahlPlus);{Gibt den gekuerzten Bruch aus}
  begin
    writeln('gekuerzter Bruch:',inZaehler,'/', inNenner)
  end; {Ausgabe}
    
  procedure GGT (inZahl1, inZahl2 : tNatZahlPlus);
    {bestimmt den groessten gemeinsamen
    Teiler von inZahl1 und inZahl2}
    var
    Hilf1,
    Hilf2 : tNatZahlPlus;
  
  begin
    Hilf1 := inZahl1;
    Hilf2 := inZahl2;
    while Hilf1 <> Hilf2 do
      if Hilf1 > Hilf2 then
        Hilf1 := Hilf1 - Hilf2
     else
      Hilf2 := Hilf2 - Hilf1;
    Teiler := Hilf1
  end; {GGT}
  
    procedure Kuerzen (inZaehler,
      inNenner : tNatZahlPlus);
    var
      Temp1,
      Temp2 : tNatZahlPlus;
    begin
      Temp1 := inZaehler;
      Temp2 := inNenner;
      inZaehler := Temp1 div Teiler;
      inNenner := Temp2 div Teiler
    end; {Kuerzen}

begin {KuerzenUndAusgeben}
  writeln ('Geben Sie den Zaehler ein');
  read (Zaehler);
  writeln ('Geben Sie den Nenner ein');
  read (Nenner);
  GGT(Zaehler,Nenner);
  Kuerzen (Zaehler,Nenner);
  Ausgabe (Zaehler,Nenner)
end.{KuerzenUndAusgeben}
