program app;

var
  matriz: array[1..50, 1..50] of Integer;
  i, j: Integer;
begin
    for i := 1 to 50 do
        for j := 1 to 50 do
            matriz[i][j] := 0;

    for i := 1 to 50 do
        begin
            for j := 1 to 50 do
                begin
                    if( (i mod 2) = 0 ) then
                        Writeln('FILA PAR [', i, '][', j, ']: ', matriz[i][j]);
                    if( (j mod 2) = 1 ) then
                        Writeln('COLUMNA IMPAR [', i, '][', j, ']: ', matriz[i][j]);
                    if( i = j ) then
                        Writeln('DIAGONAL PRINCIPAL [', i, '][', j, ']: ', matriz[i][j]);
                end;
        end;
end.
