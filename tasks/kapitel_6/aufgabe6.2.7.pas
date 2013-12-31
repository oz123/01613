{ vim: set expandtab ts=2 sw=2 ai :}
{$B+}
{$R+}
{ 31 Dez 2013 }

program TestFeldMaxRek(input, output);
{
 Test the function FeldMaxRek
}


  const 
  FELDGROESSE = 10;

  type
  tIndex = 1..FELDGROESSE;
  tFeld = array  [tIndex] of integer;
  
  
  var
  EingabeFeld : tFeld;
  i : tIndex;

  function FeldMaxRek( inMaxPos: tIndex; var inFeld : tFeld ): tIndex;
  { bestimmt rekursiv in inFeld die Position des Maximums }
  
    var 
    lokMaxPos : tIndex; 

  begin
    if inMaxPos = FELDGROESSE then
      FeldMaxRek := inMaxPos
    else
    begin
      { find the maximum of the elements inFeld[inMaxPos] 
        to inFeld[FELDGROESSE] }
      lokMaxPos :=  FeldMaxRek( inMaxPos + 1, inFeld );
      
      {  
       compare the recieved value with the first element of 
       inFeld
      }
      if inFeld[inMaxPos] < inFeld[lokMaxPos] then
        FeldMaxRek := lokMaxPos
      else
        FeldMaxRek := inMaxPos
    end 
  end; { FeldMaxRek }


begin
  { Einlesen des Feldes }
  writeln ( 'Geben Sie ', FELDGROESSE, ' Werte ein: ' );
  for i := 1 to FELDGROESSE do
    readln(EingabeFeld[i]);

  writeln('Given:');
  for i := 1 to FELDGROESSE do
    write ( EingabeFeld [i]:6);
  writeln; 
  
  {find the maximum with FeldMaxRek}
  writeln( EingabeFeld[FeldMaxRek(1, EingabeFeld)] )
end. { FeldSort }
