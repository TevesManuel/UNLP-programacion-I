program app;

var

    character : char;
    charCount : integer;
    wordsCount : integer;

begin

    charCount := 0;
    wordsCount := 0;

    Write('Introducir una cadena de caracteres: ');
    read(character);
    while (character <> '#') do
        begin
            if character = ' ' then
                begin
                    if charCount = 6 then
                        begin
                            wordsCount := wordsCount + 1;
                        end;
                    charCount := 0;
                end
            else
                begin
                    charCount := charCount + 1;
                end;
            read(character);
        end;
    WriteLn('Cantidad de palabras: ', wordsCount);

end.