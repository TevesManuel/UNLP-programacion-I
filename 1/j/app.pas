program app;

var

    age: Integer;

begin
    
    Write('Introducir la edad del estudiante: ');
    Read(age);
    
    case age of
        7..12:
            begin
                Write('El estudiante pertence al primaria');
            end;
        13..18:
            begin
                Write('El estudiante pertence a la secundaria');
            end;
        else
            begin
                if age > 18 then
                    begin
                        Write('El estudiante pertenece a la universidad');
                    end
                else if age < 7 then
                    begin
                        Write('El estudiante pertenece al prescolar');
                    end;
            end;
    end;

end.