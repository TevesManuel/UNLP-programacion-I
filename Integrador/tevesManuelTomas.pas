program tevesManuelTomas;
const
    MAX_FABRICANTES = 30;

type
    TFabricante = record
        nombre: string[70];
        antiguedad: integer;
    end;

    TFabricantes = array[1..MAX_FABRICANTES] of TFabricante;

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

begin
    Writeln('Test');
end.