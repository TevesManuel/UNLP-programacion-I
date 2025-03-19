program pas;

var

    num: Integer;
    i: Integer;

begin

    Write('Introducir un numero: ');
    Read(num);

    for i := 0 to 10 do
        begin
            WriteLn(num, 'x', i, '=', num*i);
        end;

end.