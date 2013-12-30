{$B+}
{$R+}
{ 23 Nov 2013 }
program TestSymAusgabe (input, output);
{ read a binary tree and give the output in a symetric order}  
  type
  tNatZahl = 0..maxint;
  tRefBinBaum = ^tBinBaum;
  tBinBaum = record
              info : integer;
              links : tRefBinBaum;
              rechts : tRefBinBaum;
  end;
  
  var
  Wurzel : tRefBinBaum;
  Anzahl : integer;
  
  function BBKnotenzahl (
  inRefWurzel : tRefBinBaum) : tNatZahl;
  { bestimmt die Anzahl der Knoten des Binaerbaumes,
  auf dessen Wurzel inRefWurzel zeigt }
  var 
  NKnoten : integer;
  
  begin
  NKnoten := 0;
  
  if inRefWurzel <> nil then
  begin
      NKnoten := BBKnotenzahl(inRefWurzel^.rechts)+BBKnotenzahl(inRefWurzel^.links)  + 1;
      {NLeft := + 1}
  end;
  BBKnotenzahl := NKnoten {+ NLeft};
  end;


  procedure BBKnotenEinfuegen (
                               inZahl : integer;
                                var ioRefWurzel : tRefBinBaum);
  { fuegt in den Suchbaum, auf dessen Wurzel ioRefWurzel
  zeigt, ein Blatt mit Wert inZahl an }
  var
  RefSohn,
  RefVater : tRefBinBaum;
  gefunden : boolean;
  
  begin
    RefSohn := ioRefWurzel;
    gefunden := false;
    while (RefSohn <> nil) and (not gefunden) do
    begin
      if RefSohn^.info = inZahl then
        gefunden := true
      else
      begin
      RefVater := RefSohn;
      if inZahl < RefSohn^.info then
        RefSohn := RefSohn^.links
      else
      RefSohn := RefSohn^.rechts
    end
    end; { while }
  
    if not gefunden then
    { neuen Knoten anlegen }
    begin
      new (RefSohn);
      RefSohn^.info := inZahl;
      RefSohn^.links := nil;
      RefSohn^.rechts := nil;
      { neu angelegten Knoten einfuegen }
      if ioRefWurzel = nil then
      { Baum war leer, neue Wurzel zurueckgeben }
        ioRefWurzel := RefSohn
      else
        if inZahl < RefVater^.info then
        { Sohn links anhaengen }
          RefVater^.links := RefSohn
        else
        { Sohn rechts anhaengen }
        RefVater^.rechts := RefSohn
    end
  end; { BBKnotenEinfuegen }


  procedure BBAufbauen (var outWurzel : tRefBinBaum);
  { Liest eine Folge von Integer-Zahlen ein (0 beendet die
  Eingabe, gehoert aber nicht zur Folge) und speichert
  die Folge in einem bin ren Suchbaum. }

  var
    Zahl : integer;
  
  begin
    outWurzel := nil; { mit leerem Baum initialisieren }
    read (Zahl);
    while Zahl <> 0 do
    begin
    BBKnotenEinfuegen (Zahl, outWurzel);
    read (Zahl)
    end
  end; { BBAufbauen }

{ INCORRECT OUTPUT }
  procedure SymAusgabeA (
    inRefWurzel : tRefBinBaum);
    {gibt die Knotenwerte eines Binärbaums in
    symmetrischer Reihenfolge aus}
  begin
    if inRefWurzel <> nil then
    begin
      write (inRefWurzel^.info, ' ');
      if inRefWurzel^.links <> nil then
        SymAusgabeA(inRefWurzel^.links);
      if inRefWurzel^.rechts <> nil then
        SymAusgabeA(inRefWurzel^.rechts)
    end
  end; {SymAusgabe}

{ CORRECT OUTPUT, BUT CAREFUL, IT'LL CRASH ON EMPTY TREES }
  procedure SymAusgabeB (
            inRefWurzel : tRefBinBaum);
  {gibt die Knotenwerte eines Binärbaums in
  symmetrischer Reihenfolge aus}
  begin
    if inRefWurzel^.links <> nil then
      SymAusgabeB(inRefWurzel^.links);
    write(inRefWurzel^.info);
    if inRefWurzel^.rechts <> nil then
    SymAusgabeB(inRefWurzel^.rechts)
  end; {SymAusgabe}

{ C Works, passes full tree, empty tree and a single node tree }
  procedure SymAusgabeC (
            inRefWurzel : tRefBinBaum);
  {gibt die Knotenwerte eines Binärbaums in
  symmetrischer Reihenfolge aus}
  begin
    if inRefWurzel <> nil then
    begin
      SymAusgabeC(inRefWurzel^.links);
      write (inRefWurzel^.info);
      SymAusgabeC(inRefWurzel^.rechts)
    end
  end; {SymAusgabeC}

{ D - Incorrect output}
  procedure SymAusgabeD (
            inRefWurzel : tRefBinBaum);
  {gibt die Knotenwerte eines Binärbaums in
  symmetrischer Reihenfolge aus}
  begin
    if inRefWurzel <> nil then
      begin
      if inRefWurzel^.links <> nil then
        SymAusgabeD(inRefWurzel^.links);
      if inRefWurzel^.rechts <> nil then
        SymAusgabeD(inRefWurzel^.rechts);
      write (inRefWurzel^.info)
    end
  end; {SymAusgabeD}

{ CORRECT OUTPUT, Pass empty tree, pass single node tree}
  procedure SymAusgabe (
            inRefWurzel : tRefBinBaum);
  {gibt die Knotenwerte eines Binärbaums in
  symmetrischer Reihenfolge aus}
  begin
    if inRefWurzel <> nil then
    begin
      if inRefWurzel^.links <> nil then
        SymAusgabe(inRefWurzel^.links);
      write (inRefWurzel^.info);
      if inRefWurzel^.rechts <> nil then
      SymAusgabe(inRefWurzel^.rechts)
    end
  end; {SymAusgabe}

begin
  writeln('Bitte integer-Zahlen eingeben (0=Ende):');
  BBAufbauen (Wurzel);
  { 2 mal aufrufen wie bei Aufg. 1 }
  Anzahl := BBKnotenzahl (Wurzel);
  Anzahl := BBKnotenzahl (Wurzel);
  writeln ('Der Baum hat ', Anzahl, ' Knoten.');
  SymAusgabe(Wurzel);

end. { TesteBBKnotenzahl }
