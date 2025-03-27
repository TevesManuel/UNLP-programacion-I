program app;

var

    character: char;
    lastCharacter: char;
    wordCounter: integer;
    tflag: boolean;
    tcounter: integer;
    tmax: integer;

begin
    
    Write('Introducir una frase: ');
    read(character);
    lastCharacter := character;
    tmax := 0;
    tcounter := 0;
    tflag := false;
    wordCounter := 1;//Tiene en cuenta la ultima palabra terminada con '.' sin ' '
    while character <> '.' do
        begin
            if character = ' ' then
                begin
                    wordCounter := wordCounter + 1;
                    if tflag then
                        begin
                            if tcounter > tmax then
                                begin
                                    tmax := tcounter;
                                end;
                            tcounter := 0;
                            tflag := false;
                        end;
                end
            else if tflag then
                begin
                    tcounter := tcounter + 1;
                end;
            if (lastCharacter = ' ') and (character = 't') then
                begin
                    tflag := true;
                    tcounter := tcounter + 1;
                end;
            lastCharacter := character;
            read(character);            
        end;
    WriteLn('Cantidad de palabras ', wordCounter);
    WriteLn('La longuitud de la palabra mas larga que comienza con t es ', tmax);

end.