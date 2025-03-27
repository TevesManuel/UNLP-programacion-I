program app;

var

    lastCharacter: char;
    character: char;
    count: integer;

begin
    
    Write('Introduzca una cadena de caracteres: ');
    read(character);
    lastCharacter := character;
    count := 0;

    while character <> '.' do
        begin
            WriteLn(character);
            if ((lastCharacter = 'a') and (character = 'e')) or ((lastCharacter = 'e') and (character = 'a')) then
                begin
                    count := count + 1;
                end;
            lastCharacter := character;
            read(character);
        end; 
    WriteLn('Cantidad de ae o ea: ', count);

end.