{vi: tabstop=2}
{vi: softtabstop=2}
{compiler options}
{$B+}
{$R+}
Program Dreiecke(input, output);
{ Dreiecksbestimmung }

  
Var 
  a,  
  b,
  c : integer;
  s, 
  Flaeche : real;

Begin
  { lese und drucke Dreieckseiten in aufsteigender Folge }
  
  writeln( 'Drei Seitenlanegen in aufsteigender Folge eingeben:' );
  readln (a);
  readln (b);
  readln (c);
  
  writeln (a:3, b:3, c:3 );
  if (b < a) or (c < b) then
    writeln( ' is nicht aufsteigend sortiert!')
  else
    if a + b <= c then
      writeln( ' is kein Dreieck.')
      else
      Begin
        { bestimme die Art des Dreiecks: }
        if a = c then
          write (' is ein glecihseitiges Dreieck')
        else
          if (a = b) or ( b = c ) then
              write ( 'ist ein gleichschenkliges Dreieck')
          else
              write ( 'ist ein ungleichseitiges Dreieck' );
        { bestimme die Flaeche }
      s := 0.5 * ( a + b + c ); 
      Flaeche  := sqrt ( s * ( s - a ) * ( s - b ) * ( s - c ) );
      writeln ( ' der Flaeche ', Flaeche:8:2 )
    end { if a + b <= c }
End.
  
