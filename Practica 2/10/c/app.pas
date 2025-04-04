program app;

var

    character : char;
    lastCharacter : char;
    charCount : integer;
    wordsCount : integer;
    paFlag : boolean;
    paCount : integer;
    saFlag : boolean;
    saCount : integer;
    
begin

    charCount := 0;
    wordsCount := 0;
    paCount := 0;
    paflag := false;
    saCount := 0;
    saflag := false;

    Write('Introducir una cadena de caracteres: ');
    read(character);
    lastCharacter := ' ';
    
    while (character <> '#') do
        begin
            if character = ' ' then
                begin
                    if charCount = 6 then
                        begin
                            wordsCount := wordsCount + 1;
                        end;
                    if saFlag then
                        begin
                            saCount := saCount + 1;
                        end;
                    charCount := 0;
                end
            else
                begin
                    charCount := charCount + 1;
                end;
            saFlag := false;
            if (lastCharacter = 'S') and (character = 'A') then
                begin
                    saFlag := true;
                end;
            if paFlag and (character = 'A') then
                begin
                    paCount := paCount + 1;
                end;
            paFlag := false;
            if (lastCharacter = ' ') and (character = 'P') then
                begin
                    paflag := true;
                end;
            lastCharacter := character;
            read(character);
        end;
    WriteLn('Cantidad de palabras: ', wordsCount);
    WriteLn('Cantidad de palabras que empiezan con PA: ', paCount);
    WriteLn('Cantidad de palabras que terminan con SA: ', saCount);

end.