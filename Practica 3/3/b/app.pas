program app;
function max( n1: integer; n2: integer ) : integer;
begin
    if n1 > n2 then
        max := n1
    else
        max := n2;
end;

function max4(n1: integer; n2: integer; n3: integer; n4: integer): integer;
var
    i: integer;
begin
    i := max(n1, n2);
    i := max(i, n3);
    max4 := max(i, n4);
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