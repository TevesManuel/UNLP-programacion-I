program app;

type    
    subRangoCajas = 1..6;

    TTicket = record
        nroCaja: subRangoCajas;
        ticket: integer;
        monto: real;
    end;

    TListaTicket = ^TNodoTicket;
    TNodoTicket = record
        valor: TValor;
        siguiente: TLista; 
    end;

    TCaka = record
        montoTotal: real;
        cantidad: integer;
    end;
    TVectorCajas = array[subRangoCajas] of TCaka;
procedure insertarLista(l: TListaTicket; ticket: TTicket);
var
    aux: TListaTicket;
    prev: TListaTicket;
    nue: TListaTicket;
begin
    aux := l;
    prev := aux;
    nue := new(nue);
    nue^.valor := ticket;
    nue^.siguiente := Nil;
    while(aux <> Nil) do begin
        prev := aux;
        aux := aux^.siguiente;
    end;

    prev.siguiente := nue;
end;

procedure inicializarCajas(vectorCajas: TVectorCajas);
//Se dispone

var
    aux: TListaTicket;

    listaTickets : TListaTicket;

    listaTicketsMenores1k : TListaTicket;

    vectorCajas : TVectorCajas;
begin
    
    listaTickets := Nil;
    cargaTickets(listaTickets); // Se dispone
    inicializarCajas(vectorCajas);
    aux := listaTickets;
    while(aux <> Nil) do
        begin
            if aux^.valor.monto < 1000 then begin
                insertarLista(listaTicketsMenores1k, aux^.valor);
            end;
            vectorCajas[aux^.valor.nroCaja].montoTotal := vectorCajas[aux^.valor.nroCaja].montoTotal + aux^.valor.monto; 
            aux := aux^.siguiente;
        end;

end.