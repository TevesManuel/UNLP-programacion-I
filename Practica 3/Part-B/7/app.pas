program app;

procedure filterWhiteSpaces(var character: char);
begin
    while(character = ' ') do Read(character);
end;

procedure VProcess(var character: char; var isValid: boolean);
var
    lastCharacter: char;
begin
    while( character <> '&' ) do
        begin
            filterWhiteSpaces(character);
            if character = 'o' then
                begin
                    while( ( character <> ' ' ) and ( character <> '&' ) ) do
                        begin
                            lastCharacter := character;
                            Read(character);
                        end;
                    if lastCharacter <> 'n' then
                        begin
                            isValid := false;
                            Writeln('[!] Hay una palabra en V que no termina con "n".');
                        end;
                end
            else
                begin
                    while( ( character <> ' ' ) and ( character <> '&' ) ) do Read(character);
                    isValid := false;
                    Writeln('[!] Hay una palabra en V que no empieza con "o".');
                end;
        end;
end;

procedure QProcess(var character: char; var isValid: boolean);
var
    a: boolean;
    e: boolean;
    i: boolean;
    o: boolean;
    u: boolean;
begin
    Read(character); // Erase '&'
    while( character <> '%' ) do
        begin
            a := false;
            e := false;
            i := false;
            o := false;
            u := false;
            filterWhiteSpaces(character);
            while ( ( character <> '%' ) and ( character <> ' ' ) ) do
                begin
                    if character = 'a' then
                        a := true;
                    if character = 'e' then
                        e := true;
                    if character = 'i' then
                        i := true;
                    if character = 'o' then
                        o := true;
                    if character = 'u' then
                        u := true;
                    Read(character);
                end;
            if not ( a and e and i and o and u ) then
                begin
                    isValid := false;
                    Writeln('[!] Hay una palabra en Q que no posee todas las vocales.');
                end;
        end;
end;

procedure WProcess(var character: char; var isValid: boolean);
var
    long: integer;
    sCount: integer;
begin
    Read(character); // Erase %
    while( character <> '*' ) do
        begin
            sCount := 0;
            long := 0;
            filterWhiteSpaces(character);
            while ( ( character <> ' ' ) and ( character <> '*' ) ) do
                begin
                    if( character = 's' ) then
                        sCount := sCount + 1;
                    long := long + 1;
                    Read(character);
                end;
            if ( ( long > 5 ) and ( sCount <> 3 ) ) then
                Writeln('[!] Hay una palabra en W de 5 o mas caracteres de longuitud que no posee exactamente 3 s.');
        end;
end;

var
    character: char;
    isValid: boolean;
begin
    character := ' ';
    isValid := true;
    VProcess(character, isValid);
    QProcess(character, isValid);
    WProcess(character, isValid);
    if ( isValid ) then
        Writeln('[i] La secuencia de caracteres cumple con el patron V&Q%W')
    else
        Writeln('[i] La secuencia de caracteres NO cumple con el patron V&Q%W');
end.