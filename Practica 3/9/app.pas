program app;

function Sumar(a, b: real): real;
begin
    Sumar := a + b;
end;

function Restar(a, b: real): real;
begin
    Restar := a - b;
end;

function Multiplicar(a, b: real): real;
begin
    Multiplicar := a * b;
end;

function Dividir(a, b: real): real;
begin
    Dividir := a / b;
end;

var
    opcion: char;
    num1, num2, resultado: real;
begin
    Writeln('Calculadora: Operaciones Basicas');
    Write('Ingrese el primer numero: ');
    Readln(num1);
    Write('Ingrese el segundo numero: ');
    Readln(num2);
    Writeln('Seleccione la operacion: ');
    Writeln('a) Suma');
    Writeln('b) Resta');
    Writeln('c) Multiplicacion');
    Writeln('d) Division');
    Readln(opcion);
    case opcion of
        'a': resultado := Sumar(num1, num2);
        'b': resultado := Restar(num1, num2);
        'c': resultado := Multiplicar(num1, num2);
        'd': resultado := Dividir(num1, num2);
    else
        resultado := -1;
    end;
    Writeln('El resultado es: ', resultado:2:2);
end.