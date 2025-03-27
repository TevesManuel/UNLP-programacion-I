program app;

var

    character : char;
    cant : integer;
    E_cant : integer;
    fe_cant : integer;
    f_flag : boolean;

begin
    
    Write('Introducir una secuencia de caracteres: ');
    read(character);
    cant := 0;
    E_cant := 0;
    fe_cant := 0;
    f_flag := false;

    while(character <> '.') do
        begin
            if character = 'E' then
                begin
                    E_cant := E_cant + 1;
                end;

            if (character = 'e') and f_flag then
                begin
                    fe_cant := fe_cant + 1;
                end;

            if character = 'f' then
                begin
                    f_flag := true;
                end
            else
                begin
                    f_flag := false;
                end;
            
            cant := cant + 1;
            read(character);
        end;
    WriteLn('Cantidad total de caracteres ', cant);
    WriteLn('Cantidad total de caracteres E ', E_cant);
    WriteLn('Cantidad total de caracteres fe ', fe_cant);
end.