{vim: tabstop=2}
{compiler options}
{ Code Conventions:
  tSomeType - t prefix for TypeDefined variables
  number, holder - integer variables
  GuestNumber, RoomNumber - CamelCase for variables with multiple words
  RNumber, RArea - Prefix R for Real Numbers
  PI, GRAVITY - Constants are written with capitals only.
  Single instruction in each line.
  `begin` and `end` are also single in each line
  In handwritten code, underscore key words like `var`, `begin`, `end` etc.
  Code between `begin` and `end` is 2 or 4 spaces indented. The words`begin` and `end`
  words them selves are not indented.
  Instructions after control structs like `if` and `else` are also indented.
  After long blocks of code the keyword `end` should be followed 
  by a comment describing the begin of block.
  }
{$B+}
{$R+}
Program FarenheitToCelsius(input, output);
{Convert temperature give in Farenheit degrees to Celsius degrees}

var 
    rFarenheitDeg,
    rCelsiusDeg : real; 

begin 
  writeln( 'Geben Sie ein Temperature in Farenheitsgrad :' );
  readln (rFarenheitDeg);
  write ('Die Temperature in Celsius ist: ' );
  rCelsiusDeg := 5 * ( rFarenheitDeg - 32 ) / 9;
  writeln (rCelsiusDeg:3:2, ' C ');
end. {end program FarenheitToCelsius}

