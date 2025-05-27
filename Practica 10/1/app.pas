program app;

type

    rangoCodigoImpuesto = 1..9;

    TCliente = record
        dni: longInt;
        nombre: string;
        apellido: string;
        codigoImpuesto: rangoCodigoImpuesto;
        monto: longint;
    end;

    TListaClientes = ^TNodo;
    TNodo = record
        dato: TCliente;
        sig: TListaClientes; 
    end;

procedure agregarCliente(var listaClientes: TListaClientes; dni: longint; nombre: string; apellido: string; codigoImpuesto: rangoCodigoImpuesto; monto: longint );
var
    anterior: TListaClientes;
    actual: TListaClientes;
    nuevoCliente: TListaClientes;
begin
    nuevoCliente := new(TListaClientes);
    nuevoCliente^.dato.dni := dni;
    nuevoCliente^.dato.nombre := nombre;
    nuevoCliente^.dato.apellido := apellido;
    nuevoCliente^.dato.codigoImpuesto := codigoImpuesto;
    nuevoCliente^.dato.monto := monto;

    if listaClientes = Nil then
        begin
            listaClientes := nuevoCliente;
        end
    else
        begin
            actual := listaClientes;
            while (actual <> Nil) do begin
                anterior := actual;
                actual := actual^.sig;
            end;
            anterior^.sig := nuevoCliente;
        end;
end;

procedure cargarClientes(var listaClientes: TListaClientes);
begin
    agregarCliente(listaClientes, 47020963, 'Manuel Tomas', 'Teves', 5, 1500);
    agregarCliente(listaClientes, 32654789, 'Carlos', 'Teves', 2, 1000);
    agregarCliente(listaClientes, 35020963, 'Lorena', 'Lombardi', 3, 2000);
    agregarCliente(listaClientes, 32654789, 'Abc', 'asd', 2, 2000);
end;

procedure imprimirListaClientes(listaClientes: TListaClientes);
var
    actual: TListaClientes;
begin
    actual := listaClientes;
    while(actual <> Nil) do begin
        writeln('---------------------------------------------');
        writeln('Nombre:', actual^.dato.nombre, ';Apellido:', actual^.dato.apellido, ';DNI:', actual^.dato.dni, ';codigo de impuesto:', actual^.dato.codigoImpuesto, ';monto:', actual^.dato.monto);
        actual := actual^.sig;
    end;
    writeln('---------------------------------------------');
end;

procedure disposeListaClientes(var listaClientes: TListaClientes);
var
    actual: TListaClientes;
begin
    while ( listaClientes <> nil ) do begin
        actual := listaClientes;
        listaClientes := listaClientes^.sig;
        dispose(actual);
    end;
end;

var
    listaClientes: TListaClientes;
    montoTotalRecaudado: longint;
    clienteActual: TListaClientes;
    clientesRestantes: integer;
    vectorCodigoImpuesto_TotalRecaudado: array[1..9] of integer;
    codigoMaximo: integer;
    valorMaximo: integer;
    aux: integer;
begin
    for aux := 1 to 9 do
        vectorCodigoImpuesto_TotalRecaudado[aux] := 0;
    montoTotalRecaudado := 0;
    cargarClientes(listaClientes);
    imprimirListaClientes(listaClientes);

    clienteActual := listaClientes;
    while ((montoTotalRecaudado <= 100000) and (clienteActual <> Nil)) do
        begin
            vectorCodigoImpuesto_TotalRecaudado[clienteActual^.dato.codigoImpuesto] := vectorCodigoImpuesto_TotalRecaudado[clienteActual^.dato.codigoImpuesto] + clienteActual^.dato.monto;
            montoTotalRecaudado := montoTotalRecaudado + clienteActual^.dato.monto;
            clienteActual := clienteActual^.sig;
        end;
    
    codigoMaximo := 0;
    valorMaximo := 0;

    for aux := 1 to 9 do begin
        if vectorCodigoImpuesto_TotalRecaudado[aux] > valorMaximo then begin
            codigoMaximo := aux;
            valorMaximo := vectorCodigoImpuesto_TotalRecaudado[aux];
        end;
    end;

    Writeln(codigoMaximo,' ', valorMaximo);
    
    if clienteActual <> nil then begin
            clientesRestantes := 0;
            while clienteActual <> Nil do begin
                clienteActual := clienteActual^.sig;
                clientesRestantes := clientesRestantes + 1;
            end;
            WriteLn('[i] Quedaron ', clientesRestantes, ' sin atender.');
        end
    else begin
            WriteLn('[i] Todos los clientes fueron atendido.');
    end;
    disposeListaClientes(listaClientes);
end.