program app;

procedure oddAndEvenNumberCounter( number: Integer );
var

    oddCounter  : Integer;
    evenCounter : Integer;

begin
    oddCounter := 0;
    evenCounter := 0;
    
    while number <> 0 do
        begin
            // WriteLn('Digit ', number mod 10);
            if (( number mod 10 ) mod 2) = 0 then
                begin
                    evenCounter := evenCounter + 1;
                end
            else
                begin
                    oddCounter := oddCounter + 1;
                end;
            number := number div 10;
        end;
    
    WriteLn('La cantidad de digitos impares es ', oddCounter, ' y la cantidad de digitos pares es ', evenCounter);
end;

var

    numberInput: Integer;

begin

    Write('Ingresar un numero: ');
    ReadLn(numberInput);

    oddAndEvenNumberCounter(numberInput);

end.