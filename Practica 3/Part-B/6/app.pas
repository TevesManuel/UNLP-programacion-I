program app;

var
    A: string;
    character: char;
    i: integer;
    out: boolean;
begin
    out := true;
    A := '';
    Read(character);
    while(character <> '@') do
        begin
            if( (character >= 'A') and (character <= 'Z') ) then
                A := A + character
            else
                begin
                    out := false;
                    WriteLn('[!] El caracter "', character, '" no es una mayuscula');
                end;
            Read(character);
        end;
    while(character <> '.') do
        begin
            for i := 0 to length(A) do
                begin
                    if ( character  = A[i] ) then
                        begin
                            out := false;
                            Writeln('[!] El caracter ', character, ' esta repetido');
                        end;
                end;
            Read(character);
        end;
    if out then
        Writeln('La entrada cumple los requisistos')
    else
        Writeln('La entrada NO cumple los requisistos');
end.