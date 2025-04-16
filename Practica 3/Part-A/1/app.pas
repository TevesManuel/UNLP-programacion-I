//Declaracion de inicio de programa
program app;

// twoLowerDigits ---------------------------------->

//Declaracion de un proceso ( un tipo de funcion que no retorna ningun valor )
procedure twoLowerDigits( number: Integer );
//Declaracion de las variables locales del proceso ( que seran eliminadas automaticamente al terminar el mismo )
var
    lowerDigit1 : Integer;
    lowerDigit2 : Integer;
begin
    //Asignamos 9 como digito maximo posible
    lowerDigit1 := 9;
    lowerDigit2 := 9;

    //Mientras number != 0
    while number <> 0 do
        begin
            //Si el ultimo digito de number es menor a el digito menor guardado
            if ( number mod 10 ) < lowerDigit1 then
                begin
                    lowerDigit2 := lowerDigit1;
                    lowerDigit1 := number mod 10;
                end
            //Si el ultimo digito de number es menor a el segundo digito menor guardado
            else if ( number mod 10 ) < lowerDigit2 then
                begin
                    lowerDigit2 := number mod 10;
                end;
            number := number div 10;
        end;
    
    WriteLn('Los 2 digitos mas chicos son ', lowerDigit1, ' y ', lowerDigit2);

end;

//<------------------------------------ twoLowerDigits

//Declaro las variables del programa principal
var

    numberInput: Integer;

begin

    Write('Introduzca un numero: ');
    ReadLn(numberInput);

    //Llamamos al proceso y pasamos la variable numberInput
    twoLowerDigits(numberInput);

end.