program app;
procedure digitsCounter( number : Integer );
var
    counter : Integer;
begin

    counter := 0;

    while number <> 0 do
        begin
            counter := counter + 1;
            number := number div 10;
        end;

    WriteLn('La cantidad de digitos es ', counter);

end;

var

    numberInput : Integer;

begin

    Write('Introduzca un numero: ');
    ReadLn(numberInput);

    digitsCounter(numberInput);

end.