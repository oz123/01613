{$B+}
{$R+}

program TesteSortiereListe(input, output);

  type
  tNatZahl = 0..maxint;
  tRefListe = ^tListe;
  tListe = record
             info : tNatZahl;
             next : tRefListe;
           end;

  var
  RefListe : tRefListe;
  
  
  procedure GibListeAus(inListe : tRefListe);
  { Gibt die Elemente von inListe aus }
    var Zeiger : tRefListe;
  begin
    Zeiger := inListe;
    while Zeiger <> nil do
    begin
      write(Zeiger^.info,' ');
      Zeiger := Zeiger^.next;
    end; { while }
  writeln;
  end; { GibListeAus }
  
  procedure SortiereListe (var ioRefListe : tRefListe);
  { sortiert eine lineare Liste aufsteigend }
  
  var 
  minval : integer;
  min, 
  vor, 
  lauf : tRefListe;
  
    procedure FindMinimum(var inRefListe,  outMin, outVor : tRefListe);
    { find the smallest element in the list}
      var
      lvor, 
      llauf,
      lmin : tRefListe;
    
    begin
      lvor := nil;
      llauf := inRefListe;
      lmin := inRefListe;
      while llauf^.next <> nil do
      begin
        if llauf^.next^.info < lmin^.info then
        begin
          lmin := llauf^.next;
          lvor := llauf  
        end;
        
      llauf := llauf^.next
      end;
      outMin := lmin;
      outVor := lvor;
    end; {end FindMinimun}
    
    procedure LinkToNext(var ioVor, inMin : tRefListe);
    begin
      ioVor^.next := inMin^.next;
    end;
    
    procedure PutOnHead( var ioRefListe, inMin : tRefListe);      
    begin
      inMin^.next := ioRefListe;
      ioRefListe := inMin; 
    end;
      
  begin
    if ioRefListe <> nil then  
    begin
      lauf := ioRefListe;
      while lauf^.next <> nil do
      begin
      FindMinimum(lauf, min, vor);
      writeln('min :', min^.info);
      writeln('vor :', vor^.info);
      LinkToNext(vor , min);
      PutOnHead(lauf, min);
      GibListeAus(lauf);
      lauf := lauf^.next
      end;
    end; { end if}

  end; {SortiereListe}
  
  
  procedure Anhaengen(var ioListe : tRefListe;  inZahl : tNatZahl);
  { Haengt inZahl an ioListe an }
  var Zeiger : tRefListe;
  begin
    Zeiger := ioListe;
    if Zeiger = nil then
    begin
      new(ioListe);
      ioListe^.info := inZahl;
      ioListe^.next := nil;
    end
    else
    begin
      while Zeiger^.next <> nil do
      Zeiger := Zeiger^.next;
      { Jetzt zeigt Zeiger auf das letzte Element }
      new(Zeiger^.next);
      Zeiger := Zeiger^.next;
      Zeiger^.info := inZahl;
      Zeiger^.next := nil;
    end; { else }
  end;{ Anhaengen }


  procedure ListeEinlesen(var outListe:tRefListe);
  { liest eine durch Leerzeile abgeschlossene Folge von Integer-
   Zahlen ein und speichert diese in der linearen Liste RefListe. }
    var
    Liste : tRefListe;
    Zeile : string;
    Zahl, Code : integer;
  begin
    writeln('Bitte geben Sie die zu sortierenden Zahlen ein.');
    writeln('Beenden Sie Ihre Eingabe mit einer Leerzeile.');
    Liste := nil;
    readln(Zeile);
    val(Zeile, Zahl, Code); { val konvertiert String nach Integer }
    while Code=0 do
    begin
      Anhaengen(Liste, Zahl);
      readln(Zeile);
      val(Zeile, Zahl, Code);
    end; { while }
  
    outListe := Liste;
  end; { ListeEinlesen }

  
begin
  ListeEinlesen(RefListe);
  SortiereListe(RefListe);
  GibListeAus(RefListe)
end.

