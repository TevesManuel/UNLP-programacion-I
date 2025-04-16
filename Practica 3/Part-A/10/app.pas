program app;

procedure countPA(var character: char; var paCounter: integer);
var
    lastCharacter : char;
begin
    lastCharacter := ' ';
    while( (character <> '.') and (character <> ' ')) do
        begin
            if( (lastCharacter = 'p') and (character = 'a') ) then
                begin
                    paCounter := paCounter + 1;
                    //Salteo el resto de la palabra
                    while( (character <> ' ') and (character <> '.') ) do
                        begin
                            read(character);
                        end;
                end
            else
                begin
                    lastCharacter := character;
                    Read(character);
                end;
        end;
end;

procedure filterSpace(var character : char);
begin
    while(character = ' ') do
        Read(character);
end;

var
    paCounter: integer;
    character: char;
begin
    paCounter := 0;
    Read(character);
    while(character <> '.') do
        begin
            filterSpace(character);
            countPA(character, paCounter);
        end;
    WriteLn('La cantidad de palabras con PA son ', paCounter);
end.