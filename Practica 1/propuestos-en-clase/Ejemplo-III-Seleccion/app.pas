program app;
{Impuesto A caja 4}
{Impuesto B caja 2 y 3}
{Impuesto C en caja 1}
{Impuesto D en caja 5 y 6}

var
    charInput: char;

begin
    while true do
    begin
        Write('Ingrese el codigo de el impuesto a pagar: ');
        ReadLn(charInput);
        case charInput of
            'A': WriteLn('El impuesto A se paga en la caja 4.');
            'B': WriteLn('El impuesto A se paga en la caja 2 y 3.');
            'C': WriteLn('El impuesto A se paga en la caja 1.');
            'D': WriteLn('El impuesto A se paga en la caja 5 y 6.');
            else
                WriteLn('El codigo del impuesto no se cobra en este local.');
            end;
    end;
end.