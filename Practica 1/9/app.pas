program app;

var

    i : Integer;

    //INPUT VARIABLES
    input_months : Integer;
    input_weights : Real;

    //CONTROL VARIABLES
    control_variable : Real;
    total_weight : Real;

begin

    total_weight := 0;

    repeat

        Write('Introduce la cantidad de meses de gestacion: ');
        ReadLn(input_months);
        if input_months <= 5 then
            begin
                control_variable := High(Integer);
            end
        else
            begin
                control_variable := 0;
            end;

        for i := 1 to input_months do
            begin

                Write('Introduce el peso de el mes ', i, ': ');
                ReadLn(input_weights);

                if input_months <= 5 then
                    begin
                        if input_weights < control_variable then
                            begin
                                control_variable := input_weights;
                            end
                    end
                else
                    begin
                        if input_weights > control_variable then
                            begin
                                control_variable := input_weights;
                            end;                        
                    end;

                total_weight := total_weight + input_weights;
            end;

            if input_months <= 5 then
                begin
                    WriteLn('El menor peso fue ', control_variable:2:2);
                end
            else
                begin
                    WriteLn('El mayor peso fue ', control_variable:2:2);
                end;
            
            WriteLn('El peso promedio es ', ( total_weight / input_months ):2:2);

    until input_months < 0;

end.