program pas;

var

    num: Integer;

begin

    Write('Introducir un numero: ');
    Read(num);

    if (num mod 5) = 0 then
        begin
            WriteLn('El numero ingresado ', num, ' es multiplo de 5');
        end
    else
        begin
            WriteLn('El numero ingresado ', num, ' no es multiplo de 5');
        end;

end.