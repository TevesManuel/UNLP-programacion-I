program app;

type
    distance = integer; // meters

procedure distanceBetween(d1: distance; d2: distance);
var
    distanceBetweenPoints : integer;
begin
    distanceBetweenPoints := abs(d1 - d2);
end;

var
    d1: distance;
    d2: distance;
begin
    d1 := 10;
    d2 := 5;
    distanceBetween(d1, d2);
end.