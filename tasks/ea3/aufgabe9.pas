{$B+}
{$R+}
{$mode objfpc}

program TestMoveToFront(input, output);
  
  Uses sysutils;
  
  type
  tRefListe = ^tListe;
  tListe = record
             info : integer;
             next : tRefListe
           end;
  
  var 
  Liste : tRefListe;
  Zahl : integer;
  gefunden: boolean;
    
  procedure ListeAufBauen( var outRefAnfang: tRefListe);
  { baut eine Liste eine einzulesenden integer-Zahlen auf}
    var
    Zeiger : tRefListe;
    Zahl : integer;
    
  begin
    { zunaechst outRefAnfang auf nil setzen, damit der leeren Liste
      gestartet wird }
      outRefAnfang := nil;
      readln(Zahl);
      while Zahl <> 0 do
      begin
        new(Zeiger);
        Zeiger^.info := Zahl;
        Zeiger^.next := outRefAnfang;
        outRefAnfang := Zeiger;
        readln(Zahl)
      end { while }
  end; { ListeAufBauen }
  
  procedure ListeDurchLaufen ( inRefAnfang : tRefListe);
  { gibt die Werte der Listenelemente aus }
    var 
    Zeiger : tRefListe;
  
  begin
    Zeiger := inRefAnfang;
    while Zeiger <> nil do
    begin
      write( Zeiger^.info,'  ');
      Zeiger := Zeiger^.next
    end;
  writeln;
  writeln('****')
  end; { ListeDurchLaufen}
  
  
  procedure moveToFront (
    inSuchwert : integer;
    var ioAnfang : tRefListe;
    var outGefunden : boolean);
    { bestimmt in einer linearen Liste das erste Element mit dem
    Wert inSuchwert und positioniert es als erstes Listen-
    element }
    var
    Zeiger,
    { Zeiger zum Durchhangeln }
    Hilfszeig : tRefListe; { Hilfszeiger zum Umhaengen }
    gefunden : boolean;
    
    begin
      gefunden := false;
      if ioAnfang <> nil then { Liste ist nicht leer }
        if ioAnfang^.info = inSuchwert then
          { gefundenes Element ist schon das erste Element }
          gefunden := true
        else
        begin
          Zeiger := ioAnfang;
          while (Zeiger^.next <> nil) and not gefunden do
            if Zeiger^.next^.info = inSuchwert then
            begin { Suchwert ist gefunden }
              gefunden := true;
              { **Umhaengen** }
              {A}
              { aufgabe9.pas(83,34) Error: Incompatible types: got "SmallInt" 
                expected "tRefListe"}
              {Hilfszeig := Zeiger^.info;
              Zeiger^.next := ioAnfang^.next;
              ioAnfang^.next := Hilfszeig}
              {B}
              {Hilfszeig := Zeiger^.next;}
              { Point to self???, causes endless loop!}
              {Hilfszeig^.next := Zeiger^.next; 
              Zeiger^.next := ioAnfang;
              ioAnfang := Zeiger;}
              {C}
              { Keep a copy of the next element}
{
              Hilfszeig  := Zeiger^.next;
}
              //writeln('Hilfszeig ', Hilfszeig^.next); 
              {link Zeiger^.next to the next element after the one found}
{
              Zeiger^.next := Hilfszeig^.next;
}
              { put the found value in the start of the list }
{
              Hilfszeig^.next := ioAnfang;
}
              { return the ioAnfang }
{
              ioAnfang := Hilfszeig;
              case C is working !
}
            {D}
            { Utterly fail: trying assign  
              with to .^next }
{
            writeln('Will now CRASH!!!');
            Hilfszeig^.next := Zeiger^.next;
            Zeiger^.next := Hilfszeig^.next^.next;
            Hilfszeig^.next^.next := ioAnfang;
            ioAnfang := Hilfszeig^.next;
}
            {E}
            {will link the found element to the beginning
            droping the end! so the list is endless!}
            {Hilfszeig := Zeiger^.next;
            Hilfszeig^.next := ioAnfang;
            ioAnfang := Hilfszeig;}
            end
            else
              Zeiger := Zeiger^.next
        end; { else }
      outGefunden := gefunden
    end; { moveToFront }
begin

  ListeAufBauen(Liste);
  ListeDurchLaufen(Liste);
  Zahl := 1;
  gefunden := false;
  while Zahl <> 0 do
  begin
    writeln('Please enter a number to search');
    readln(Zahl);
    moveToFront(Zahl, Liste, gefunden);
    writeln(gefunden);
    ListeDurchLaufen(Liste)
  end;
end.
