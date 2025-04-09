program app;

function isPalindrome( number : integer ) : boolean;
var
    turnedNumber: integer;
    copyNumber: integer;
begin
    copyNumber := number;
    turnedNumber := 0;
    while number <> 0 do
        begin
            turnedNumber := turnedNumber * 10 + number mod 10;
            number := number div 10;
        end;
    isPalindrome := copyNumber = turnedNumber;
end;

var
    numberInput : integer;
begin
    Write('Introduzca un numero: ');
    ReadLn(numberInput);
    if isPalindrome(numberInput) then
        WriteLn('Es palindromo')
    else
        WriteLn('No es palindromo');
end.