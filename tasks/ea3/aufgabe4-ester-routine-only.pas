	procedure SortiereListe2(var ioRefListe : tRefListe);
  { sortiert eine lineare Liste aufsteigend }

  var
  ZeigerAktuell,
  ZeigerAnfang,
  ZeigerVorgaenger: tRefListe;
     
  begin
  if ioRefListe <> nil then {falls erstes Element existiert}
  begin
    ZeigerAktuell := ioRefListe;
    ZeigerVorgaenger := ioRefListe;
    while ZeigerAktuell^.next <> nil do
      begin
        ZeigerAnfang := ioRefListe;
        if ZeigerAktuell^.info < ZeigerAktuell^.next^.info then
          ZeigerAktuell := ZeigerAktuell^.next { Sortierung ist aufsteigend }
        else
        begin
          ZeigerVorgaenger := ZeigerAktuell;
          ZeigerAktuell := ZeigerAktuell^.next;
          ZeigerVorgaenger^.next := ZeigerAktuell^.next;
          if ZeigerAktuell^.info < ZeigerAnfang^.info then
          begin
            ioRefListe := ZeigerAktuell;
            ZeigerAktuell^.next :=ZeigerAnfang;
          end {if Folgeelement kleiner als erstes Element}
          else
          begin
            ZeigerVorgaenger := ZeigerAnfang;
            ZeigerAnfang := ZeigerAnfang^.next;
            if ZeigerAktuell^.info < ZeigerAnfang^.info then
            begin
              ZeigerVorgaenger^.next := ZeigerAktuell;
              ZeigerAktuell^.next := ZeigerAnfang;
            end;
          end; { else Folgeelement kleiner als mittleres Element }
        end; { else Sortierung nicht aufsteigend }
      end; { end while }
    end; { end if list not empty }
  end; {SortiereListe}


    procedure SortiereListe (var ioRefListe : tRefListe);
      { sortiert eine lineare Liste aufsteigend }
       
     
     
     
        var
       
        ZeigerAktuell,
        ZeigerAnfang,
        ZeigerVorgaenger: tRefListe;
     
      begin
        if ioRefListe <> nil then {falls erstes Element existiert}
        begin
            ZeigerAktuell := ioRefListe;
            ZeigerVorgaenger := ioRefListe;
           
            while ZeigerAktuell^.next <> nil do
            begin
                ZeigerAnfang := ioRefListe;
                if ZeigerAktuell^.info < ZeigerAktuell^.next^.info then
                    ZeigerAktuell := ZeigerAktuell^.next { Sortierung ist aufsteigend }
               
                else
                begin
                    ZeigerVorgaenger := ZeigerAktuell;
                    ZeigerAktuell := ZeigerAktuell^.next;
                    ZeigerVorgaenger^.next := ZeigerAktuell^.next;
                    if ZeigerAktuell^.info < ZeigerAnfang^.info then
                    begin
                        ioRefListe := ZeigerAktuell;
                        ZeigerAktuell^.next :=ZeigerAnfang;
                    end {if Folgeelement kleiner als erstes Element}
                   
                    else
                    begin
                        ZeigerVorgaenger := ZeigerAnfang;
                        ZeigerAnfang := ZeigerAnfang^.next;
                        if ZeigerAktuell^.info < ZeigerAnfang^.info then
                        begin
                            ZeigerVorgaenger^.next := ZeigerAktuell;
                            ZeigerAktuell^.next := ZeigerAnfang;
                        end;
                    end; { else Folgeelement kleiner als mittleres Element }
                end; { else Sortierung nicht aufsteigend }
            end;
        end;
      end; {SortiereListe}

