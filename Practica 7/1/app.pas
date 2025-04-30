program app;

const
    SIZE = 10;

type
    vector = array[0..SIZE] of integer;

procedure vectorSet(var v: vector; n: integer; i: integer);
var
    it : integer;
begin
    // for it := (SIZE-1) downto i do
    //     begin
    //         v[it] := v[it-1];
    //     end;
    v[i] := n;
end;

procedure writeVector(v: vector);
var
    i: integer;
begin
    for i := 0 to SIZE do
        Writeln('[', i, ']=',v[i]); 
end;

var
    vec: vector;
begin
    vec[0] := 1;
    vec[1] := 2;
    vec[2] := 3;
    vec[3] := 4;
    vec[4] := 5;
    vec[5] := 0;
    vec[6] := 0;
    vec[7] := 0;
    vec[8] := 0;
    vec[9] := 16;
    vec[10] := 32;
    writeVector(vec);
    writeln('--------------------------------------');
    vectorSet(vec, 82, 3);
    writeVector(vec);
end.