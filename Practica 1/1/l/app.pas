program app;

var

    year_birthday: Integer;

begin

    Write('Introducir ano de nacimiento: ');
    Read(year_birthday);

    case year_birthday of
        1946..1964:
            begin
                WriteLn('Perteneces a la generacion Baby boomers.');
            end;
        1965..1980:
            begin
                WriteLn('Perteneces a la generacion X.');
            end;
        1981..1996:
            begin
                WriteLn('Perteneces a la generacion Millenials.');
            end;
        else
            begin
                if year_birthday > 1997 then
                    begin
                        WriteLn('Perteneces a la generacion Z.');
                    end
                else if year_birthday < 1946 then
                    begin
                        WriteLn('Eres anterior a la generacion Baby boomers.');
                    end;
            end;
    end;

end.