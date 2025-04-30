type
    RadarInstance = record
        code: string;
        maxVelocity: integer;
        numberRegisteredVehicles: integer;
    end;

    VehicleInstance = record
        patent: string;
        velocity: integer;
    end;


function isRadarValid(radar: RadarInstance): boolean;
begin
    isRadarValid := not (radar.code = '-1');
end;

procedure readRadar(var radar: RadarInstance);
begin
    Writeln('################################################');
    Writeln('### Radar input                              ###');
    Writeln('################################################');
    Write('Codigo del radar: ');
    Readln(radar.code);
    if(isRadarValid(radar)) then
        begin
            Write('Maxima velocidad permitida: ');
            Readln(radar.maxVelocity);
            Write('Cantidad de vehiculos registrados: ');
            Readln(radar.numberRegisteredVehicles);
        end;
end;

procedure readVehicle(var vehicle: VehicleInstance);
begin
    Writeln('------------------------------------------------');
    Writeln('--- Radar input                              ---');
    Writeln('------------------------------------------------');
    Write('Patente: ');
    Readln(vehicle.patent);
    Write('Velocidad: ');
    Readln(vehicle.velocity);
end;

var
    radar: RadarInstance;
    vehicle: VehicleInstance;
    totalVelocity: integer;
    maxVelocity: integer;
    patentMaxVelocity: string;
    minVelocity: integer;
    i: integer;
    patentMinVelocity: string;
begin
    maxVelocity := 0;
    minVelocity := High(integer);
    repeat
        readRadar(radar);
        totalVelocity := 0;
        if(isRadarValid(radar)) then
            begin
                for i := 1 to radar.numberRegisteredVehicles do
                    begin
                        readVehicle(vehicle);
                        totalVelocity := totalVelocity + vehicle.velocity;
                        if(vehicle.velocity > maxVelocity) then
                            begin
                                maxVelocity := vehicle.velocity;
                                patentMaxVelocity := vehicle.patent;
                            end;
                        if(vehicle.velocity < minVelocity) then
                            begin
                                minVelocity := vehicle.velocity;
                                patentMinVelocity := vehicle.patent;
                            end;
                    end;
                Writeln('La velocidad promedio de los automiviles en el radar de codigo ', radar.code, ' es ', (totalVelocity / radar.numberRegisteredVehicles):2:2);
                Writeln('Fueron multados ', radar.numberRegisteredVehicles, ' vehiculos.');
            end;
    until not isRadarValid(radar);
    Writeln('La patente del vehiculo con mayor velocidad es ', patentMaxVelocity);
    Writeln('La patente del vehiculo con menor velocidad es ', patentMinVelocity);
end.