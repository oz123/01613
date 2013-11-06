{ vim: set expandtab ts=2 sw=2 ai :}
{$B+}
{$R+}

{ my test cases:
* search for 
* 5, 11, 13, 18
* }
program BinarySearch(input, output);

  const
  FELDGROESSE = 11;
  FELDGROESSEPLUSEINS = FELDGROESSE + 1 ;
  
  type
  tIndex = 1..FELDGROESSE;
  tIndexObenUnten = 0..FELDGROESSEPLUSEINS;
  tFeld = array [tIndex] of integer;
  
  var
  unten, 
  oben : tIndexObenUnten;
  Mitte : tIndex;
  Feld : array [tIndex] of integer;
  {Feld : tFeld = (6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16);}
  Suchwert : integer;
  gefunden : boolean;
  

  function PrintField( Feld: tFeld ): integer;
  var 
  k : integer;
  begin
    for k := 1 to FELDGROESSE do
      write(Feld[k]:4);
    writeln();
    PrintField := 0
  end; { end PrintField }

begin
  for Mitte:=1 to FELDGROESSE do
    begin
      Feld[Mitte] := Mitte+5;
    end;
  writeln;
  Feld[1]:=2;
  Feld[2]:=3;  
  Feld[10]:=Feld[10]+2;
  Feld[11]:=Feld[11]+3;
  PrintField(Feld);
  read(Suchwert);
  { case A }
  writeln('Test Case A');
  unten := 1;
  oben := FELDGROESSE;
  {gefunden := false;}
  repeat
    Mitte := (oben + unten) div 2;
    if Suchwert > Feld[Mitte] then
      unten := Mitte + 1 
    else
      oben := Mitte - 1
  until (Feld[Mitte] = Suchwert) or (unten > oben);
  
  if Feld[Mitte] = Suchwert then
    gefunden := true
  else
    gefunden := false;

  { end of test case A}
  { case B }
  {
  writeln('Test Case B');
  unten := 1;
  oben := FELDGROESSE;
  gefunden := false;
  repeat
    Mitte := (oben + unten) div 2;
    if Suchwert = Feld[Mitte] then
      gefunden := true
    else
      if Suchwert > Feld[Mitte] then
        unten := Mitte
      else
        oben := Mitte;
  writeln('oben: ', Mitte)
  until gefunden or (unten >= oben);
}
{
will fail for large numbers!
}
{ case C works for cases ...  also for arrays with holes}
  
{
  writeln('Test Case C');
  unten := 1;
  oben := FELDGROESSE;
  repeat
    Mitte := (oben + unten) div 2;
    if Suchwert <= Feld[Mitte] then
      oben := Mitte - 1;
    if Feld[Mitte] <= Suchwert then
      unten := Mitte + 1;
  until (unten > oben);
  
  if Feld[Mitte] = Suchwert then
    gefunden := true
  else
    gefunden := false;
  writeln(gefunden, ' in ', Mitte);
end. 
}

{ Case D - Not Working - Fails for array with 'Gaps'
* e.g 
* Feld = ( 2   3   8   9  10  11  12  13  14  15  16)
  when Searching for 3
* }

{
  writeln('Test Case D');
  gefunden := false;
  unten := 1;
  oben := FELDGROESSE;
  while (unten < oben) and not gefunden do
  begin
    Mitte := (oben + unten) div 2;
    if Suchwert = Feld[Mitte] then
      gefunden := true
    else
      if Suchwert < Feld[Mitte] then
        oben := Mitte - 1
      else
        unten := Mitte + 1
  end;
}

{ case E }

{
  gefunden := false;
  unten := 1;
  oben := FELDGROESSE;
  PrintField(Feld);
  while (unten <= oben) and not gefunden do
  begin
    Mitte := (oben + unten) div 2;
    if Suchwert = Feld[Mitte] then
      gefunden := true
    else
      if Suchwert < Feld[Mitte] then
        oben := Mitte - 1
      else
        unten := Mitte + 1
  end;
}

{ Case E Works for all cases ...
* For arrays with 'GAPS' too ...}
  writeln(gefunden, ' in ', Mitte);
end.
