function factorial(n: integer):integer;
var
    total : integer;
    it : integer;
begin
    total := 1;
    for it := 1 to n do
        begin
            total := total * it;
        end;
    factorial := total;
end;

var
    // input_number : integer;
    m: integer;
    n: integer;
begin
    // Write('Introduzca un numero: ');
    // ReadLn(input_number);
    // WriteLn('Su factorial es ', factorial(input_number));
    Write('Introduzca m: ');
    ReadLn(m);
    Write('Introduzca n: ');
    ReadLn(n);
    WriteLn('El numero combinatorio es ', (factorial(m)/(factorial(m-n)*factorial(n))):2:2);
end.