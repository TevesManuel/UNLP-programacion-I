program app;

var

    num1: Real;
    num2: Real;

begin

    Write('Introduce el primer numero: ');
    Read(num1);
    Write('Introduce el segundo numero: ');
    Read(num2);

    if num1 > num2 then
        begin
    
            WriteLn('El primer numero es mayor al segundo');
            Write(num1:2:2);
            Write(' > ');
            WriteLn(num2:2:2);
    
        end
    else
        begin
        
            WriteLn('El segundo numero es mayor al primero');
            Write(num1:2:2);
            Write(' < ');
            WriteLn(num2:2:2);

        end;

end.