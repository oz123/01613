{ vim: set expandtab ts=2 sw=2 ai :}
{$B+}
{$R+}

program VokalUndKonsonanten(input, output);
{ bestimmt in einem einzulesenden Satz die
  Anzahl der vorkommenden Vokale und Konsonanten
b 4.2.1.6 s. 102
}
  
  type
  tBuchst = 'a'..'z';
  tNatZahl = 0..maxint;
  tHaufigkeit = array [tBuchst] of tNatZahl;

  var
  Anzahl : tHaufigkeit;
  Zeichen : char;
  Gesamtzahl, 
  Vokalzahl : tNatZahl ; 

begin
  { Initialisieren der Zaehler }
  for Zeichen := 'a' to 'z' do
    Anzahl[Zeichen] := 0;
  Gesamtzahl := 0;

  { Zeichenweise Einlesen des Textes und aufaddieren der Zaehler }
  while Zeichen <> '.' do
  begin
    if (Zeichen >= 'a') and (Zeichen <= 'z') then
    begin
      Anzahl[Zeichen] := Anzahl[Zeichen] + 1;
      Gesamtzahl := Gesamtzahl +1
    end; {if}
    read (Zeichen)
  end; { end while-Schleife }
  writeln;
  { Ausgabe der Statistik }
  Vokalzahl := Anzahl['a'] + Anzahl['e'] + Anzahl['i'] +
               Anzahl['o'] + Anzahl['u'];
  writeln('Anzahl der Vokale: ' , Vokalzahl, '.');
  write('Anzahl der Konsonanten: ');
  writeln(Gesamtzahl - Vokalzahl, '.')
end. { VokalUndKonsonanten}

