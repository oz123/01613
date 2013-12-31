{$B+}
{$R+}
{ 31 Dez 2013 }
program TestFibonacy (input, output);
  { a program to test the function FiboacciRek }  
  
  type
  tNatZahl = 0..maxint;
  
  var
  Zahl : tNatZahl;
  
  function FiboacciRekText(inZahl : tNatZahl) : tNatZahl;
  { calculate the Fiboacci Number of a given inZahl as given 
    in the text }

  begin
    if inZahl < 2 then
      { simplify both cases for 0 and 1 }
      FiboacciRekText := inZahl 
    else
      FiboacciRekText := FiboacciRekText(inZahl - 1) 
                       + FiboacciRekText(inZahl - 2)  
  end; { end FiboacciRekText }


  function FiboacciIter(inZahl : tNatZahl) : tNatZahl;
  {
   Iteratively calculate the Fiboacci Number of a given 
   inZahl.
   This Iterative version is more complex, but it is more 
   efficient, and it need way less memory ...
  }

    var
    letzte, 
    vorletzte, 
    aktuelle,
    lauf : tNatZahl;

  begin
    if inZahl < 2 then
      FiboacciIter := inZahl
    else
    begin
      { initialize the variables for f(0) f(1) 
      so that f(2) can be calculated }
      vorletzte := 0;
      letzte := 1;
      { calculate f(2) to f(inZahl) }
      for lauf := 2 to inZahl do
      begin
        aktuelle := vorletzte + letzte;
        vorletzte := letzte;
        letzte := aktuelle
      end;
      FiboacciIter := aktuelle
    end 
  end; { end FiboacciIter  }

  function FiboacciRek(inZahl : tNatZahl) : tNatZahl ;
  { calculate the Fiboacci Number of a given inZahl }
  
    var 
    FibSum :tNatZahl;

  begin
    if (inZahl = 0) then 
      FiboacciRek := 0
    else
      if (inZahl = 1) then
         FiboacciRek := 1
      else
      begin
        FibSum := FiboacciRek(inZahl-1)+FiboacciRek(inZahl-2);
        FiboacciRek := FibSum
      end
  end; {end function }

begin
  writeln('Please type in a whole number:');
  readln(Zahl);
  write('The Fiboacci number of ', Zahl, ' is: ');
  Zahl := FiboacciRek(Zahl);
  writeln(Zahl)
end. { TestFibonacy }
