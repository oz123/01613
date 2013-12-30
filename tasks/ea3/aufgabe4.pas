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
  
  begin
  if ioRefListe <> nil then  
  begin
    vor := nil;
    lauf := ioRefListe;
    min := lauf;
    while lauf <> nil do
      if lauf^.next^.info < lauf^.info  then
        if lauf = ioRefListe then
        begin
          lauf := lauf^.next;
          vor^.next := vor^.next^.next;
          lauf^.next := vor; 
          ioRefListe := lauf;
          GibListeAus(ioRefListe);      
        end
      else
      begin
        lauf^.next := ioRefListe;
        ioRefListe := lauf; 
        GibListeAus(ioRefListe);
        readln;
      end
  end { end if}

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


