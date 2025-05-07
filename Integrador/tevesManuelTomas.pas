program tevesManuelTomas;

const
    MAX_FABRICANTES = 30;
    CANTIDAD_COMPETENCIAS = 10;
    NOMBRE_CORTE_INSCRIPCION = 'DEEPLEARN';
    MIN_ANTIGUEDAD_FABRICANTE = 3;
    PUNTO_4_a_O_b = false;

type
    TFabricante = record
        nombre: string[70];
        antiguedad: integer;
    end;

    TFabricantes = array[1..MAX_FABRICANTES] of TFabricante;

    TPuntaje = record
        ID: integer;
        puntaje: integer;
    end;

    TListaPuntaje = ^ TNodoPuntaje;
    TNodoPuntaje = record
        dato: TPuntaje;
        sig: TListaPuntaje;
    end;

    TListasClasificadas = array[0..CANTIDAD_COMPETENCIAS]{11 elementos} of TListaPuntaje; // 11 listas de puntaje

    TRobot = record
        codigo: string[18];
        ID: integer;
        nombre: string[70];
        fabricante: string[70];
        fabricanteCUIT: integer;
        puntaje_array: array[0..CANTIDAD_COMPETENCIAS] of TPuntaje;
        puntaje_lista: TListaPuntaje;
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

procedure verificarFabricanteHabilitado(fabricantes: TFabricantes; fabricante: string; minAntiguedad: integer; var salida: boolean);
var
    limiteInferior: integer;
    limiteSuperior: integer;
    index: integer;
begin
    salida := false;
    limiteInferior := 0;
    limiteSuperior := MAX_FABRICANTES;
    while ( ((limiteSuperior-limiteInferior)  > 1 ) and not salida ) do
        begin
            index := limiteInferior + ((limiteSuperior-limiteInferior) div 2);
            if(fabricantes[index].nombre < fabricante) then
                limiteInferior := index
            else if(fabricantes[index].nombre > fabricante) then
                limiteSuperior := index         
            else if(fabricantes[index].antiguedad >= minAntiguedad) then
                salida := true
            else
                limiteSuperior := limiteInferior;
        end;
end;

// 3_Verificación de fabricante habilitado ->

// <- 4_Simulacion de inscripcion

procedure agregarPuntaje(var lista: TListaPuntaje; datoNuevo: TPuntaje);
var

    actual: TListaPuntaje;
    nuevaLista: TListaPuntaje;

begin
    new(nuevaLista);
    nuevaLista^.dato := datoNuevo;
    nuevaLista^.sig := Nil;

    if ( lista <> Nil ) then
        begin
            
            actual := lista;
            
            while ( actual^.sig <> Nil ) do
                actual := actual^.sig;
            
            actual^.sig := nuevaLista;

        end
    else
        lista := nuevaLista;

end;

procedure inscribirRobot(fabricantes: TFabricantes);
var
    robot: TRobot;
    IDvalido: boolean;
    codigoValido: boolean;
    fabricanteHabilitado: boolean;
    i: integer;
    corte: boolean;
    entrada: TPuntaje;
