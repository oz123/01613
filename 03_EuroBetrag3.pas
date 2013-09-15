{vi: tabstop=2}
  
{compiler options}
{$B+}
{$R+}
Program EURBetrag3(Input, Output);
{ 
Eur Betrag ausgeben mit Prüfung und Fehelmeldung
}

const 
WAERUNG = 'EUR';

Var
  Betrag : real;

Begin 
    
  Write('Bitte ', WAERUNG, '-Betrag (<1 Mio.)');
  Write('angeben: ');
  readln(Betrag);

  if Betrag >= 0.0 then
    write(Betrag:9:2, WAERUNG)
  else
    begin 
      Write('Eingabefehler! Betrag', Betrag);
      write(' ist negativ.' );
    end
end. {EURBetrag3}
