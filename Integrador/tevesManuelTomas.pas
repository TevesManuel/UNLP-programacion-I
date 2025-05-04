program tevesManuelTomas;
const
    MAX_FABRICANTES = 30;
    CANTIDAD_COMPETENCIAS = 4;
type
    TFabricante = record
        nombre: string[70];
        antiguedad: integer;
    end;

    TFabricantes = array[1..MAX_FABRICANTES] of TFabricante;

    TRobot = record
        codigo: string[18];
        ID: integer;
        nombre: string[70];
        fabricante: string[70];
        fabricanteCUIT: integer;
        puntajes: array[0..CANTIDAD_COMPETENCIAS] of integer;
    end;

// <- 1_Validación de ID del robot

function sumatoriaDigitos(n: integer): integer;
var
    total: integer;
begin
    total := 0;
    while (n > 0) do
        begin
            total := total + n mod 10;
            n := n div 10;
        end;
    sumatoriaDigitos := total;
end;

function validarID(robot: TRobot): boolean;
begin
    if( sumatoriaDigitos(robot.ID) > sumatoriaDigitos(robot.fabricanteCUIT) ) then
        validarID := true
    else
        validarID := false;
end;

// 1_Validación de ID del robot ->

// <- 2_Validación del código de robot
function esMayus(character: char): boolean;
begin
    esMayus := ( character >= 'A' ) and ( character <= 'Z' );
end;

function esNum(character: char): boolean;
begin
    esNum := ( character >= '1' ) and ( character <= '9' );
end;

function validarCodigo(robot: TRobot): boolean;
var
    i: integer;
    i2: integer;
    salida: boolean;
    mayusCount: integer;
    numbersCount: integer;
    aNum: array[0..2] of char;
    lastBNum: char;
    lastChar: char;
    AB: boolean;
begin
    salida := true;
    i := 1;
    mayusCount := 0;
    numbersCount := 0;
    lastBNum := '0';
    AB := false;
    lastChar := ' ';

    while ( ( i <= 18 ) and salida ) do
        begin
            if( i <= 6 ) then
                begin
                    if ( esMayus(robot.codigo[i]) ) then
                        begin
                            mayusCount := mayusCount + 1;
                        end
                    else if ( esNum(robot.codigo[i]) ) then
                        begin
                            aNum[numbersCount] := robot.codigo[i];
                            numbersCount := numbersCount + 1;
                        end
                    else
                        salida := false; 
                end;

            if( i = 6) then
                begin
                    if( not (( mayusCount >= 2 ) and ( numbersCount >= 2 )) ) then
                        salida := false;
                end;
            
            if( (i > 6) and (i <= 11)) then
                begin
                    for i2 := 0 to (numbersCount-1) do
                        begin
                            if(aNum[i2] = robot.codigo[i]) then
                                salida := false;
                        end;
                    if robot.codigo[i] < lastBNum then
                        salida := false;
                    lastBNum := robot.codigo[i];
                end;
            
            if( i > 11 ) then
                begin
                    for i2 := 0 to (numbersCount-1) do
                    begin
                        if(aNum[i2] = robot.codigo[i]) then
                            salida := false;
                        if(robot.codigo[i] = 'B') then
                            begin
                                if lastChar = 'A' then
                                    AB := true
                                else
                                    salida := false;
                            end;
                    end;
                end;

            lastChar := robot.codigo[i];
            i := i + 1;
        end;
    
    validarCodigo := (salida and AB);
end;

// 2_Validación del código de robot ->

// <- 3_Verificación de fabricante habilitado

procedure verificarFabricanteHabilitado(fabricantes: TFabricantes; fabricante: string; minAntiguedad: integer; var out: boolean);
var
    lowerEnd: integer;
    upperEnd: integer;
    index: integer;
begin
    out := false;
    lowerEnd := 0;
    upperEnd := MAX_FABRICANTES;
    while ( ((upperEnd-lowerEnd)  > 1 ) and not out ) do
        begin
            index := lowerEnd + ((upperEnd-lowerEnd) div 2);
            if(fabricantes[index].nombre < fabricante) then
                lowerEnd := index
            else if(fabricantes[index].nombre > fabricante) then
                upperEnd := index         
            else if(fabricantes[index].antiguedad >= minAntiguedad) then
                out := true
            else
                upperEnd := lowerEnd;
        end;
