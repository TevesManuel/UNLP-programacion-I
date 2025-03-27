program app;

var

    character : char;
    cant : integer;
    E_cant : integer;

begin
    
    Write('Introducir una secuencia de caracteres: ');
    read(character);
    cant := 0;
    E_cant := 0;
    while(character <> '.') do
        begin
            if character = 'E' then
                begin
                    E_cant := E_cant + 1;
                end;
            cant := cant + 1;
            read(character);
        end;
    WriteLn('Cantidad total de caracteres ', cant);
    WriteLn('Cantidad total de caracteres E ', E_cant);
end.