begin
    robot.nombre := '';
    while robot.nombre <> NOMBRE_CORTE_INSCRIPCION do
        begin
            robot.codigo := '';
            robot.id := 0;
            robot.fabricanteCUIT := 0;
            IDvalido := false;
            codigoValido := false;
            Writeln('Introducir el codigo de el robot: ');
            Readln(robot.codigo);
            Writeln('Introducir el ID el robot: ');
            Readln(robot.id);
            Writeln('Introducir el CUIT del fabricante el robot: ');
            Readln(robot.fabricanteCUIT);
            Writeln('Introducir el nombre de el fabricante: ');
            Readln(robot.fabricante);
            
            IDvalido := validarID(robot);
            if not IDvalido then
                begin
                    Writeln('[!] El ID no es valido.');
                end;
            
            codigoValido := validarCodigo(robot);
            if not codigoValido then
                begin
                    Writeln('[!] El codigo no es valido.');
                end;
            
            verificarFabricanteHabilitado(fabricantes, robot.fabricante, MIN_ANTIGUEDAD_FABRICANTE, fabricanteHabilitado);
            if not fabricanteHabilitado then
                begin
                    Writeln('[!] El fabricante no esta habilitado.');
                end;

            if (IDvalido and codigoValido and fabricanteHabilitado) then
                begin

                    if not PUNTO_4_a_O_b then
                        begin
                            //3.a)
                            for i := 0 to CANTIDAD_COMPETENCIAS do
                                begin
                                    Write('Ingrese el puntaje de la competencia ', i, '/', CANTIDAD_COMPETENCIAS, ': ');
                                    Readln(robot.puntaje_array[i].puntaje);
                                end;
                        end
                    else
                        begin
                            //3.b)
                            i := 0;
                            corte := false;
                            repeat
                                Write('Ingrese el puntaje de la competencia ', i, ': ');
                                Readln(entrada.puntaje);
                                if entrada.puntaje >= 0 then // corta con cualquier numero negativo por ej -1
                                    agregarPuntaje(robot.puntaje_lista, entrada)
                                else
                                    corte := true;
                                i := i + 1;
                            until corte;
                        end;
                end;
        end;
end;

// 4_Simulacion de inscripcion ->

// <- 5_Clasificación por puntaje
procedure agregarPuntajeOrdenado(var lista: TListaPuntaje; datoNuevo: TPuntaje);
var
    nuevo, actual, anterior: TListaPuntaje;
begin
    new(nuevo);
    nuevo^.dato := datoNuevo;
    nuevo^.sig := Nil;

    anterior := Nil;
    actual := lista;

    while (( actual <> Nil ) and ( actual^.dato.id < datoNuevo.id )) do
        begin
            anterior := actual;
            actual := actual^.sig;
        end;

    if anterior = Nil then
        begin
            nuevo^.sig := lista;
            lista := nuevo;
        end
    else
        begin
            nuevo^.sig := anterior^.sig;
            anterior^.sig := nuevo;
        end;
end;

procedure registrarRobot(var listas: TListasClasificadas; robot: TRobot);
var
    actual: TListaPuntaje;
begin
    actual := robot.puntaje_lista;
    while actual <> Nil do
        begin
            actual^.dato.ID := robot.ID;
            agregarPuntajeOrdenado(listas[actual^.dato.puntaje], actual^.dato);
            actual := actual^.sig;
        end;
end;

// 5_Clasificación por puntaje ->

procedure probar1;
var
    robot: TRobot;
begin
    robot.id := 123;
    robot.fabricanteCUIT := 211;
    
    if validarID(robot) = TRUE then
        Writeln('[i] Prueba 1.1 pasada.')
    else
        Writeln('[!] Prueba 1.1 fallada.');

    robot.id := 211;
    robot.fabricanteCUIT := 123;
    if validarID(robot) = FALSE then
        Writeln('[i] Prueba 1.2 pasada.')
    else
        Writeln('[!] Prueba 1.2 fallada.');
end;

procedure probar2;
var
    robot: TRobot;
begin
    robot.codigo := 'ABC12345677AB4574C';// ABC123 45677 B4574AC
    
    if validarCodigo(robot) = TRUE then
        Writeln('[i] Prueba 2.1 pasada.')
    else
        Writeln('[i] Prueba 2.1 fallada.');
        
    robot.codigo := 'ABC12345677BA4574C';    
    if validarCodigo(robot) = FALSE then
        Writeln('[i] Prueba 2.2 pasada.')
    else
        Writeln('[i] Prueba 2.2 fallada.');
        
    robot.codigo := 'ABC12345677BA4274C';
    if validarCodigo(robot) = FALSE then
        Writeln('[i] Prueba 2.3 pasada.')
    else
        Writeln('[i] Prueba 2.3 fallada.');

    robot.codigo := 'ABC12325677B4574AC';
    if validarCodigo(robot) = FALSE then
        Writeln('[i] Prueba 2.3 pasada.')
    else
        Writeln('[i] Prueba 2.3 fallada.');

    robot.codigo := 'ABC12354677B4574AC';
    if validarCodigo(robot) = FALSE then
        Writeln('[i] Prueba 2.3 pasada.')
    else
        Writeln('[i] Prueba 2.3 fallada.');

    robot.codigo := 'A3412345677B4574AC';
    if validarCodigo(robot) = FALSE then
        Writeln('[i] Prueba 2.4 pasada.')
    else
        Writeln('[i] Prueba 2.4 fallada.');

    robot.codigo := 'ABCDE345677B4574AC';
    if validarCodigo(robot) = FALSE then
        Writeln('[i] Prueba 2.5 pasada.')
    else
        Writeln('[i] Prueba 2.5 fallada.');
