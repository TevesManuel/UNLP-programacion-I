program ThomaSanti

type
    subRangoValores = 1..10;

    TCelda = record
        valor: subRangoValores;
        usado: boolean;
    end;
    TMatrizCeldas = array[1..15, 1..15] of TCelda;

    TInfoCelda = record
        fila: integer;
        columna: integer;
        valor: subRangoValores;
    end;

    TLista = ^TNodo;
    TNodo = record
        dato: TInfoCelda;
        sig: TLista;
    end;

procedure cargarValores(listaValores: TLista);//Se dispone
var
begin
end;

procedure incializarTablero(var matrizCeldas: TMatrizCeldas; lista: TLista);
var
    aux: TLista;
    i: integer;
    j: integer;
begin
    aux := lista;
    for i := 1 to 15 do begin
        for j := 1 to 15 do begin
            matrizCeldas[i, j].usado := True;
        end;
    end;
    while ( aux <> Nil ) do begin
        matrizCeldas[aux^.dato.fila, aux^.dato.columna].valor := aux^.dato.valor;
        matrizCeldas[aux^.dato.fila, aux^.dato.columna].usado := False;
        aux := aux^.sig;
    end;
    for i := 1 to 15 do begin
        for j := 1 to 15 do begin
            if matrizCeldas[i, j].usado then begin
                matrizCeldas[i, j].valor := 0;
                matrizCeldas[i, j].usado := False;
            end;
        end;
    end;
end;

procedure eliminarLista(l: TLista);
var
    aux: TLista;
begin
    while(l <> Nil) do begin
        aux := l;
        l := l^.sig;
        dispose(aux);
    end;
end;

procedure simularJuego();
var
    ronda: integer;
begin
    for ronda := 1 to 10 do begin
        
    end;
end;

var
    matrizCeldas: TMatrizCeldas;
    listaValores: TLista;
begin
    cargarValores(listaValores);//Se dispone
    incializarTablero(matrizCeldas, listaValores);
    eliminarLista(listaValores);
end.