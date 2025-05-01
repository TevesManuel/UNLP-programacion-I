program app;

const
    DIMF = 10;
type
    ArrInstance = array [0..DIMF] of integer;
    vector = record
        arr: ArrInstance;
        lenght: integer;
    end;

procedure insertBIntoA(var A: vector; B: vector; I: integer);
var
    it: integer;
    it2: integer;
    newLenght: integer;
begin
    newLenght := 0;
    if (I > A.lenght) then
        newLenght := I + B.lenght - 1
    else
        newLenght := A.lenght + B.lenght;
    if(newLenght > DIMF) then
        Writeln('[!] Error: Con esta configuracion se supera la dimension fisica.')
    else
        begin
            if A.lenght > I then
                begin
                    for it2 := 0 to (B.lenght-1) do
                        for it := (A.lenght+1) downto I do
                            A.arr[it] := A.arr[it-1];
                end;
            for it := I to (I+B.lenght-1) do
                A.arr[it] := B.arr[it - I];

            A.lenght := newLenght+1;
        end;
end;

procedure initializeVector(var vec: vector);
var
    i: integer;
begin
    vec.lenght := 0;
    for i := 0 to DIMF do
        vec.arr[i] := 0;
end;

procedure writeVector(vec: vector);
var
    i: integer;
begin
        Writeln(vec.lenght);
    for i := 0 to DIMF do
        if ( i < vec.lenght ) then
            Writeln('[', i, ']=', vec.arr[i])
        else
            Writeln('[', i, ']=', vec.arr[i], ' (NOT DEFINED) ');
end;

var
    vecA: vector;
    vecB: vector;
begin
    initializeVector(vecA);
    vecA.arr[0] := 1;
    vecA.arr[1] := 2;
    vecA.arr[2] := 3;
    vecA.arr[3] := 4;
    vecA.lenght := 4;
    writeVector(vecA);
    initializeVector(vecB);
    vecB.arr[0] := 8;
    vecB.arr[1] := 9;
    vecB.lenght := 2;
    writeVector(vecB);
    insertBIntoA(vecA, vecB, 9);
    writeVector(vecA);
end.