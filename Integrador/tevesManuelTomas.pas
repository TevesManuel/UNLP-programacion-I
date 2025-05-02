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
begin

    robot.codigo := 'ABC12345677B4574AC';// ABC123 45677 B4574AC
    robot.id := 123;
    robot.fabricanteCUIT := 211;
    Writeln(validarID(robot)); // TRUE
end.