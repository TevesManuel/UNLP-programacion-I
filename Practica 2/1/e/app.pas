program app;

var

    number: Integer;
    total_digits : Integer;

begin
    
    total_digits := 0;

    repeat 
        write('Introduce un numero: ');
        readln(number);
        repeat
            if ((number mod 10) mod 3) = 0 then
                begin
                    writeln(number mod 10, ' es un multiplo de 3.');
                end;
            total_digits := total_digits + 1;
            number := number div 10;
        until number = 0;
    until total_digits >= 100;
    write(total_digits);
end.