{vim: tabstop=2}
{compiler options}
{$B+}
{$R+}
Program GeldBetrag(input, output);
{ 
  Rechnen die Kleinste menge der Geldmünzen für einen 
  einzulesenden Geldbetrag
  Der Betrag soll zwischen einem Cent und 99 Cent liegen
}

  const
  FUENFZIGER = 50 ; { Cent }
  ZWANZIGER = 20; { Cent }
  ZEHNER = 10 ; { Cent }
  FUENFER = 5 ; { Cent } 
  ZWEIER = 2 ; { Cent }
  CENT = 1 ; { Cent }

  var 
  FuenfzigerZahl, 
  ZwanzigerZahl, 
  ZehnerZahl,
  FuenfzerZahl, 
  ZweierZahl, 
  CentsZahl, 
  Betrag : integer ;

begin 
  
  FuenfzigerZahl := 0; 
  ZwanzigerZahl := 0; 
  ZehnerZahl := 0;
  FuenfzerZahl := 0;
  ZweierZahl := 0;
  CentsZahl := 0;
  
  writeln('Geben Sie ein Betrag zwischen 1 und 99 Cent ein :' ); 
  { assumig the user is giving input correctly ... }
  readln (Betrag);
  
  { calculate the number of 50 Cent Coins }
  FuenfzigerZahl := Betrag div FUENFZIGER;
  Betrag := Betrag mod FUENFZIGER;
  (* writeln('Betrag ',Betrag) ;*)

  { calculate the number of 20 Cent Coins }
  ZwanzigerZahl := Betrag div ZWANZIGER;
  Betrag := Betrag mod ZWANZIGER;
  {writeln('Betrag ',Betrag) ;}

  { calculate the number of 10 Cent Coins }
  ZehnerZahl := Betrag div ZEHNER;
  Betrag := Betrag mod ZEHNER;
  {writeln('Betrag ',Betrag) ;}
  
  { calculate the number of 5 Cent Coins }
  FuenfzerZahl := Betrag div FUENFER;
  Betrag := Betrag mod FUENFER;
  {writeln('Betrag ',Betrag) ;}

  { calculate the number of 2 Cent Coins }
  ZweierZahl := Betrag div ZWEIER;
  Betrag := Betrag mod ZWEIER; 
  (* writeln('Betrag ',Betrag) ; *)

  CentsZahl := Betrag;
  write (FuenfzigerZahl,'  ' ,ZwanzigerZahl,'  ', ZehnerZahl,'  ');
  writeln ( FuenfzerZahl,'  ', ZweierZahl,'  ', CentsZahl);

end. {end program FarenheitToCelsius}

