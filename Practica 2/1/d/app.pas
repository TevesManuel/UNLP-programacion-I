program app;

var

    number: Integer;

begin

    repeat
        write('Introduce un numero: ');
        readln(number);
        if number <> -1 then
            begin
                repeat
                    if ((number mod 10) mod 3) = 0 then
                        begin
                            writeln(number mod 10, ' es un multiplo de 3.');
                        end;
                    number := number div 10;
                until number = 0;
            end;
    until number = -1;

end.