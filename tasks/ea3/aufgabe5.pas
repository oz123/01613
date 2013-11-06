program Parameter1 (output);
{ Dieses Programm hat keine sinnvolle Semantik, zeigt schlech-
ten Programmierstil und dient nur zum Ueben der Parameterueber-
gabearten. }

  var
  a,
  b,
  c : integer;

procedure globalProc (var d, e, f: integer);
  var
  agp : integer;
  
    procedure lokalProc (var g, h, i: integer);
    var
    blp : integer;  
    begin
      g := h + i;
      blp := c;
      agp := 2 * blp;
      i := agp + blp
    end; { lokalProc }

  begin
    a := 4;
    b := 5;
    c := 6;
    d := e - f;
    lokalProc (a, d, e);
    e := f - d
  end; { globalProc}


begin
  a := 1;
  b := 2;
  c := 3;
  globalProc (c, b, a);
  writeln (a, ' ', b, ' ', c)
end. { Parameter1 }
