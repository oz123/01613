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
  Wurzel,
  SearchNode : tRefBinBaum;
  Anzahl,
  SearchValue: integer;
  
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

  function BBKnotenSuchen (
                           inZahl : integer;
                           inRefWurzel : tRefBinBaum): tRefBinBaum;
    { liefert fuer den Suchbaum, auf dessen Wurzel
    inRefWurzel zeigt, den Zeiger auf den Knoten,
    dessen Wert gleich inZahl ist }
      var
      Zeiger : tRefBinBaum;
      gefunden : boolean;
    
    begin
      Zeiger := inRefWurzel;
      gefunden := false;
      while (Zeiger <> nil) and not gefunden do
      begin
        if inZahl = Zeiger^.info then
          gefunden := true
        else { nicht gefunden, daher links oder rechts
              weitermachen }
          if inZahl < Zeiger^.info then
            Zeiger := Zeiger^.links
          else
            Zeiger := Zeiger^.rechts
      end; { while }
      { Jetzt gilt Zeiger = nil oder gefunden = true.
      Falls gefunden = true, zeigt Zeiger auf den Knoten
      mit info-Komponente = inZahl, andernfalls hat
      Zeiger den Wert nil }
    BBKnotenSuchen := Zeiger
  end; { BBKnotenSuchen }


  procedure SymAusgabe (
            inRefWurzel : tRefBinBaum);
  {gibt die Knotenwerte eines Binärbaums in
  symmetrischer Reihenfolge aus}
  begin
    if inRefWurzel <> nil then
    begin
      if inRefWurzel^.links <> nil then
        SymAusgabe(inRefWurzel^.links);
      write (inRefWurzel^.info,',');
      if inRefWurzel^.rechts <> nil then
      SymAusgabe(inRefWurzel^.rechts)
    end
  end; {SymAusgabe}
  
  function FindNextValue( inZeiger: tRefBinBaum ): tRefBinBaum;
  {
  Given a Binary Tree Node with 2 linked nodes, return 
  the pointer Node to the nearest value. 
  }
  
  var HilfZeig : tRefBinBaum;

  begin
    { is the Pointer valid ?  }
    if inZeiger <> nil then
    begin  
      { is there a value bigger? }
      if inZeiger^.rechts <> nil then
      begin
        HilfZeig := inZeiger^.rechts;
        while HilfZeig^.links <> nil do 
          HilfZeig := HilfZeig^.links;
      end  { end if right node is not null }
    end ; { end if Pointer is not null }
    FindNextValue := HilfZeig
  end; {end FindNextValue }


  function SortierNachfolger (
                              inZeiger : tRefBinBaum) : tRefBinBaum;
  { liefert einen Zeiger auf den Nachfolger in der
  Sortierreihenfolge fuer den Knoten mit zwei
  Nachfolgern, auf den inZeiger zeigt, zurueck }
    var
    HilfZeig : tRefBinBaum;
  begin
    HilfZeig := inZeiger^.rechts;
    { jetzt haben wir die Wurzel des rechten Teilbaumes }
    while HilfZeig^.links <> nil do
      HilfZeig := HilfZeig^.links;
    { jetzt hat der Knoten, auf den HilfZeig zeigt,
    keinen linken Nachfolger mehr und wir sind am Ziel.
    Falls bereits die Wurzel des rechten Teilbaumes
    keinen linken Nachfolger hat, wird die while-
    Schleife gar nicht erst durchlaufen }
    SortierNachfolger := HilfZeig
  end; { SortierNachfolger }


begin
  writeln('Bitte integer-Zahlen eingeben (0=Ende):');
  BBAufbauen (Wurzel);
  { 2 mal aufrufen wie bei Aufg. 1 }
  Anzahl := BBKnotenzahl (Wurzel);
  Anzahl := BBKnotenzahl (Wurzel);
  writeln ('Der Baum hat ', Anzahl, ' Knoten.');
  SymAusgabe(Wurzel);
  writeln('Type node to search');
  readln(SearchValue);
  new(SearchNode);
  SearchNode := BBKnotenSuchen(SearchValue, Wurzel);
  writeln('the value is:', SearchNode^.info);
  SearchNode := SortierNachfolger(SearchNode);
  writeln('the next value is:', SearchNode ^.info);

  SearchNode := BBKnotenSuchen(SearchValue, Wurzel);
  writeln('the value is:', SearchNode ^.info);
  SearchNode := FindNextValue(SearchNode);
  writeln('the next value is:', SearchNode ^.info);

end. { TesteBBKnotenzahl }
