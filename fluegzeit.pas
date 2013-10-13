{ vim: set expandtab ts=2 sw=2 ai :}
{$B+}
{$R+}

program StringTest(input, output);
{ 
  Calculate flight time from start and end times.
  4.2.2.1 s. 110
}
  
  const
  MINSEK = 59;
  STUNDE = 23;
  
  type
  tMinSek = 0..MINSEK;
  tStunde = 0..STUNDE;

  tZeit = record
            h : tStunde;
            m,
            s : tMinSek;
          end; { tZeit }
  tUebertrag = 0..1;

  var
  Abflug, 
  Ankunft, 
  Flugdauer : tZeit;
  Eingabe : integer;
  Uebertrag : tUebertrag;

begin
  Flugdauer.h := 0;
  Flugdauer.m := 0;
  Flugdauer.s := 0;
  Uebertrag := 0;
  
  writeln('Bitte die Abflugzeit eingeben');
  repeat
    write('Stunde:');
    readln(Eingabe)
  until (Eingabe >= 0) and (Eingabe <= STUNDE);
  Abflug.h := Eingabe;
  
  repeat
    write('Minute:');
    readln(Eingabe)
  until (Eingabe >= 0) and (Eingabe <= MINSEK);
  Abflug.m := Eingabe;
  
  repeat
    write('Sekunde:');
    readln(Eingabe)
  until (Eingabe >= 0) and (Eingabe <= MINSEK);
  Abflug.s := Eingabe;
  
  writeln;
  writeln('Bitte die Ankunftzeit eingeben');
  repeat
    write('Stunde:');
    readln(Eingabe)
  until (Eingabe >= 0) and (Eingabe <= STUNDE);
  Ankunft.h := Eingabe;
  
  repeat
    write('Minute:');
    readln(Eingabe)
  until (Eingabe >= 0) and (Eingabe <= MINSEK);
  Ankunft.m := Eingabe;
  
  repeat
    write('Sekunde:');
    readln(Eingabe)
  until (Eingabe >= 0) and (Eingabe <= MINSEK);
  Ankunft.s := Eingabe;


  { Sekunden differenz berechnen }
  if Ankunft.s < Abflug.s then
  begin
    Uebertrag := 1;
    Flugdauer.s := MINSEK + 1 - Abflug.s + Ankunft.s 
  end
  else
    Flugdauer.s := Ankunft.s - Abflug.s ;
  
  { Minuten differenz berechnen } 
  if ( Ankunft.m - Uebertrag ) < Abflug.m then
  begin
    Flugdauer.m := MINSEK + 1 - Abflug.m +
                   Ankunft.m - Uebertrag;
    Uebertrag := 1;
  end 
  else
  begin
    Flugdauer.m := Ankunft.m - Abflug.m - Uebertrag;
    Uebertrag := 0;
  end;
  
  { Stunden Differenz berechnen }
  if ( Ankunft.h - Uebertrag ) < Abflug.h then
    Flugdauer.h := STUNDE + 1 - Abflug.h + Ankunft.h - Uebertrag
  else
    Flugdauer.h := Ankunft.h - Abflug.h - Uebertrag;

  { Ausgabe }
  writeln;
  writeln( 'Flugdauer: ', Flugdauer.h, ':', Flugdauer.m, ':', Flugdauer.s);
end. { Flugdauer } 
