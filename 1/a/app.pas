{Seccion  de definicion de programa (debe ser igual al nombre del archivo principal)}
program app;

{Seccion  de definicion de variables}
var
    num1, num2, promedio: Real;

{Seccion de inicio del codigo de la funcion principal}
begin

    {Imprime por pantalla}
    Write('Ingresa el primer numero: ');
    {Obtiene un numero por teclado ya que num1 es una variable de tipo Real}
    ReadLn(num1);
    Write('Ingresa el segundo numero: ');
    ReadLn(num2);

    promedio := (num1 + num2) / 2;

    WriteLn('El promedio es: ', promedio:0:2);

{Instruccion de finalizacion en el bloque de codigo de la funcion principal}
end.