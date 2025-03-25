program app;

var

    //TMP INPUT VARIABLES
    input_game_code  : Integer;
    input_game_cant  : Integer;
    input_game_price : Real;

    //CONTROL VARIABLES
    most_sales       : Integer;
    most_sales_code  : Integer;
    most_raised      : Real;
    most_raised_code : Integer;

begin
    most_sales := 0;
    most_raised := 0;
    repeat
        Write('Ingresar el codigo de el juego: ');
        ReadLn(input_game_code);
        if input_game_code <> 0 then
            begin
                Write('Ingresar la cantidad de copias vendidas: ');
                ReadLn(input_game_cant);
                Write('Ingresar el precio de cada copia: ');
                ReadLn(input_game_price);
                if ( input_game_cant * input_game_price ) > most_raised then
                    begin
                        most_raised := input_game_cant * input_game_price;
                        most_raised_code := input_game_code;
                    end;
                if input_game_cant > most_sales then
                    begin
                        most_sales := input_game_cant;
                        most_sales_code := input_game_code;
                    end;
            end;
    until input_game_code = 0;
    WriteLn('El producto que mas veces se vendio es ', most_sales_code, ' con un total de ', most_sales, ' ventas.');
    WriteLn('El producto que mas reacudo es ', most_raised_code, ' con un total de ', most_raised:2:2, '$.');
end.