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
  
  end; { GibListeAus }
  
  procedure SortiereListe (var ioRefListe : tRefListe);
  { sortiert eine lineare Liste aufsteigend }
  var
  LaufZeiger,
  BeginListZeiger,
  PreviousPointer: tRefListe;
  
  begin
    if ioRefListe <> nil then 
    begin
      LaufZeiger := ioRefListe;
      PreviousPointer := ioRefListe;
      while LaufZeiger^.next <> nil do     
      begin
        BeginListZeiger := ioRefListe;
        { Following element is larger then previous, order is increasing }
        if LaufZeiger^.info <= LaufZeiger^.next^.info then
          LaufZeiger := LaufZeiger^.next 
        else
        { the following element is smaller }
        begin
          PreviousPointer := LaufZeiger;
          LaufZeiger := LaufZeiger^.next;
          PreviousPointer^.next := LaufZeiger^.next;
          { copy the element to the correct place }
          if LaufZeiger^.info <= BeginListZeiger^.info then
          begin
            if LaufZeiger^.next <> nil then
            begin 
              ioRefListe := LaufZeiger;
              LaufZeiger^.next :=BeginListZeiger;
            end
          end {if inspected element smaller then list begin }
          else
          begin
            PreviousPointer := BeginListZeiger;
            BeginListZeiger := BeginListZeiger^.next;
            if LaufZeiger^.info <= BeginListZeiger^.info then
            begin
              PreviousPointer^.next := LaufZeiger;
              LaufZeiger^.next := BeginListZeiger
            end
            else 
            begin
              LaufZeiger^.next := BeginListZeiger^.next;
              BeginListZeiger^.next := LaufZeiger;
            end;
            end; { else inspected element bigger then list begin }
          end; { else the following element is smaller then previous }
        end ; { end while}
        
        { if the list contains more than one element }
        if (ioRefListe^.next <> nil) then
            { one last check to see how is LaufZeiger for the last element }
            if(LaufZeiger^.info <= BeginListZeiger^.info) then
            begin 
                ioRefListe := LaufZeiger;
                LaufZeiger^.next := BeginListZeiger;
            end
        
     end; { end if List not empty }
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


