program app;

const
    SIZE = 20;

type

    vector  = array [0..SIZE] of integer;

procedure eraseRangeVector(var vec: vector; I: integer; J: integer);
var
    it : integer;
begin
    for it := J to SIZE do
        begin
            vec[it-J+I] := vec[it];
            vec[it] := 0;
        end;
end;

procedure writeVector(v: vector);
var
    i: integer;
begin
    Writeln('-----------------------------------------');
    for i := 0 to SIZE do
        Writeln('[', i, ']=',v[i]); 
    Writeln('-----------------------------------------');
end;

procedure initializeVector(var vec: vector);
var
    i: integer;
begin
    for i := 0 to SIZE do
        vec[i] := i;
end;

var
    vec: vector;
begin
    initializeVector(vec);
    writeVector(vec);
    eraseRangeVector(vec, 2, 4);
    writeVector(vec);
end.