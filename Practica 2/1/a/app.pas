program app;

var

    number: Integer;

begin
    
    write('Introduce un numero: ');
    readln(number);
    repeat
        if ((number mod 10) mod 3) = 0 then
            begin
                writeln(number mod 10, ' es un multiplo de 3.');
            end;
        number := number div 10;
    until number = 0;

end.