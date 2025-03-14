program app;

var

    num: Integer;

begin

    Write('Introducir un numero para determinar si es par: ');
    Read(num);

    if (num mod 2) = 0 then
        begin
            Write('El numero ', num, ' es par');
        end
    else
        begin
            Write('El numero ', num, ' no es par');
        end;

end.