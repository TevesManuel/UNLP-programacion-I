program app;

type
    dias            = 1..31;
    meses           = 1..12;
    anos            = 1975..2006;
    codigosCarreras = 1..6;

    TFecha = record
        dia: dias;
        mes: meses;
        ano: anos;
    end;

    TIngresante = record
        apellido:        string;
        nombre:          string;
        ciudadNatural:   string;
        fechaNacimiento: TFecha;
        tituloSecu:      boolean;
        codigoCarrera:   codigosCarreras;
    end;

    TLista = ^TNodo;
    TNodo = record
        dato:      TIngresante;
        siguiente: TLista;
    end;

    TVectorAnos     = array[anos] of integer;
    TVectorCarreras = array[codigosCarreras] of integer;

procedure eliminarIngresante(var listaIngresantes: TLista; var act: TLista; var ant: TLista);
var
    aux: TLista;
begin
    aux := act;
    if (act = listaIngresantes) then begin
        listaIngresantes := listaIngresantes^.siguiente
    end
    else begin
        act := act^.siguiente;
        ant^.siguiente := act;
    end;
    dispose(aux);
end;

procedure procesarIngresante(aux: TLista; var vectorAnos: TVectorAnos; var vectorCarreras: TVectorCarreras);
begin
    if aux^.dato.ciudadNatural = 'Chacabuco' then begin
        Writeln(aux^.dato.apellido);
    end;
    vectorAnos[aux^.dato.fechaNacimiento.ano] := vectorAnos[aux^.dato.fechaNacimiento.ano] + 1;
    vectorCarreras[aux^.dato.codigoCarrera] := vectorCarreras[aux^.dato.codigoCarrera] + 1;
end;

procedure procesarIngresantes(var listaIngresantes: TLista; var vectorAnos: TVectorAnos; var vectorCarreras: TVectorCarreras);
var
    ant: TLista;
    aux: TLista;
begin
    ant := listaIngresantes;
    aux := listaIngresantes;

    while( aux <> Nil ) do begin

        if aux^.dato.tituloSecu then begin
            procesarIngresante(aux, vectorAnos, vectorCarreras);

            ant := aux;
            aux := aux^.siguiente;
        end
        else begin
            eliminarIngresante(listaIngresantes, aux, ant);
        end;
    end;
end;

procedure informarMaximoVectorAnos(vectorAnos: TVectorAnos);
var
    anoMaximo: anos;
    maximo: integer;
    i: anos;
begin
    i := 1975;
    maximo := 0;
    for i := 1975 to 2006 do begin
        if vectorAnos[i] > maximo then begin
            anoMaximo := i;
            maximo := vectorAnos[i];
        end;
    end;
    Writeln(anoMaximo);
end;

procedure informarMaximoVectorCarreras(vectorCarreras: TVectorCarreras);
var
    carreraMaximo: codigosCarreras;
    maximo: integer;
    i: codigosCarreras;
begin
    i := 1;
    maximo := 0;
    for i := 1 to 6 do begin
        if vectorCarreras[i] > maximo then begin
            carreraMaximo := i;
            maximo := vectorCarreras[i];
        end;
    end;
    Writeln(carreraMaximo);
end;


procedure informar(vectorAnos: TVectorAnos; vectorCarreras: TVectorCarreras);
begin
    informarMaximoVectorAnos(vectorAnos);
    informarMaximoVectorCarreras(vectorCarreras);
end;

procedure inicializarVariables(var listaIngresantes: TLista; var vectorAnos: TVectorAnos; var vectorCarreras: TVectorCarreras);
var
    i: integer;
begin
    listaIngresantes := Nil;
    for i := 1 to 6 do begin
        vectorCarreras[i] := 0;
    end;
    for i := 1975 to 2006 do begin
        vectorAnos[i] := 0;
    end;
end;

procedure eliminarLista(l: TLista);
var
    aux : TLista;
begin
    while ( l <> Nil ) do begin
        aux := l;
        l := l^.siguiente;
        dispose(aux);
    end;
end;

//Funcion principal
var
    vectorAnos      : TVectorAnos;
    vectorCarreras  : TVectorCarreras;
    listaIngresantes: TLista;
begin
    inicializarVariables(listaIngresantes, vectorAnos, vectorCarreras);
    procesarIngresantes(listaIngresantes, vectorAnos, vectorCarreras);
    informar(vectorAnos, vectorCarreras);
    eliminarLista(listaIngresantes);
end.