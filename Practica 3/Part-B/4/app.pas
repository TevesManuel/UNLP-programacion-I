program app;

type
  ArrayLetters = array['a'..'z'] of boolean;

procedure initializeArray(var arr: ArrayLetters);
var
    c: char;
begin
    for c := 'a' to 'z' do
        arr[c] := false;
end;

procedure readAndProcessLetters(var arr: ArrayLetters);
var
    character: char;
begin
    Read(character);
    while ( character <> '#' ) do
        begin
            if (character >= 'a') and (character <= 'z') then
                arr[character] := true;
            Read(character);
        end;

end;

procedure infoMissingLetters(var arr: ArrayLetters);
var
    it: char;
begin
    for it := 'a' to 'z' do
        begin
            if(not arr[it]) then
                WriteLn('No hay ', it);
        end;
end;

var
    letters: ArrayLetters;
begin
    initializeArray(letters);
    readAndProcessLetters(letters);
    infoMissingLetters(letters);
end.