end;

// 3_Verificación de fabricante habilitado ->

const
    FABRICANTES: TFabricantes = (
        (nombre: 'AI Creators'; antiguedad: 9),
        (nombre: 'AI Dynamics'; antiguedad: 12),
        (nombre: 'AI Innovators'; antiguedad: 4),
        (nombre: 'AI Pioneers'; antiguedad: 9),
        (nombre: 'AutoGenius'; antiguedad: 11),
        (nombre: 'AutoMech'; antiguedad: 14),
        (nombre: 'CyberAndroids'; antiguedad: 7),
        (nombre: 'CyberWorks'; antiguedad: 10),
        (nombre: 'EvoBots'; antiguedad: 7),
        (nombre: 'EvoMech'; antiguedad: 8),
        (nombre: 'FutureBots'; antiguedad: 10),
        (nombre: 'FutureMinds'; antiguedad: 5),
        (nombre: 'MechSolutions'; antiguedad: 12),
        (nombre: 'NanoBots Co.'; antiguedad: 6),
        (nombre: 'NanoMinds'; antiguedad: 7),
        (nombre: 'NeuraBotics'; antiguedad: 8),
        (nombre: 'NextGen Androids'; antiguedad: 6),
        (nombre: 'NextGen Robotics'; antiguedad: 3),
        (nombre: 'Quantum Robotics'; antiguedad: 5),
        (nombre: 'QuantumAndroids'; antiguedad: 4),
        (nombre: 'RoboGenius'; antiguedad: 13),
        (nombre: 'RoboInnovators'; antiguedad: 3),
        (nombre: 'RoboMasters'; antiguedad: 6),
        (nombre: 'RoboTech Inc.'; antiguedad: 15),
        (nombre: 'SmartAndroids'; antiguedad: 8),
        (nombre: 'SmartBots'; antiguedad: 5),
        (nombre: 'SynthMind'; antiguedad: 9),
        (nombre: 'SynthTech'; antiguedad: 8),
        (nombre: 'TechHumanoid'; antiguedad: 11),
        (nombre: 'TechPioneers'; antiguedad: 10)
    );

var
    robot: TRobot;
    out: boolean;
begin

    robot.codigo := 'ABC12345677AB4574C';// ABC123 45677 B4574AC
    robot.id := 123;
    robot.fabricanteCUIT := 211;
    //1_Validación de ID del robot 
    // Writeln(validarID(robot)); // TRUE
    // robot.id := 211;
    // robot.fabricanteCUIT := 123;
    // Writeln(validarID(robot)); // FALSE
    
    //2_Validación del código de robot
    // Writeln(validarCodigo(robot)); // TRUE
    // robot.codigo := 'ABC12345677BA4574C';// ABC123 45677 B4574AC
    // Writeln(validarCodigo(robot)); // FALSE
    // robot.codigo := 'ABC12345677BA4274C';// ABC123 45677 B4574AC
    // Writeln(validarCodigo(robot)); // FALSE
    // robot.codigo := 'ABC12325677B4574AC';// ABC123 25677 B4574AC
    // Writeln(validarCodigo(robot)); // FALSE
    // robot.codigo := 'ABC12354677B4574AC';// ABC123 54677 B4574AC
    // Writeln(validarCodigo(robot)); // FALSE
    // robot.codigo := 'A3412345677B4574AC';// A34123 45677 B4574AC
    // Writeln(validarCodigo(robot)); // FALSE
    // robot.codigo := 'ABCDE345677B4574AC';// ABCDE3 45677 B4574AC
    // Writeln(validarCodigo(robot)); // FALSE
    // robot.codigo := 'ABC12345677B4574AC';// ABC123 45677 B4574AC

    // 3_Verificación de fabricante habilitado
    verificarFabricanteHabilitado(fabricantes, 'SynthTech', 4, out); // TRUE
    // verificarFabricanteHabilitado(fabricantes, 'SynthTeche', 4, out); // FALSE
    // verificarFabricanteHabilitado(fabricantes, 'SynthTech', 12, out); // FALSE
    Writeln(out);
end.