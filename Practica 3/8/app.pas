procedure averageYearsOld(n: integer);
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
    Writeln('El promedio de edad es ', (total/n):2:2);
end;

begin
    averageYearsOld(25);
end.