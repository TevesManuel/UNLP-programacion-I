program app;
// type
//     matriz: array[1..50, 1..50] of Integer;

var
  matriz: array[1..50, 1..50] of Integer;
  i, j: Integer;
begin
  for i := 1 to 50 do
    for j := 1 to 50 do
      matriz[i][j] := 0;
      
  for i := 1 to 50 do
    for j := 1 to 50 do
      Writeln('[', i, '][', j, ']: ', matriz[i][j]);
      
end.
