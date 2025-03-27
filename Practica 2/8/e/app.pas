program app;

const

    MAX_LENGHT = 500;

var

    character: char;
    lastCharacter: char;
    lenght: integer;
    charsCounter: integer;
    pCounter: integer;
    wordCounter: integer;
    RWordsCounter: integer;
    TWordsCounter: integer;
    RNWordsCounter: integer;
    EActWordsCounter: integer;
    RFlag : boolean;

begin

    lenght := 0;
    wordCounter := 1;//Tiene en cuenta la ultima palabra que termina con 'z' y no con ' '
    RWordsCounter := 0;
    TWordsCounter := 0;
    RNWordsCounter := 0;
    EActWordsCounter := 0;

    Write('Introducir una secuencia de caracteres: ');
    read(character);
    lastCharacter := character;
    RFLag := false;
    charsCounter := 0;
    pCounter := 0;

    while (character <> 'z') and (lenght < MAX_LENGHT) do 
        begin
            if character = 'p' then
                begin
                    pCounter := pCounter + 1;
                end;
            charsCounter := charsCounter + 1;
            // WriteLn('char ', character);
            if character = ' ' then
                begin
                    if (charsCounter >= 6) and (pCounter = 2) then
                        begin
                            EActWordsCounter := EActWordsCounter + 1;
                        end;
                    charsCounter := 0;
                    pCounter := 0;
                    wordCounter := wordCounter + 1;
                    if lastCharacter = 'T' then
                        begin
                            TWordsCounter := TWordsCounter + 1;
                        end;
                    if (lastCharacter = 'N') and RFlag then
                        begin
                            RNWordsCounter := RNWordsCounter + 1;
                        end;
                    RFlag := false;
                end;
            if (lastCharacter = ' ') and (character = 'R') then
                begin
                    RWordsCounter := RWordsCounter + 1;
                    RFlag := true;
                end;
            lastCharacter := character;
            read(character);
            lenght := lenght + 1;
        end;

    WriteLn('En total hay ', wordCounter, ' palabras.');
    WriteLn('En total hay ', RWordsCounter, ' palabras que empiezan con R.');
    WriteLn('En total hay ', TWordsCounter, ' palabras que terminan con T.');
    WriteLn('En total hay ', RNWordsCounter, ' palabras que empiezan con R y terminan con N.');
    WriteLn('En total hay ', EActWordsCounter, ' palabras que tienen al menos 6 caracteres de longuitud y que tienen excactamente 2 p.');

end.