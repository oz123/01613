{ vim: set expandtab ts=2 sw=2 ai :}
{$B+}
{$R+}

program Median(input, output);
{ Bestimmt den Median einer einzugebenden Buchstabenfolge aus 
  mindestens zwei verschiedenen Kleinbuchstaben.
b 4.2.1.7 s. 103
}
  
  type
  tBuchst = 'a'..'z';
  tNatZahl = 0..maxint;
  tFeld = array [tBuchst] of boolean;

  var
  vorhanden : tFeld;
  gesamt, 
  i, 
  MedianPos : tNatZahl;
  Buchstabe : tBuchst;
  Zeichen : char;

begin
  {Eingabe anfordern}
  writeln('Geben Sie eine Kleinbuchstaben-Folgen ein.');
  writeln('Eingabe-Ende durch ein anderes Zeichen.');

  { initialisierung }
  for Buchstabe := 'a' to 'z' do
    vorhanden[Buchstabe] := false;
  gesamt := 0;

  { einlesen und Markierungen setzen }
  read(Zeichen);
  while (Zeichen >= 'a') and (Zeichen <= 'z') do
  begin
    if not vorhanden[Zeichen] then
    begin
      vorhanden[Zeichen] := true;
      gesamt := gesamt + 1
    end; {end if}
  read(Zeichen)
  end; { end while }
  writeln;
  
  { Alle Buchstaben und Marken ausgeben }
  for Buchstabe := 'a' to 'z' do
    write(Buchstabe);
  writeln;
  for Buchstabe := 'a' to 'z' do
    if vorhanden[Buchstabe] then
      write('*')
    else
      write('-');
  writeln;
  
  { Median suchen }
  
  MedianPos := (gesamt + 1) div 2;
  Buchstabe := 'a';
  i := 0;
  repeat 
    if vorhanden[Buchstabe] then
      i := i + 1;
    Buchstabe := succ(Buchstabe)
  until i = MedianPos;
  writeln('Der Median ist: ', pred(Buchstabe), '.');
  

end. { Median }

