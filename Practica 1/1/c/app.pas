program app;

var
    base: Real;
    altura: Real;

begin

    Write('Introducir la base:');
    Read(base);
    Write('Introducir la altura:');
    Read(altura);

    Write('El area es ');
    WriteLn((base * altura):2:2);

    Write('El perimetro es ');
    WriteLn((2 * base + 2 * altura):2:2);

end.