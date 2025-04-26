program app;

function isVowel(character: char): boolean;
begin
    if( (character = 'a')
     or (character = 'e')
     or (character = 'i')
     or (character = 'o')
     or (character = 'u')) then
        isVowel := true
    else
        isVowel := false;
end;

procedure readAndProcessLetters(var vowels: integer; var consonants: integer);
var
    character: char;
begin
    Read(character);
    while ( ( character <> '*' ) and ( character <> ' ' ) ) do
        begin
            if (character >= 'a') and (character <= 'z') then
                begin
                    if( isVowel(character) ) then
                        vowels := vowels + 1
                    else
                        consonants := consonants + 1
                end;
            Read(character);
        end;

end;

procedure info(vowels: integer; consonants: integer);
begin
    WriteLn('La palabra tiene ', vowels, ' vocales y ', consonants, ' consonantes.');
end;

var
    vowels: integer;
    consonants: integer;
begin
    vowels := 0;
    consonants := 0;
    readAndProcessLetters(vowels, consonants);
    info(vowels, consonants);
end.