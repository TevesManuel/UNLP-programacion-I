program app;
procedure digitsProportionalCounter( number : Integer );
var

    oddCounter : Integer;
    counter : Integer;

begin

    oddCounter := 0;
    counter := 0;

    while number <> 0 do
        begin
            counter := counter + 1;
            if ((number mod 10) mod 2) <> 0 then
                begin
                    oddCounter := oddCounter + 1;
                end;
            number := number div 10;
        end;
    
    WriteLn('El porcentaje de numeros impares es ', ((oddCounter / counter)*100.0):2:2, '%');
    WriteLn('El porcentaje de numeros pares es ', (((counter-oddCounter) / counter)*100.0):2:2, '%');
end;

var

    numberInput: Integer;

begin

    Write('Introduzca un numero: ');
    ReadLn(numberInput);

    digitsProportionalCounter(numberInput);

end.