program app;

var

    age: Integer;
    gender: Integer;
    years_to_retire: Integer;

begin
    
    Write('Introducir tu edad: ');
    Read(age);
    Write('Introducir 0 en caso de ser mujer o 1 en caso de ser hombre: ');
    Read(gender);
    if gender = 1 then
        begin
            years_to_retire := 55 - age
        end
    else if gender = 0 then
        begin
            years_to_retire := 50 - age
        end;
    if years_to_retire <= 0 then
        begin
            WriteLn('Ya puedes retirarte.');
        end
    else
        begin
            WriteLn('Te quedan ', years_to_retire, ' anos para retirarte.');
        end;

end.