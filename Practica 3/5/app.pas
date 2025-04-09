program app;

function isPrime( number : integer ) : boolean;
var
    i: integer;
    breakFlag: boolean;
begin
    i := 2;
    breakFlag := false;

    while (i < number) and not breakFlag do
        begin
            if (number mod i) = 0 then
                    breakFlag := true;
            i := i + 1;
        end;
    
    isPrime := not breakFlag;
end;

function isEachNumberPrime( number : integer ) : boolean;
var
    breakFlag: boolean;
begin
    breakFlag := false;

    while (number <> 0) and not breakFlag do
        begin
            WriteLn(number mod 10);
            WriteLn(isPrime(number mod 10));
            breakFlag := not isPrime(number mod 10);
            number := number div 10;
        end;
    
    isEachNumberPrime := not breakFlag;
end;

var
    numberInput : integer;
begin
    Write('Introduzca un numero: ');
    ReadLn(numberInput);
    if isEachNumberPrime(numberInput) then
        WriteLn('Es primo cada numero')
    else
        WriteLn('No es primo cada numero');
end.