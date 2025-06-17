type
    subRangoCategoriaCanal = 1..12;
    subRangoCategoriaPrograma = 1..8;
    subRangoPTransmitidos = 1..20;
    
    TPrograma = record
        nombre: string;
        categoria: subRangoCategoriaPrograma;
        duracionM: integer;
        vistas: integer;
    end;

    TProgramas = record
        vector: array[subRangoPTransmitidos] of TPrograma;
        dimL: subRangoPTransmitidos;
    end;

    Canal = record
        codigo: integer;
        nombre: string;
        categoria: subRangoCategoriaCanal;
        pais: string;
        programas: TProgramas;
    end;

    TLista = ^TNodo;
    TNodo = record
        dato: Canal;
        sig: TLista;
    end;

    TMatrizCanalPrograma = array[subRangoCategoriaCanal, subRangoCategoriaPrograma] of real;

    TPais = record
        nombre: string;
        minutos: integer;
        vistas: integer;
    end;

    TListaPais = ^TNodoPais;
    TNodoPais = record
        dato: TPais;
        sig: TListaPais;
    end;
    
    TCanalPais = record
        canal: string;
        pais: string;
    end;

    TListaCanalPais = ^TNodoCanalPais;
    TNodoCanalPais = record
        dato: TCanalPais;
        sig: TListaCanalPais;
    end;

    TvectorListasCategorias = array[subRangoCategoriaCanal] of TListaCanalPais;

procedure sumarMinutosVistas(canal: TLista, pais: TListaPais);
var
    j: integer;
begin
    for j := 1 to canal^.dato.programas.dimL do begin
        pais^.dato.minutos := pais^.dato.minutos + canal^.dato.programas.vector[j].duracionM;
        pais^.dato.vistas := pais^.dato.vistas + canal^.dato.programas.vector[j].vistas;
    end;
end;

procedure insertarsPais(var listaPais: TListaPais, canal: TLista);
var
    nue: TListaPais;
    aux: TListaPais;
    ant: TListaPais;
begin
    aux := listaPais;
    ant := aux;
    while ( ( aux <> Nil ) and ( aux^.dato.nombre <> canal^.dato.pais ) ) do begin
        ant := aux;
        aux := aux.sig;
    end;
    if ( aux <> Nil ) then begin
        sumarMinutosVistas(canal, aux);
    end;
    else begin
        new(nue);
        nue^.dato.nombre := canal^.dato.pais;
        nue^.dato.minutos := 0;
        nue^.dato.vistas := 0;
        nue^.sig := Nil;
        sumarMinutosVistas(canal, nue);
        if listaPais = Nil then begin
            listaPais := nue;
        end
        else begin
            ant.sig := nue;
        end
    end;
end;

procedure insertarOrdenadoPais(var listaPais: TListaPais, nuevo: TListaPais);
var
    act: TListaPais;
    ant: TListaPais;
    nue: TListaPais;
begin
    new(nue);
    nue.dato := nuevo^.dato;
    nue.sig := Nil;
    act := listaPais;
    ant := act;
    
    while ( act <> Nil ) and act^.dato.vistas > nuevoT.dato.vistas do begin
        act := act^.sig;
    end;

    if ant = act then
        nue^.sig := listaPais;
        listaPais := nue;
    end
    else begin
        ant^.sig := nue;
        nue^.sig := act;
    end
end;

procedure eliminarListaPais(var listaPais: TListaPais);
var
    aux: TListaPais;
begin
    while ( listaPais <> Nil ) do begin
        aux := listaPais;
        listaPais := listaPais^.sig;
        dispose(listaPais);
    end;

procedure ordenarListaPais(var listaPais: TListaPais);
var
    aux: TListaPais;
    nuevaLista: TListaPais;
begin
    aux := listaPais;
    while ( aux <> Nil ) do begin
        insertarOrdenadoPais(nuevaLista, aux);
        aux := aux.sig;
    end;
    aux := listaPais;
    eliminarListaPais(aux);
    listaPais := nuevaLista;
end;

procedure procesarGanador(act: TLista; var nombreGanador: string;
    var vistasGanador: integer, var montoPremio: real,
    matrizCanalPrograma: TMatrizCanalPrograma);
var
    j: integer;
    programa: TPrograma;
