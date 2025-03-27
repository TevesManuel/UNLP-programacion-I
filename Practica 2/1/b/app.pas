program app;

var

    number: Integer;
    min: Integer;

begin
    
    min := 9;

    write('Introduce un numero: ');
    readln(number);
    repeat
        if ((number mod 10) mod 3) = 0 then
            begin
                writeln(number mod 10, ' es un multiplo de 3.');
            end;
        if (number mod 10) < min then
            begin
                min := number mod 10;
            end;
        number := number div 10;
    until number = 0;
    writeln('El digito menor es ', min);
end.