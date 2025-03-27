program app;

const

    MAX_LENGHT = 500;

var

    character: char;
    lenght: integer;
    wordCounter: integer;

begin

    lenght := 0;
    wordCounter := 1;//Tiene en cuenta la ultima palabra que termina con 'z' y no con ' '
    
    Write('Introducir una secuencia de caracteres: ');
    read(character);

    while (character <> 'z') and (lenght < MAX_LENGHT) do 
        begin
            WriteLn('char ', character);
            read(character);
            if character = ' ' then
                begin
                    wordCounter := wordCounter + 1;
                end;
            lenght := lenght + 1;
        end;

    WriteLn('En total hay ', wordCounter, ' palabras.');

end.