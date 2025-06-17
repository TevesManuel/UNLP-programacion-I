const
    PARTIDOS = 135;
    INF = 999999;
type
    subRangoDias = 1..31;
    subRangoMeses = 1..12;
    subRangoCodigosZonas = 1..5;
    subRangoPartidos = 1..PARTIDOS;

    TFecha = record
        dia: subRangoDias;
        mes: subRangoMeses;
        ano: integer;
    end;
    TDia = record
        fecha: TFecha;
        codigoPartido: integer;
        codigoZona: subRangoCodigosZonas;
        cantidadVacunados: integer;
    end;

    TLista = ^TNodo;
    TNodo = record
        dato: TDia;
        sig: TLista;
    end;

    TVectorNombresPartidos = array[subRangoPartidos] of string;
    TVectorVacunadosPartidos = array[subRangoPartidos] of integer;
    TVectorListasZonas = array[subRangoCodigosZonas] of TLista;

procedure eliminar(var l: TLista; ant: TLista; var act: TLista);
var
    aux: TLista;
begin
    aux := act;
    if (act = l) then begin
        l := l^.sig;
    end
    else begin
        ant^.sig := act^.sig;
    end;
    act := act^.sig;
    dispose(aux);
end;

procedure insertarOrdenado(var l: TLista; nuevo: TLista);
var
    ant: TLista;
    act: TLista;
    nue: TLista;
begin
    act := l;
    new(nue);
    nue^.dato := nuevo^.dato;
    nue^.sig := Nil;
    while (( act <> Nil ) and ( act^.dato.codigoPartido < nuevo^.dato.codigoPartido )) do begin
        act := act^.sig;
    end;
    if l = Nil then begin
        l := nue;
    end
    else begin
        ant^.sig := nue;
        nue^.sig := act;
    end;
end;

procedure minimos(vectorVacunadosPartidos: TVectorVacunadosPartidos; vNP: TVectorNombresPartidos);
var
    j: integer;
    minimo: integer;
    codigoMinimo: integer;
    minimo2: integer;
    codigoMinimo2: integer;
begin
    minimo := INF;
    minimo2 := INF;
    for j := 1 to PARTIDOS do begin
        if vectorVacunadosPartidos[j] < minimo then begin
            minimo2 := minimo;
            codigoMinimo2 := codigoMinimo;
            minimo := vectorVacunadosPartidos[j];
            codigoMinimo := j;
        end
        else if vectorVacunadosPartidos[j] < minimo2 then begin
            minimo2 := vectorVacunadosPartidos[j];
            codigoMinimo2 := j;
        end;
    end;
    Writeln('Partidos con menos vacunados', vNP[codigoMinimo], ' con ', minimo, ' vacunados.');
    Writeln('Partidos con menos vacunados', vNP[codigoMinimo2], ' con ', minimo2, ' vacunados.');

end;

procedure recorrerLista(var l: TLista; var vectorVacunadosPartidos: TVectorVacunadosPartidos; var vectorListasZonas: TVectorListasZonas; vNP: TVectorNombresPartidos);
var
    act: TLista;
    ant: TLista;
begin
    act := l;
    while ( act <> Nil ) do begin
        if (act^.dato.fecha.ano <> 2021) then begin
            eliminar(l, ant, act);
        end
        else begin
            vectorVacunadosPartidos[act^.dato.codigoPartido] := vectorVacunadosPartidos[act^.dato.codigoPartido] + act^.dato.cantidadVacunados;
            insertarOrdenado(vectorListasZonas[act^.dato.codigoZona], act);
            act := act.sig;
        end;
    end;
    minimos(vectorVacunadosPartidos, vNP);
end;

//codigo principal que inicialice los vectores, se los pase a recorrer lista y luego elimine las listas liberando la memoria