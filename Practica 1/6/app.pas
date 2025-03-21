4program app;

const

    BOTTLE_NUM = 4;

var

    i: Integer;
    min1: Real;
    min2: Real;
    max1: Real;
    max2: Real;
    volumen_total : Integer;
    bottlesUper2k: Integer;

    tmp_volumen: Integer;{INPUT}

begin

    min1 := High(Integer);
    min2 := High(Integer);
    max1 := 0;
    max2 := 0;
    bottlesUper2k := 0;
    volumen_total := 0;

    for i := 1 to BOTTLE_NUM do
        begin
            Write('Ingresar volumen de la botella: ');
            ReadLn(tmp_volumen);
            if tmp_volumen < min1 then
                begin
                    min2 := min1;
                    min1 := tmp_volumen;
                end
            else if tmp_volumen < min2 then
                begin
                    min2 := tmp_volumen;
                end;
            if tmp_volumen > max1 then
                begin
                    max2 := max1;
                    max1 := tmp_volumen
                end
            else if tmp_volumen > max2 then
                begin
                    max2 := tmp_volumen
                end;
            if tmp_volumen > 2000 then
                begin
                    bottlesUper2k := bottlesUper2k + 1;
                end;
            volumen_total := volumen_total + tmp_volumen;
        end;
        Writeln('El volumen maximo es ', max1:2:2, ', el segundo maximo es ', max2:2:2);
        Writeln('El volumen minimo es ', min1:2:2, ', el segundo minimo es ', min2:2:2);
        Writeln('El volumen promedio es ', (volumen_total / BOTTLE_NUM):2:2);
        Writeln('El porcentaje de botellas que supero los 2000cm3 es ', ((bottlesUper2k / BOTTLE_NUM)*100.0):2:2, '%');

end.