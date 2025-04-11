program app;
type
    console = record
           brand : string;
           model : string;
           price : real; 
        end;
procedure ReadConsole(var console: console);
begin
    Write('Introduzca la marca de la consola: ');
    ReadLn(console.brand);
    Write('Introduzca el modelo de la consola: ');
    ReadLn(console.model);
    Write('Introduzca el precio de la consola: ');
    ReadLn(console.price);
end;

var
    iteratorConsole: console;
    minConsole: console;
    sameBrand : string;
    sameBrandTotalPrices: real;
    sameBrandModelsQuantity : integer;
begin
    minConsole.price := 9999;
    ReadConsole(iteratorConsole);
    if(iteratorConsole.price < minConsole.price) then
        minConsole := iteratorConsole;
    repeat
        sameBrand := iteratorConsole.brand;
        sameBrandModelsQuantity := 0;
        sameBrandTotalPrices := 0;

        while(sameBrand = iteratorConsole.brand) do
            begin
                sameBrandModelsQuantity := sameBrandModelsQuantity + 1;
                sameBrandTotalPrices := sameBrandTotalPrices + iteratorConsole.price;
                ReadConsole(iteratorConsole);
                if(iteratorConsole.price < minConsole.price) then
                    minConsole := iteratorConsole;
            end;

        WriteLn('Hay ', sameBrandModelsQuantity, ' modelos de la marca ', sameBrand);
        WriteLn('El precio promedio de la marca es ', (sameBrandTotalPrices/sameBrandModelsQuantity):2:2);
        WriteLn('La consola mas barata es la ', minConsole.brand, '-', minConsole.model);
    until (iteratorConsole.brand = 'ATARI');
end.