type
    subRangoCategoria = 1..4;
    TDireccion = array[1..70] of char;
    TPersona = record
        nombre = string;
        apellido = string;
        categoria = subRangoCategoria;
        monto = Real;
        direccion = TDireccion;
    end;

    TLista = ^TNodo;
    TNodo = record
        dato: TPersona;
        sig: TLista;
    end;
    
    TVectorCategoriaMonto = array[subRangoCategoria] of real;

procedure obtenerMaximo(act: TLista, totalAPagar: integer; var maximo: integer; var maximoN: integer);
begin
    if act^.dato.categoria = 2 then begin
        if totalAPagar > maximo then begin
            maximo  := totalAPagar;
            maximoN := act^.dato.nombre;
        end;
    end;
end;

procedure procesarLista(act: TLista; var maximo: integer; var maximoN: string; var preciosSalida: TVectorCategoriaMonto; preciosEntrada: TVectorCategoriaMonto);
var
    totalAPagar: integer;
begin
    totalAPagar := act^.dato.monto + preciosEntrada[act^.dato.categoria];
    preciosSalida[act^.dato.categoria] := preciosSalida[act^.dato.categoria] + totalAPagar;
    obtenerMaximo(act, totalAPagar, maximo, maximoN);
end;

procedure recorrerLista(lista: TLista; var preciosSalida: TVectorCategoriaMonto; preciosEntrada: TVectorCategoriaMonto );
var
    aux: TLista;
    maximo: integer;
    maximoN: string;
begin
    aux := lista;
    maximo := -1;
    while (aux <> Nil) do begin
        procesarLista(aux, maximo, maximoN, preciosSalida, preciosEntrada);
        aux := aux^.sig;
    end;
    if maximo <> -1 then
        Writeln('El gil que mas pago es ', maximoN)
    else
        Writeln('Ningun gil pago una verga el servicio categoria 2');
end;

procedure procesarA(direccion: string; var j: integer, var A: string, var salida: boolean);
var
    caracteresPermitidos: set of char;
begin
    letrasPermitidas := ['A' .. 'G'];
    caracteresPermitidos := ['A'..'G', '2', '4', '6', '8', '0'];
    while ((direccion[j] <> '%') and salida) do begin
        if(direccion[j] in caracteresPermitidos) then begin
            if (direccion[j] in letrasPermitidas) then begin
                A := A + direccion[j];
            end;
            j := j + 1;
        end
        else
            salida := false;
    end;
end;

function procesarDireccion(direccion: TDireccion): boolean;
var
    j: integer;
    salida: boolean;
    A: string;
begin
    salida := true;
    j := 1;
    A := '';
    procesarA(direccion, j, A, salida);
end;