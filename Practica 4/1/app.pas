program app;

Type
    FishTank = record
        long: integer;
        width: integer;
        height: integer;
    end;

procedure getFishTank(var fishTank: FishTank);
begin
    WriteLn('##########################################');
    WriteLn('##            FISH TANK INPUT           ##');
    WriteLn('##########################################');
    Write('Introducir el largo: ');
    Read(fishTank.long);
    Write('Introducir el ancho: ');
    Read(fishTank.width);
    Write('Introducir el alto: ');
    Read(fishTank.height);
end;

function fishTankCalculateVolume(fishTank: FishTank): integer;
begin
    fishTankCalculateVolume := fishTank.long * fishTank.width * fishTank.height;
end;

function fishTankCalculateMaterial(fishTank: FishTank): integer;
begin
    fishTankCalculateMaterial := fishTank.width * fishTank.long + fishTank.height * ( fishTank.long * 2 + fishTank.width * 2);
end;

procedure fishTankPrintFeatures(fishTank: FishTank);
begin
    Writeln('Volume: ', fishTankCalculateVolume(fishTank), 'cm^3');
    Writeln('Material: ', fishTankCalculateMaterial(fishTank), 'cm^2');
end;

var
    fishTankObj: FishTank;
begin
    getFishTank(fishTankObj);
    fishTankPrintFeatures(fishTankObj);
end.