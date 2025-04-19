function pow(i: integer; n: integer): integer;
var
    it: integer;
    total: integer;
begin
    total := 1;
    for it := 1 to n do
        begin
            total := total * i;
        end;
    pow := total;
end;

var
    input_base: integer;
    input_exp: integer;
begin
    Write('Introduzca la base: ');
    ReadLn(input_base);
    // Write('Introduzca el exponente: ');
    // ReadLn(input_exp);
    // WriteLn('El resultado de ', input_base, '^', input_exp, ' es ', pow(input_base, input_exp));
    WriteLn('El cuadrado del numero es ', pow(input_base, 2), ' el cubo del numero es ', pow(input_base, 3));
    Write('Introduzca n: ');
    ReadLn(input_exp);
    WriteLn('2^', input_exp, ' = ', pow(2, input_exp));
end.