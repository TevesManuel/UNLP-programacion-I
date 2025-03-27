program app;

var

    number: Integer;
    i : integer;
begin
    
    for i := 0 to 80 do
        begin
            write('Introduce un numero: ');
            readln(number);
            repeat
                if ((number mod 10) mod 2) = 1 then
                    begin
                        writeln(number mod 10, ' es impar.');
                    end;
                number := number div 10;
            until number = 0;
        end;
end.