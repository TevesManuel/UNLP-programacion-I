program app;

var

    millas: Real;

begin
    
    Write('Introducir millas del viaje: ');
    Read(millas);
    Write('Tienes ', (millas * 0.01):2:2, ' millas de regalo.');

end.