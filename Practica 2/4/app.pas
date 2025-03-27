program app;

var
    
    number : integer;
    copyNumber: integer;
    reverseNumber : integer;

begin
    
    Write('Introducir un numero: ');
    ReadLn(number);
    copyNumber := number;
    reverseNumber := 0;

    repeat
        reverseNumber := reverseNumber*10 + number mod 10;
        number := number div 10;
    until number = 0;

    if reverseNumber = copyNumber then
        begin
            WriteLn('El numero ', copyNumber, ' SI es capicua.');
        end
    else
        begin
            WriteLn('El numero ', copyNumber, ' NO es capicua y su inverso es ', reverseNumber, ' .');
        end;

end.