program app;

var

    character : char;
    lastCharacter : char;
    charCount : integer;
    sFlag : boolean;
    aCounter : integer;
    targetCounter : integer;

begin

    charCount := 0;
    aCounter := 0;
    targetCounter := 0;
    sFlag := false;

    Write('Introducir una cadena de caracteres: ');
    Read(character);
    lastCharacter := character;
    if character = 's' then
        begin
            sFlag := true;
        end;

    while ((character <> '.') and (character <> '*')) do
        begin
            if character = ' ' then
                begin
                    if sFlag and (lastCharacter = 's') then
                        begin
                            if aCounter = 2 then
                                begin
                                    if charCount >= 5 then
                                        begin
                                            targetCounter := targetCounter + 1;
                                        end;
                                end;
                        end;
                    aCounter := 0;
                    charCount := 0;
                    sFlag := false;
                end;

            if (character = 's') and (lastCharacter = ' ') then
                begin
                    sFlag := true;
                end;


            if character = 'a' then
                begin
                    aCounter := aCounter + 1;
                end;

            charCount := charCount + 1;
            
            lastCharacter := character;
            read(character);
        end;
    WriteLn('Cantidad de palabras target: ', targetCounter);
end.