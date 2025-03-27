program app;

var

    character : char;
    cant : integer;    

begin
    
    Write('Introducir una secuencia de caracteres: ');
    read(character);
    cant := 0;
    while(character <> '.') do
        begin
            read(character);
            cant := cant + 1;
        end;
    WriteLn('Cantidad total de caracteres ', cant);
end.