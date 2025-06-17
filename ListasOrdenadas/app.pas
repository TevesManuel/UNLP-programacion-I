type
    TLista = ^TNodo;
    TNodo = record
        dato     : integer;
        siguiente: TLista;
    end;

procedure insertarOrdenado(var list: TLista; n: integer);
var
    aux: TLista;
    ant: TLista;
    nue: TLista;
begin
    aux := list;
    new(nue);
    nue^.dato := n;
    nue^.siguiente := Nil;

    while ( ( aux <> Nil ) and ( aux^.dato < n ) ) do begin
        ant := aux;
        aux := aux^.siguiente;
    end;

    if (aux = list) then begin
        list := nue;
    end
    else begin
        ant^.siguiente := nue;
    end;
    
    nue^.siguiente := aux;
end;
procedure imprimirLista(list: TLista);
begin
    while list <> Nil do begin
        Writeln(list^.dato);
        list := list^.siguiente;
    end;
end;

var
    lista: TLista;
begin
    lista := Nil;
    insertarOrdenado(lista, 5);
    insertarOrdenado(lista, 3);
    insertarOrdenado(lista, 9);
    insertarOrdenado(lista, 2);
    insertarOrdenado(lista, 17);
    insertarOrdenado(lista, 3);
    imprimirLista(lista);
end.