end;

procedure probar3;
var
    salida: boolean;
begin
    salida := false;

    verificarFabricanteHabilitado(fabricantes, 'SynthTech', 4, salida); // TRUE
    if salida = TRUE then
        Writeln('[i] Prueba 3.1 pasada.')
    else
        Writeln('[!] Prueba 3.1 fallada.');

    verificarFabricanteHabilitado(fabricantes, 'SynthTeche', 4, salida); // FALSE
    if salida = FALSE then
        Writeln('[i] Prueba 3.2 pasada.')
    else
        Writeln('[!] Prueba 3.2 fallada.');

    verificarFabricanteHabilitado(fabricantes, 'SynthTech', 12, salida); // FALSE
    if salida = FALSE then
        Writeln('[i] Prueba 3.3 pasada.')
    else
        Writeln('[!] Prueba 3.3 fallada.');
end;

procedure imprimirListaPuntaje(lista: TListaPuntaje);
var
    actual: TListaPuntaje;
begin
    actual := lista;
    while actual <> Nil do
        begin
            Writeln('[', actual^.dato.ID, ']: ', actual^.dato.puntaje);
            actual := actual^.sig;
        end;    
end;

procedure imprimirListaClasificada(arrayListas: TListasClasificadas);
var
    i: integer;
begin
    for i := 0 to CANTIDAD_COMPETENCIAS do
        begin
            Writeln('Competencia nro ', i);
            imprimirListaPuntaje(arrayListas[i]);
        end;
end;

procedure procedureParaProbar5(var lista: TListaPuntaje; ID: integer; puntaje: integer);
var
    nuevoPuntaje: TPuntaje;
begin
    nuevoPuntaje.ID := ID;
    nuevoPuntaje.puntaje := puntaje;
    agregarPuntajeOrdenado(lista, nuevoPuntaje);
end;

procedure probar5;
var
    lista: TListaPuntaje;
    listasClasificada: TListasClasificadas;
    i: integer;
    robot1: TRobot;
    robot2: TRobot;
begin
    lista := Nil;
    procedureParaProbar5(lista, 4, 2);
    procedureParaProbar5(lista, 8, 6);
    procedureParaProbar5(lista, 5, 3);
    procedureParaProbar5(lista, 7, 9);
    imprimirListaPuntaje(lista);
    for i := 0 to CANTIDAD_COMPETENCIAS do
        begin
            listasClasificada[i] := Nil;
        end;
    robot1.ID := 204;
    robot1.puntaje_lista := nil;
    procedureParaProbar5(robot1.puntaje_lista, robot1.ID, 6);
    procedureParaProbar5(robot1.puntaje_lista, robot1.ID, 4);
    procedureParaProbar5(robot1.puntaje_lista, robot1.ID, 3);
    robot2.ID := 101;
    robot2.puntaje_lista := nil;
    procedureParaProbar5(robot2.puntaje_lista, robot2.ID, 3);
    procedureParaProbar5(robot2.puntaje_lista, robot2.ID, 4);
    procedureParaProbar5(robot2.puntaje_lista, robot2.ID, 7);
    registrarRobot(listasClasificada, robot1);
    registrarRobot(listasClasificada, robot2);
    imprimirListaClasificada(listasClasificada);
end;

begin
    probar1();
    probar2();
    probar3();
    probar5();
end.