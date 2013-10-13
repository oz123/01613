{ vim: set expandtab ts=2 sw=2 ai :}
{$B+}
{$R+}

program Seminar2(input, output);
{
 Zweite Programmvariante fuer das Seminarproblem
}

  const 
  MAXTEILNEHMER = 12;
  TAGE = 31;
  MONATE = 12;
  MINJAHR = 1900;
  MAXJAHR = 2010;

  type
  tTag = 1..TAGE;
  tMonat = 1..MONATE;
  tJahr = MINJAHR..MAXJAHR;
  tNatZahlPlus = 1..maxint;
  tNatZahl = 0..maxint;
  tStatus = (aktiv, passiv);
  tIndex = 1..MAXTEILNEHMER;
  tString = string[20];
  tSeminarStudent =
    record
      Name : tString;
      { Erweiterung }
      Geburtstag :
        record 
          Tag : tTag;
          Monat : tMonat;
          Jahr : tJahr;
        end; { Geburtstag }
      MatrikelNr : tNatZahlPlus;
      Status : tStatus;
    end; { tSeminarStudent }
  
  tTeilnehnerfeld = array [tIndex] of tSeminarStudent;
  
  var
  TeilnehmerFeld : tTeilnehnerfeld;
  AnzStud : tNatZahl;
  i : tIndex;
  Status : char; { Zeichen zum einlesen des Studenteten status. Muss
                   von Typ char sein, um eingelesen werden zu koennen.
                   'a' entschpricht aktiv, 
                   'p' entschpricht passiv
                  }  
begin
  write(' Wie viele Studenteten nahmen am Seminar teil? ');
  readln(AnzStud);
  if AnzStud > MAXTEILNEHMER then
  begin
    writeln('Bitte hoechstens ', MAXTEILNEHMER, ' eingeben!');
    AnzStud := MAXTEILNEHMER;
  end;
  writeln (' Geben Sie Name, Matr. Nr. und Aktivitaet ', 
           'der ', AnzStud:3, ' Teilnehmer ein: ');
  for i := 1 to AnzStud do
  begin
  write('Name: ');
  readln(TeilnehmerFeld[i].Name);
  write('Matr. Nr. ');
  readln(TeilnehmerFeld[i].MatrikelNr);
  write('a - aktiv , p - passiv: ');
  readln( Status );
  if Status = 'a' then
    TeilnehmerFeld[i].Status := aktiv
  else
    TeilnehmerFeld[i].Status := passiv
  end;

  { Scheine Ausgeben }
  writeln;
  for i := 1 to AnzStud do
  begin
    if TeilnehmerFeld[i].Status = aktiv then
    begin
      writeln( 'Der Student ', TeilnehmerFeld[i].Name );
      write( 'mit der Matrikel-Nr. ' );
      writeln( TeilnehmerFeld[i].MatrikelNr );
      writeln(' hat mit Erfolg am Seminar  teilgenommen.' );
      writeln;
    end
  end;

  writeln('Liste aller aktiven Seminar-Teilnehmer');
  writeln('--------------------------------------');
  for i := 1 to AnzStud do
    if TeilnehmerFeld[i].Status = aktiv then
      writeln(TeilnehmerFeld[i].Name);
  writeln;

  writeln('Liste aller Zuhoerer im Seminar' );
  writeln('--------------------------------');
  for i := 1 to AnzStud do
    if TeilnehmerFeld[i].Status = passiv then
      writeln(TeilnehmerFeld[i].Name);
  writeln
end. { Seminar2 }
