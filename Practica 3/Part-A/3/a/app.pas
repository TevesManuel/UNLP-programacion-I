program app;
function max4(n1: integer; n2: integer; n3: integer; n4: integer): integer;
var
    max: integer;
begin
    max := n1;
    if n2 > max then
        max := n2;
    if n3 > max then
        max := n3;
    if n4 > max then
        max := n4;
    max4 := max;
end;

var

    num1 : Integer;
    num2 : Integer;
    num3 : Integer;
    num4 : Integer;

begin
    
    Write('Introduzca el primer numero: ');
    ReadLn(num1);
    Write('Introduzca el segundo numero: ');
    ReadLn(num2);
    Write('Introduzca el tercer numero: ');
    ReadLn(num3);
    Write('Introduzca el cuarto numero: ');
    ReadLn(num4);

    WriteLn('El numero maximo es ', max4(num1, num2, num3, num4));

end.