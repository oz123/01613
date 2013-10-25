{ vim: set expandtab ts=2 sw=2 ai :}
{$B+}
{$R+}

program Maximum(input, output);
{
  Find the Maximum in a row of numbers 
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
  

  var
  Zahl, 
  Groesste : Integer ;
  
begin
    writeln(7 div 2);
end. {end Maximum}
