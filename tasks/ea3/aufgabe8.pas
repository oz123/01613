{$B+}
{$R+}

program TestPointres(input, output);

  type
  tPerson = record
              Name : string[20];
              Alter : integer
            end;
  var
  pPerson1,
  pPerson2 : ^tPerson;
  Zahl1,
  Zahl2 : integer;
  pZahl1,
  pZahl2 : ^integer;

begin

{ Fehler
  new(pPerson1);
  pPerson1.Name := 'Monika';
  pPerson1.Alter := 31;
}
{ Error assigning integer to pointer
  new (pZahl1);
  new (pZahl2);
  pZahl1 = 15;
  pZahl2 := pZahl1;
}


  Zahl1 := 35;
  new(pPerson1);
  pPerson1^.Name := 'Till';
  {assign the VALUE of Zahl}
  new(pZahl1);
  pPerson1^.Alter := Zahl1;
  writeln(pPerson1^.Alter);
  writeln(Zahl1);
  pZahl1^ := Zahl1;
  Zahl2 := pZahl1^;
  writeln(Zahl1);
  writeln(Zahl2);
   { Modifying the value of Zahl1
  
   does not influence }
  {Zahl1 := 243;}
  { will still write 35 to screen }
  {writeln(pPerson1^.Alter)}

{ same old same old, trying to assing integer to pointer}
{  new(pZahl1);
  new(pZahl2);
  Zahl1 := 23;
  Zahl2 := 75;
  
  if ( Zahl1 < Zahl2 ) then
    pZahl1 := 23
  else
    pZahl2 := 75;}
{ will fail ... pZahl2 does not exist 
  new(pZahl1);
  Zahl1 := 34;
  pZahl1^ := Zahl1
  pZahl2 := pZahl1;
  }
end.
