{ vim: set expandtab ts=2 sw=2 ai :}
{$B+}
{$R+}

program StringTest(input, output);
{ Ein Beispiel fuer String-Operation
  4.2.1.9 s. 108
}
  
  const
  MAXLAENGE = 100;

  var
  
  Zeichenkette : string [MAXLAENGE];

begin
  Zeichenkette := 'Dies ist ein kurzer Sazt.';
  writeln(Zeichenkette);
  writeln('Das dritte Zeichen ist ', Zeichenkette[3]);
  write('Das letzte Zeichen ist :');
  writeln( Zeichenkette[length(Zeichenkette)] );
end. { StringTest }
