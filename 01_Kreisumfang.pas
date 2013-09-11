{$B+}
{$R+}

program Kreisumfang (input, output);

{Berechnet den Kreisumfang bei gegebenem Radius}

  CONST PI = 3.141592654 ; {Constant is assignd with =}

  { Jetzt kommt eine Variablendeklaration. Sie finden sie im folgenden
  Abschnitt eläutert  }

  Var Radius, 
  Umfang:real; 

Begin 

  Writeln ('Berechnung des Kreisumfangs.');
  write ('Geben sie den Radius ein: ');
  readln( Radius );

  Umfang := 2.0 * PI * Radius ; { real is assignd with :=}
  Writeln ('Der Umfang betraegt: ', Umfang );
end. {Kreisumfang}
