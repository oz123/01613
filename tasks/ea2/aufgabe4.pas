{ vim: set expandtab ts=2 sw=2 ai :}
{$B+}
{$R+}

program Maximum(input, output);
{
  Find the Maximum in a row of numbers 
}

{ A: Falsch  
  type }
    { tAlter := 1..80;  Falsch !!! type definition sind nicht 
    * Zuweisungen!!!
    * Korrekt: tAlter = 1..80} 
{    tAlter = 1..80;}
    { tString := string[20] is Falsch s}
{
    tString = string[20];
}
    { tIndex := 1..20; }
{
    tIndex = 1..20;
    tPerson = record
        Vorname,
        Name : tString;
        Alter : tAlter
        end;
    tPersonfeld := array [tIndex] of tPerson; }
{
    tPersonfeld = array [tIndex] of tPerson;
}

{
  B: Falsch
}
  
{
  type
  tAlter = 1..80;
  tString = string[20];
  tIndex = 1..20;
  tPerson = record
    Vorname,
}
{
      Name : tString , mit Komma ist Falsch! Nach end of Type, 
      * wir muessen ; geben!
}
{
    Name : tString;
    Alter : tAlter
     end;
   tPersonfeld = array [tIndex] of tPerson;
}

{ C: Korrekt }
{
    type
    tAlter = 1..80;
    tString = string[20];
    tIndex = 1..20;
    tPerson = record
      Vorname,
      Name : tString;
      Alter : tAlter
    end;
    tPersonfeld = array [tIndex] of tPerson;
}

{ D: Falsch }
{
    type
    tAlter = 1..80;
    tString = string[20];
    tIndex = 1..20;
    tPerson = record
        Vorname,
}
{
        Name = tString; FALSCH, kein Zuweisung von Type. Es soll ':' sein
        * statt '='
        Alter = tAlter
        end;
}
{
    tPersonfeld = array [tIndex] of tPerson;
} 
  type
  tAlter = 1..80;
  tString = string[20];
  tIndex = 1..20;
  tPerson = record
    Vorname, 
    Name : tString;
    Alter : tAlter;
    end;
  
{ E: Falsch
  type
  tAlter = 1..80;
  tString = string[20];
  tIndex = 1..20;
  tPerson = record
    Vorname,
    Name : tString;
    Alter : tAlter
  end;
}
  {tPersonfeld = array (tIndex) of tPerson; }{OBVIOUSLY  FALSCH!!!}
  {tPersonfeld = array [tIndex] of tPerson; }{Korrekt!!!}

  
  var
  Zahl, 
  Groesste : Integer ;
  
begin
  writeln('Geben Sie die integer-Zahlen ein. 0 beendet die Eingabe.');
  readln(Zahl);
  Groesste := Zahl ;
    while Zahl <> 0 do
    begin
      if Zahl > Groesste then
        Groesste := Zahl ; 
    readln (Zahl)
    end;
    if Groesste <> 0 then
      writeln('Die Groesste Zahl lautet ', Groesste, '.')
    else
      writeln('Leere Eingabefolge!')
end. {end Maximum}
