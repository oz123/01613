{$B+}
{$R+}
{ Working }

program KuerzenUndAusgeben (input, output);
  type
  tNatZahlPlus = 1..maxint;
  
  var
  Zaehler,
  Nenner : tNatZahlPlus;
  
  procedure Ausgabe (inZaehler,
    inNenner : tNatZahlPlus);
    {Gibt den gekuerzten Bruch aus}
  begin
    writeln('gekuerzter Bruch:',inZaehler,
    '/', inNenner)
  end; {Ausgabe}
  
  procedure Kuerzen (var ioZaehler,
    ioNenner : tNatZahlPlus);
    {Kuerzt den Bruch}
    
    var
    Teiler : tNatZahlPlus;
    
    function GGT (
                  inZahl1,
                  inZahl2 : tNatZahlPlus
                  )  :  tNatZahlPlus;
      {liefert den groessten gemeinsamen
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
        GGT := Hilf1
      end; {GGT}
    
    begin {Kuerzen}
  
    Teiler := GGT (ioZaehler, ioNenner);
    ioZaehler := ioZaehler div Teiler;
    ioNenner := ioNenner div Teiler
    end; {Kuerzen}
    
begin{KuerzenUndAusgeben}

  writeln ('Geben Sie den Zaehler ein');
  read (Zaehler);
  writeln ('Geben Sie den Nenner ein');
  read (Nenner);
  Kuerzen (Zaehler, Nenner);
  Ausgabe (Zaehler, Nenner)
  
end.{KuerzenUndAusgeben}
