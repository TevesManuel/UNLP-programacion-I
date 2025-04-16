procedure printLastXNumbers(number: integer; x: integer);
var
    i: integer;
begin
    i := 0;
    while ( (number <> 0) and (i < x) ) do
        begin
            Write(number mod 10);
            if (i <> (x - 1)) and ((number div 10) <> 0) then
                Write(' - ');
            i := i + 1;
            number := number div 10;
        end;
    WriteLn();
end;

var
    number: integer;
begin
    number := -1;
    while(number <> 0) do
        begin
            Write('Introduzca un numero: ');
            ReadLn(number);
            printLastXNumbers(number, 3);
            printLastXNumbers(number, 5);
        end;
end.