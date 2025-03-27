program app;

var

    //INPUT VARIABLES
    input_number : Integer;
    //CONTROL VARIABLES
    max1: Integer;
    max2: Integer;
    total_units : Integer;
begin

    total_units := 0;

    repeat
        write('Introducir un numero: ');
        readln(input_number);
        if input_number <> 9999 then
            begin
                max1 := 0;
                max2 := 0;
                total_units := total_units + ( input_number mod 10 );
                repeat
                    if ( input_number mod 10 ) > max1 then
                        begin
                            max2 := max1;
                            max1 := input_number mod 10;
                        end
                    else if ( input_number mod 10 ) > max2 then
                        begin
                            max2 := input_number mod 10;
                        end;
                    input_number := input_number div 10;
                until input_number = 0;
                if max2 <> 0 then
                    begin
                        write(max1, '-', max2, ' ');
                    end
                else
                    begin
                        write(max1, ' ');
                    end;
                writeln('');
            end;
    until input_number = 9999;
    writeln('La suma de las unidades es ', total_units);    


end.