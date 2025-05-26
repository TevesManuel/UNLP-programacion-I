type

    rangoCodigoImpuesto = 1..9;

    TCliente = record
        dni: integer;
        nombre: string;
        apellido: string;
        codigoImpuesto: rangoCodigoImpuesto;
        monto: integer;
    end

    listaClientes = ^nodo;
    nodo = record
        cliente: TCliente;
        sig = listaClientes; 
    end

var
    listaClientes: listaClientes;
    montoTotalRecaudado: integer;
begin

    montoTotalRecaudado := 0;
    
end.