{ vim: set expandtab ts=2 sw=2 ai :}
{$B+}
{$R+}

program Transpose(input, output);

  const
  GROESSE = 5;
  
  type
  tIndex = 1..GROESSE;
  tMatrix = array [tIndex, tIndex] of integer;
  
  var
  A : tMatrix;
  hilf, 
  i, 
  j : integer;
  
function PrintMatrix( Matrix: tMatrix ): integer;
begin
  for i := 1 to GROESSE do
    begin
    for j:= 1 to GROESSE do
        write(Matrix[i,j]:3);
    writeln()
    end;
  PrintMatrix := 0
end; { end PrintMatrix }


begin

  for i := 1 to GROESSE do 
    for j := 1 to GROESSE do 
      readln(A[i,j]);
{
  CASE B works

  begin
  for i := 0 to GROESSE-1 do
    for j := 2 to GROESSE+1 do
      if (i+j) <= GROESSE then
      begin
        hilf := A[i+1,j+i];
        A[i+1,j+i] := A[j+i,i+1];
        A[j+i,i+1] := hilf
      end
  end;
}

{
CASE C fails!
for i := 1 to GROESSE-1 do
  for j := GROESSE downto i+1 do
  begin
    hilf :=A[i,j];
    A[j,i] := A[i,j];
    A[i,j] := hilf
  end;
}

{ CASE D working
begin
  for i := 1 to GROESSE-1 do
  begin
    j := i+1;
    while j <= GROESSE do
    begin
      hilf := A[i,j];
      A[i,j] := A[j,i];
      A[j,i] := hilf;
      j := j+2
    end;
  end;
  for i := 1 to GROESSE-1 do
    begin
    j := i+2;
    while j <= GROESSE do
    begin
      hilf := A[i,j];
      A[i,j] := A[j,i];
      A[j,i] := hilf;
      j := j+2
    end
  end
end;

}
begin
  for i := GROESSE-1 downto 1 do
  begin
    j := i+1;
    while j <= GROESSE do
    begin
      hilf := A[i,j];
      A[i,j] := A[j,i];
      A[j,i] := hilf;
      j := j+2
    end;
    j := i+2;
    while j <= GROESSE do
    begin
      hilf := A[i,j];
      A[i,j] := A[j,i];
      A[j,i] := hilf;
      j := j+2
    end
  end
end;
  PrintMatrix(A);
    
end.
