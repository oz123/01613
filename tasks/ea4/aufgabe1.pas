{$B+}
{$R+}
{ 19 Nov 2013 }

program testeZeigListMax(input, output);
  { testet die Funktion ZeigListMax }
  type
  tRefListe = ^tListe;
  tListe = record
             info : integer;
             next : tRefListe
           end;
  var
  Liste,
  MaxZeig : tRefListe;
  
  function ZeigListMax (inRefAnfang : tRefListe) : tRefListe;
  { bestimmt rekursiv einen Zeiger auf das Listenelement mit
  der groessten Zahl }
  
  { we could assign the biggest value to MaxZeig, but that's 
    a violation of good programming style and causes insanity ... }
  
  var 
  LMax : tRefListe;
  
  begin
  if inRefAnfang <> nil then
  begin
    if inRefAnfang^.next = nil then
        ZeigListMax := inRefAnfang
    else
    begin
      LMax := ZeigListMax(inRefAnfang^.next);
      if LMax <> nil then
      begin
      if LMax^.info > inRefAnfang^.info then
        ZeigListMax := LMax
      else 
        ZeigListMax := inRefAnfang
      end { end if LMax is not nil}
    end
  end
  else
    ZeigListMax:= nil;
  end; {ZeigListMax}
  
  procedure LiesListe(var outListe : tRefListe);
    { Liest eine (evtl. leere) Liste ein und gibt deren
    Anfangszeiger outListe zurueck. }
    var
    Anzahl : integer;
    i : integer;
    neueZahl : integer;
    Listenanfang,
    Listenende : tRefListe;
    
    begin
      Listenanfang := nil;
      repeat
      write ('Wie viele Zahlen wollen Sie eingeben? ');
      readln (Anzahl);
      until Anzahl >= 0;
      write ('Bitte geben Sie ', Anzahl, ' Zahlen ein: ');
      { Liste aufbauen }
      for i := 1 to Anzahl do
      begin
        read (neueZahl);
        if Listenanfang = nil then
        begin
          new (Listenanfang);
          Listenanfang^.next := nil;
          Listenanfang^.info := neueZahl;
          Listenende := Listenanfang;
        end
        else
        begin
          new (Listenende^.next);
          Listenende := Listenende^.next;
          Listenende^.next := nil;
          Listenende^.info := neueZahl
        end { if Liste = nil }
      end; { for }
      outListe := Listenanfang;
      writeln
    end; { LiesListe }


begin
  LiesListe (Liste);
  { Die zu testende Funktion wird zweimal aufgerufen, damit tatsaechlich
  ein Fehler auftritt, wenn die Liste durch den Aufruf zerstoert wird. }
  MaxZeig := ZeigListMax (Liste);
  MaxZeig := ZeigListMax (Liste);
  if MaxZeig = nil then
    writeln('Leere Eingabefolge!')
  else
    writeln ('Das Maximum ist ', MaxZeig^.info, '.')
end. { testeZeigListMax }
