program app;

type
    numeros = set of 0..9;

procedure descomposeN(var setn: numeros; n: integer);
begin
    setn := [];
    while ( n <> 0 ) do begin
        setn := setn + [n mod 10];
        n := n div 10;
    end;
end;

function nInM(n: integer; m: integer): boolean;
var
    setn: numeros;
    setm: numeros;
begin
    descomposeN(setn, n);
    descomposeN(setm, m);
    nInM := setn <= setm
end;

begin
    Writeln(nInM(12, 1234));
    Writeln(nInM(122, 1234));
    Writeln(nInM(126, 1234));
end.