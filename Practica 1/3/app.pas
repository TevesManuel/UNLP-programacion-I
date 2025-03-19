program app;

var

    inflation : Real;
    max_inflation : Real;
    month : Integer;
    i : Integer;

begin

    max_inflation := 0;

    for i := 1 to 12 do
        begin
            Write('Introducir la inflacion del mes ', i, ' : ');
            Read(inflation);
            if inflation > max_inflation then
                begin
                    max_inflation := inflation;
                    month := i;
                end;
        end;
    
    WriteLn('La maxima inflacion es ', max_inflation:2:2, ' en el mes ', month);

end.