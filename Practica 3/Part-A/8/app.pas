procedure averageYearsOld(n: integer; var average: real);
var
    i: integer;
    input: integer;
    total: integer;
begin
    total := 0;
    for i := 1 to n do
        begin
            Write('Introduzca la edad de la persona ', i, ': ');
            Readln(input);
            total := total + input;
        end;
    average := total/n;
end;

var
    average: real;
begin
    averageYearsOld(2, average);
    WriteLn('El promedio de edades es ', average:2:2);
end.