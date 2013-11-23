{$B+}
{$R+}
{ 22 Nov 2013 }

program testeFeldMax(input, output);
  { testet die Funktion FeldMax }
  
  const
  UNTEN = 0; { Array-Untergrenze }
  OBEN = 10; { Array-Obergrenze }
  
  type
  tIndex = UNTEN..OBEN;
  tFeld = array[tIndex] of integer;

  var 
  Feld : tFeld;
  i : tIndex;
  Max : integer;
  
  procedure LiesFeld(var ioFeld : tFeld);
  begin
    writeln('Please enter ', OBEN + 1, ' numbers');
    for i := UNTEN to OBEN do
      readln (ioFeld[i])
  end;  
    
  procedure PrintFeld(var inFeld : tFeld);
  begin
    for i := UNTEN to OBEN do
      write(inFeld[i], ' ');
  writeln
  end;
  
  
  function FeldMaxA (
            var inFeld : tFeld;
            inUnten,
            inOben : tIndex) : integer;
            { bestimmt rekursiv das Maximum in einem Feld
            mit den Grenzen inUnten und inOben }
            { seems to work}
    var
    Mitte : tIndex;
    MaxL,
    MaxR : integer;
  
  begin
    if inUnten = inOben then
      FeldMaxA := inFeld[inUnten]
    else
    begin
      Mitte := (inUnten + inOben) div 2;
      MaxL := FeldMaxA (inFeld,inUnten,Mitte);
      MaxR := FeldMaxA (inFeld,Mitte+1,inOben);
      if MaxL > MaxR then
        FeldMaxA := MaxL
      else
        FeldMaxA := MaxR
    end
  end; { FeldMaxA }
  
  function FeldMaxB (
           var inFeld : tFeld;
               inUnten,
               inOben : tIndex) : integer;
  { bestimmt rekursiv das Maximum in einem
  Feld mit den Grenzen inUnten und inOben }
  {failed!}
    var
    Mitte : tIndex;
    MaxL,
    MaxR : integer;
  
  begin
    if inUnten = inOben then
      FeldMaxB := inFeld[inUnten]
    else
    begin
      Mitte := (inUnten + inOben) div 2;
      MaxL := FeldMaxB (inFeld,inUnten,Mitte);
      MaxR := FeldMaxB (inFeld,Mitte,inOben);
    if MaxL > MaxR then
      FeldMaxB := MaxL
    else
      FeldMaxB := MaxR
    end
  end; { FeldMaxB }
  
  function FeldMaxC (
            var inFeld : tFeld;
                inUnten,
                inOben : tIndex) : integer;
    { bestimmt rekursiv das Maximum in einem Feld
    mit den Grenzen inUnten und inOben }
    var
    Mitte : tIndex;
    MaxL,
    MaxR : integer;
    
    begin
      if inUnten > inOben then
        FeldMaxC := inFeld[inUnten]
      else
      begin
        Mitte := (inUnten + inOben) div 2;
        MaxL := FeldMaxC (inFeld,inUnten,Mitte);
        MaxR := FeldMaxC (inFeld,Mitte+1,inOben);
        if MaxL > MaxR then
          FeldMaxC := MaxL
        else
        FeldMaxC := MaxR
      end
    end; { FeldMaxC }
  
  function FeldMaxD (
            var inFeld : tFeld;
                inUnten,
                inOben : tIndex) : integer;
            { bestimmt rekursiv das Maximum in einem Feld
            mit den Grenzen inUnten und inOben }
        
    var
    Mitte : tIndex;
    MaxL,
    MaxR : integer;
    
  begin
    if inUnten > inOben then
      FeldMaxD := inFeld[inUnten]
    else
    begin
      Mitte := (inUnten + inOben) div 2;
      MaxL := FeldMaxD (inFeld,inUnten,Mitte);
      MaxR := FeldMaxD (inFeld,Mitte,inOben);
      if MaxL > MaxR then
        FeldMaxD := MaxL
      else
        FeldMaxD := MaxR
    end
  end; { FeldMaxD }

  function FeldMaxE (
            var inFeld : tFeld;
            inUnten,
            inOben : tIndex) : integer;
  { bestimmt iterativ das Maximum in einem Feld
  mit den Grenzen inUnten und inOben }
    var
    i : tIndex;
    HilfMax : integer; { Hilfsvariable }
  begin
    HilfMax := 0;
    for i := inUnten to inOben do
      if inFeld[i] > HilfMax then
        HilfMax := inFeld[i];
    FeldMaxE := HilfMax
  end; { FeldMaxE }

begin
  LiesFeld(Feld);
  PrintFeld(Feld);
  { A is Working }
  {max := FeldMaxA(Feld, UNTEN, OBEN);}
  
  {B Failed }
  {max := FeldMaxB(Feld, UNTEN, OBEN);}
  
  {C Failed }
  {max := FeldMaxC(Feld, UNTEN, OBEN);}
  
  {D Failed }
  {max := FeldMaxD(Feld, UNTEN, OBEN);}
  
  { E is working }
  max := FeldMaxE(Feld, UNTEN, OBEN);
  
  writeln('Der Maximum ist ', max)
  
end. { testeFeldMax }
