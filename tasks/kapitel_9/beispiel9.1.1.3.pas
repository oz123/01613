{ vim: set expandtab ts=2 sw=2 ai :}
{$B+}
{$R+}
{ 31 Dez 2013 }

const
FEHLERCODE = -1.0;

function WerteZiffernfolgeAus (
           inZiffernString : string ) : real;

  { liefert den Wert des uebergebenen Ziffernstrings als
    real-Zahl zurück, benutzt die Funktionen length, 
    liesZeichen, pruefeZeichen und konvertiere }

  type
  tWoBinIch = ( vorDemKomma, nachDemKomma );
  tNatZahl = 0..maxint;

  var
  Zeichen : char;
  Wert, 
  Genauigkeit : real;
  Position : tNatZahl;
  woBinIch : tWoBinIch;
  fehlerfrei : boolean;

begin
  Wert := 0.0;
  Genauigkeit := 1.0;
  woBinIch := vorDemKomma;
  fehlerfrei := true;
  Position := 1;
  
  While (Position <= length(inZiffernString)) and fehlerfrei do
  begin 
    Zeichen := liesZeichen( inZiffernString, Position );
    if pruefeZeichen((Zeichen) then 
    begin
      if woBinIch = nachDemDomma then
        Genauigkeit := Genauigkeit / 10.0 ; 
      Wert := 10.0 * Wert + konvertiere(Zeichen) 
    end { if }
    else
      if (Zeichen = '.') and (woBinIch = vorDemKomma) then
        woBinIch := nachDemKomma
      else
        fehlerfrei := false;
      Position := Position + 1    
  end; { while }
  if not fehlerfrei 
    or ( length(inZiffernString) = 0 )
    or ( (woBinIch = nachDemKomma) and (length(inZiffernString = 1)) ) then
    { illegale Zeichenfolge }
    WerteZiffernfolgeAus := FEHLERCODE
  else
    WerteZiffernfolgeAus := Wert * Genauigkeit 
end; { WerteZiffernfolgeAus }

