program Parameter1 (output);
{ Dieses Programm hat keine sinnvolle Semantik, zeigt schlech-
ten Programmierstil und dient nur zum Ueben der Parameterueber-
gabearten. }

  var
  ag,
  bg,
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
    agp := 4;
    bg := 5;
    c := 6;
    d := e - f;
    lokalProc (agp, d, e);
    e := f - d
  end; { globalProc}


begin
  ag := 1;
  bg := 2;
  c := 3;
  globalProc (c, bg, ag);
  writeln (ag, ' ', bg, ' ', c)
end. { Parameter1 }
