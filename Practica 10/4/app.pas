type
    dias  = 1..31;
    meses = 1..12;

    TFecha = record
        dia: dias;
        mes: meses;
        ano: integer;
    end;

    subrangoCalles = 1..122;
    TDireccion = record
        calle: subrangoCalles;
        numero: integer;
        piso: integer;
        departamento: integer;
    end;
    TPaquete = record
        fecha: TFecha;
        entregado:  boolean;
        direccion:  TDireccion;
    end;

    TLista = ^TNodo;
    TNodo = record
        dato: TPaquete;
        siguiente: TLista;
    end;
    
    TVectorCalles = array[subrangoCalles] of integer;
    TVectorMeses = array[subrangoMeses] of integer;
    subrangoCallesObjetivo = 11..20;
    TVectorListasCalles = array[subrangoCallesObjetivo] of TLista;

procedure insertarOrdenado(var l: TLista; paquete: TPaquete);
var
    nue: TLista;
    ant: TLista;
    act: TLista;
begin
    new(nue);
    nue^.siguiente := Nil;
    nue^.dato := paquete;
    act := l;
    while( ( act <> Nil ) and ( act^.dato.direccion.numero < paquete.direccion.numero ) ) do begin
        ant := act;
        act := act^.siguiente;
    end;
    if ( act = l ) then begin
        l := nue;
    end
    else begin
        ant^.siguiente := nue;
    end;
    nue^.siguiente := act;
end;

procedure procesarPaquete(var aux: TLista; var vectorC: TVectorCalles; var vectorM: TVectorMeses, l: TLista);
begin
    vectorC[aux^.dato.direccion.calle] := vectorC[aux^.dato.direccion.calle] + 1;
    vectorM[aux^.dato.fecha.mes] := vectorM[aux^.dato.fecha.mes] + 1;  
    if ((aux^.dato.direccion.calle >= 11) and (aux^.dato.direccion.calle <= 20)) then begin
        insertarOrdenado(l, aux^.dato);
    end;
end;

procedure eliminarPaquete(var lista: TLista; var act: TLista; var ant: TLista);
var
    aux: TLista;
begin
    aux := act;
    if (act = lista) then begin
        lista := lista^.siguiente;
        act := lista;
        ant := act;
    end
    else begin
        act := act^.siguiente;
        ant^.siguiente := act;
    end;
    dispose(aux);
end;

procedure procesarLista(var lista: TLista; var vectorC: TVectorCalles; var vectorM: TVectorMeses);
var
    aux: TLista;
    ant: TLista;
begin
    aux := lista;
    while(aux <> Nil) do begin
        if (aux^.dato.entregado) then begin
            procesarPaquete(aux, vectorC, vectorM, lista);
            aux := aux^.siguiente;
        end
        else begin
            eliminarPaquete(lista, aux, ant);
        end;
    end;
end;

var
    vectorC: TVectorCalles;
    vectorM: TVectorMeses;
    lista: TLista;
begin
    // cargarLista(lista);//Se dispone
    procesarLista();
end.