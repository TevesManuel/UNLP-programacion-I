program app;

var

    diameter: Real;
    radio : Real;

begin
    
    Write('Introducir el diametro: ');
    Read(diameter);
    
    radio := diameter / 2.0;
    WriteLn('El radio es ', radio:2:2);

    Write('El area es ');
    WriteLn((3.141592*radio*radio):2:2);

    Write('El perimetro es ');
    WriteLn((3.141592*radio*2):2:2);

end.