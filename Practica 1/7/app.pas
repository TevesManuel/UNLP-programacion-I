program app;

const

    QUANTITY_OF_PRODUCTS = 4;

var

    //TMP INPUT VARIABLES
    code_input : Integer;
    stock_input : Integer;
    //ITERATOR
    i : Integer;
    //CONTROL VARIABLES
    min1 : Integer;
    min1_code : Integer;
    min2 : Integer;
    min2_code : Integer; 
    max : Integer;
    max_code: Integer;

begin

    min1 := High(Integer);
    min2 := High(Integer);
    max := 0;
    min1_code := 0;

    for i := 1 to QUANTITY_OF_PRODUCTS do
        begin
            
            Write('Introducir el codigo del producto: ');
            ReadLn(code_input);
            Write('Introducir el stock del producto: ');
            ReadLn(stock_input);

            if stock_input < min1 then
                begin
                    min2 := min1;
                    min2_code := min1_code;
                    min1 := stock_input;
                    min1_code := code_input;
                end
            else if stock_input < min2 then
                begin
                    min2 := stock_input;
                    min2_code := code_input;
                end;
            
            if stock_input > max then
                begin
                    max := stock_input;
                    max_code := code_input;
                end;

        end;

    writeln('Los 2 productos con menor stock stock son ', min1_code, ' y ', min2_code);
    writeln('El producto con mayor stock es ', max_code, ' con un stock de ', max);

end.