program app;

const

    MAX_LENGHT = 500;

var

    character: char;
    lastCharacter: char;
    lenght: integer;
    wordCounter: integer;
    RWordsCounter: integer;
begin

    lenght := 0;
    wordCounter := 1;//Tiene en cuenta la ultima palabra que termina con '.' y no con ' '
    RWordsCounter := 0;

    Write('Introducir una secuencia de caracteres: ');
    read(character);
    lastCharacter := character;

    while (character <> 'z') and (lenght < MAX_LENGHT) do 
        begin
            // WriteLn('char ', character);
            if character = ' ' then
                begin
                    wordCounter := wordCounter + 1;
                end;
            if (lastCharacter = ' ') and (character = 'R') then
                begin
                    RWordsCounter := RWordsCounter + 1;
                end;
            lastCharacter := character;
            read(character);
            lenght := lenght + 1;
        end;

    WriteLn('En total hay ', wordCounter, ' palabras.');
    WriteLn('En total hay ', RWordsCounter, ' palabras que empiezan con R.');

end.