program app;

const
    DIMF = 10;

type
    ArrayInstance = array[0..DIMF] of integer;
    vector = record
        arr: ArrayInstance;
        lenght: integer;
    end;

procedure find(v: vector; n: integer; var out: boolean);
var
    index: integer;
    lastIndex: integer;
begin
    out := false;
    lastIndex := 0;
    index := v.lenght div 2;

    while ((abs(lastIndex-index) > 1) and (not out)) do
        begin
            Writeln(lastIndex);
            Writeln(index);
            Writeln(v.arr[index] < n);
            Writeln(v.arr[index] > n);
            Writeln(v.arr[index] = n);
            if (v.arr[index] < n) then
                begin
                    Writeln('dsa 1');
                    lastIndex := index;
                    index := index + ((v.lenght - index) div 2);
                end
            else if (v.arr[index] > n) then
                begin
                    Writeln('dsa 2');
                    lastIndex := index;
                    index := index - (index div 2);
                end
            else
                begin
                    Writeln('asd');
                    out := true;
                end;
        end;
end;

procedure initializeVector(var vec: vector);
var
    i: integer;
begin
    vec.lenght := DIMF;
    for i := 0 to DIMF do
        vec.arr[i] := i;
end;

procedure writeVector(var vec: vector);
var
    i: integer;
begin
    for i := 0 to DIMF do
        Writeln('[', i, ']=', vec.arr[i]);
end;

var
    vec: vector;
    out: boolean;
begin
    initializeVector(vec);
    writeVector(vec);
    find(vec, 4, out);
    // writeln(out);
end.