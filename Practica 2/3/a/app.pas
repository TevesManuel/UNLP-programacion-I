program app;

var

    //INPUT VARIABLES
    number : integer;

    //CONTROL VARIABLES
    summation : integer;

    //ITERATOR VARIABLES
    i : integer;

begin
    
    for i := 0 to 15 do
        begin
            Write('Introducir un numero: ');
            ReadLn(number);
            repeat
                Write(' -> ', number);
                summation := 0;
                repeat 
                    summation := summation + number mod 10;
                    number := number div 10;
                until number = 0;
                number := summation;
            until number div 10 = 0;
            WriteLn(' -> ', number);
        end;

end.