{ vim: set expandtab ts=2 sw=2 ai :}
{$B+}
{$R+}

program Merge(input, output);
{
  liest ohne Eingabeueberpruefung zwei sortierte Felder mit
  integer-Zahlen ein; beide Felder werden in Feld sortiert 
  zusammengefuegt; das Ergebnis wird ausgegeben; ist die Ein-
  gabe unsortiert, so ist das Ergebnisfeld nicht sortiert }
  
  const
  GRENZE1 = 5;
  GRENZE2 = 8;
  GRENZE  = 13;
  GRENZE1PLUS1 = 6;
  GRENZE2PLUS1 = 9;
  GRENZEPLUS1 = 14;
  
  type
  tIndex1      = 1..GRENZE1;
  tIndex2      = 1..GRENZE2;
  tIndex       = 1..GRENZE;
  tIndex1Plus1 = 1..GRENZE1PLUS1;
  tIndex2Plus2 = 1..GRENZE2PLUS1;
  tIndexPlus1  = 1..GRENZEPLUS1;
  tFeld1       = array [tIndex1] of integer;
  tFeld2       = array [tIndex2] of integer;
  tFeld        = array [tIndex]  of integer;
  tFeldKopie   = array [tIndex]  of integer;
  
  var
  Feld1 : tFeld1;
  Feld2 : tFeld2; 
  Feld  : tFeld ;
  i     : tIndexPlus1;
  j     : tIndex2Plus2;
  k     : tIndexPlus1;
  l     : tIndex;
  push  : integer;

function PrintField1( size: integer; Feld: tFeld1 ): integer;
begin
  for k := 1 to size do
    write(Feld1[k]:4);
  writeln;
  PrintField1 := 0
end; { end PrintField1 }

function PrintField2( size: integer; Feld: tFeld2 ): integer;
begin
  for k := 1 to size do
    write(Feld2[k]:4);
  writeln();
  PrintField2 := 0
end; { end PrintField2 }

function PrintField( size: integer; Feld: tFeld ): integer;
begin
  for k := 1 to size do
    write(Feld[k]:4);
  writeln();
  PrintField := 0
end; { end PrintField }

function Find2Push(i, Zahl: integer; Feld: tFeld): integer;
  {Find how many elements in an array need to be 
  * right shifted
  * i - The number of cells to check 
  * Zahl - The number to be checked
  * Feld - The given array
  * 
  * example: 
  * Find2Push(4, 2, [1, 2, 3, 4, 0, 0])
  * will return 2, since two elements in the array are
  * larger than 2. 
  *  }   
  var
  topush : integer;  
begin
  topush := 0;
  for k := i downto 1 do
  begin
    if Zahl < Feld[k] then  
      topush := topush + 1;
  end;
  Find2Push := topush
end; { end FindNPush }

function ReadArray1(size : integer; Feld1: tFeld1): tFeld1;
{ Read 'size' elements from the console }
begin
  writeln('Please give ', size, ' values');
  for i := 1 to size do
    readln(Feld1[i]);   
  
  ReadArray1 := Feld1;
end;

function ReadArray2(size : integer; Feld1: tFeld2): tFeld2;
{ Read 'size' elements from the console }
begin
  writeln('Please give ', size, ' values');
  for i := 1 to size do
    readln(Feld2[i]);   
  
  ReadArray2 := Feld2;
end;

function PushFeldRight( Feld : tFeld; von, Bis, insert : integer) : tFeld;
{ push values in Field values to the right von Bis
 * e.g:
 * Feld = ( 1, 2, 3, 4, 5, 0 )
 * Feld := PushFeld(Feld, 6, 2, 1)
 * will result in :
 * Feld = ( 1, 1, 2, 3, 4, 5 )
 * Size is the array's size
 * }
begin 
  for k:= Von downto Von-Bis do
  begin
    if k > 1 then
      Feld[k] := Feld[k-1]
  end;
  Feld[k] := insert;
  PushFeldRight := Feld
end ; {EndPush }


function KoppieFirstArray(Feld: tFeld; Feld1: tFeld1) : tFeld; 
  var
  i : integer;
begin
  for i := 1 to GRENZE1 do
    Feld[i] := Feld1[i];
    KoppieFirstArray := Feld;
end;

begin 
  {for debug purposes - intialize the array}
  for i := 1 to GRENZE do
    Feld[i] := 0;
  
  { read the first array, this is lame, should be done with a procedure }
  Feld1 := ReadArray1(GRENZE1, Feld1);
  
  { read the second array, should be done with a procedure }
  Feld2 := ReadArray2(GRENZE2, Feld2);
  
  { This is just for debugging 
  PrintField1(GRENZE1, Feld1); 
  PrintField2(GRENZE2, Feld2); 
  PrintField(GRENZE, Feld);}
  {Copy the first array into the merged array}
  Feld := KoppieFirstArray(Feld, Feld1);
  {
  PrintField(GRENZE, Feld);
  }
  {Copy the second array into the merged array}
  
  for i := GRENZE1PLUS1 to  GRENZE do
  begin
    push := 0;
    push := Find2Push(i-1, Feld2[i-GRENZE1], Feld); 
    if push > 0 then
    begin
      Feld := PushFeldRight( Feld, i , push, Feld2[i-GRENZE1] );
    end
    else
      Feld[i] := Feld2[i-GRENZE1];
  end;  

  PrintField(GRENZE, Feld);
end. {end Merge}
