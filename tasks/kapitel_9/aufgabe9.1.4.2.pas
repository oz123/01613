{ vim: set expandtab ts=2 sw=2 ai :}
{$B+}
{$R+}

const 
FELDMAX := 5;

type
tBereich = 1..FELDMAX;
tFeld = Array[tBereich] of integer;
tRueckgabe = (unsortiert, sortiert, sortiertDuplikatfrei);

function pruefeFeld( inFeld:tFeld ): tRueckgabe;
{Prüft, ob inFeld aufsteigend sortiert ist.
Ruckgabe: 
- sortiert, falls das Feld aufsteigend sortiert ist, 
  also inFeld[i] >= inFeld[i-1] für 2 <= i <= FELDMAX 
- sortiertDuplikatfrei, falls das Feld aufsteigend sortiert
  und duplikatfrei ist, also
  inFeld[i] > inFeld[i-1] für 2 <= i <= FELDMAX 
- unsortiert sonst }


var 
i: tBereich;
dupl: boolean;

begin
  i:=2;
         { A }                       { B }  
  while (i < FELDMAX) and (inFeld[i-1] <= inFeld[i]) do
                      { C := A and B }
  begin
                { D }
  if inFeld[i-1] = inFeld[i] then
    dupl := true;
  i := i+1;
  end; { while }
     {  E  }             {F}                          {G}    
  if (i < FELDMAX) or ((i = FELDMAX ) and (inFeld[i-1] > inFeld[i])) then
                                     { H := F and G }
                  { I:= E or H }
    pruefeFeld := unsortiert 
  else 
                  { J }              { K }
    if (inFeld[i-1] < inFeld[i]) and not dupl then
      {                         L := J and K }
      pruefeFeld := sortiertDuplikatfrei
    else
      pruefeFeld := sortiert ;
end;