begin
    for j := 1 to act^.dato.programas.dimL do begin
        programa := act^.dato.programas.vector[j]; 
        if ( programa.vistas > vistasGanador ) then begin
            vistasGanador := programa.vistas;
            nombreGanador := programa.nombre;
            montoPremio := matrizCanalPrograma[act^.dato.categoria, programa.categoria];
        end;
        if ( programa.vistas >= 50000 ) then begin
            Writeln('El programa ', programa.nombre, ' tiene mas de 50000 vistas');
        end;
    end;
end;

procedure insertarAlFinalVectorListasCategorias(act: TLista; vectorListasCategorias: TVectorListasCategorias);
var
    aux: TListaCanalPais;
    ant: TListaCanalPais;
    nue: TListaCanalPais;
begin
    new(nue);
    nue^.dato.canal := act^.dato.nombre;
    nue^.dato.pais := act^.dato.pais;
    nue^.sig := Nil;
    aux := vectorListasCategorias[act^.dato.categoria];
    if aux = Nil then begin
        vectorListasCategorias[act^.dato.categoria] := nue;
    end
    else begin
        while ( aux <> Nil ) do begin
            ant := aux;
            aux := aux^.sig;
        end;
        ant^.sig := nue;
    end;
end;

procedure recorrerLista(lista: TLista; var listaPais: TListaPais; 
matrizCanalPrograma: TMatrizCanalPrograma; var vectorListasCategorias: TvectorListasCategorias);
var
    act: TLista;
    nombreGanador: string;
    vistasGanador: integer;
    montoPremio: real;
begin
    act := lista;
    vistasGanador := 0;
    while ( act <> Nil ) do begin
        insertarsPais(listaPais, act);
        procesarGanador(act, nombreGanador, vistasGanador, montoPremio, matrizCanalPrograma);
        insertarAlFinalVectorListasCategorias(act, vectorListasCategorias);
        act := act^.sig;
    end;
    ordenarListaPais(listaPais);
    Writeln(montoPremio);
end;

//SE DISPONE
procedure cargarLista(var lista: TLista);
begin
end;
//SE DISPONE
procedure cargarMatrizCanalPrograma(var matrizCanalPrograma: TMatrizCanalPrograma);
begin
end;

procedure inicializarLista(var listaPais: TListaPais);
begin
    listaPais := Nil;
end;

procedure inicializarVector(var vectorListasCategorias: TVectorListasCategorias);
var
    j: integer;
begin
    for j := 1 to 12 do begin
        vectorListasCategorias[j] := Nil;
    end;
end;

procedure eliminarLista(var lista: TLista);
var
    aux: TLista;
begin
    while ( lista <> Nil ) do begin
        aux := lista;
        lista := lista^.sig;
        dispose(aux);
    end;
end;

procedure eliminarListaCanalPais(var l: TListaCanalPais);
var
    aux: TListaCanalPais;
begin
    while ( l <> Nil ) do begin
        aux := l;
        l := l^.sig;
        dispose(aux);
    end;
end;

procedure eliminarVectorListas(var vectorListasCategorias: TVectorListasCategorias);
var
    j: integer;
begin
    for j := 1 to 12 do begin
        eliminarListaCanalPais(vectorListasCategorias[j]);
    end;
end;

procedure inicializar(var listaPais: TListaPais; var vectorListasCategorias: TvectorListasCategorias);
begin
    inicializarLista(listaPais);
    inicializarVector(vectorListasCategorias);
end;

procedure cargar(var lista: TLista; var matrizCanalPrograma);
begin
    cargarLista(lista) // SE DISPONE
    cargarMatrizCanalPrograma(matrizCanalPrograma) // SE DISPONE
end;

procedure eliminarListas(lista: TLista; listaPais: TListaPais; vectorListasCategorias: TVectorListasCategorias);
begin
    eliminarLista(lista);
    eliminarListaPais(listaPais);
    eliminarVectorListas(vectorListasCategorias);
end;

var
    lista: TLista;
    listaPais: TListaPais; 
    matrizCanalPrograma: TMatrizCanalPrograma;
    vectorListasCategorias: TvectorListasCategorias;
begin
    inicializar(listaPais, vectorListasCategorias);
    cargar(lista, matrizCanalPrograma);
    recorrerLista(lista, listaPais, matrizCanalPrograma, vectorListasCategorias);
    //Liberar memoria FIN del programa
    eliminarListas(lista, listaPais, vectorListasCategorias);
end.