program app;

function filterSpace(actualChar : char): char;
begin
    while(actualChar = ' ') do
        Read(actualChar);
    filterSpace := actualChar;
end;

function HowManyCharsWord(var readedChar: char): integer;
var
    charsCount: integer;
begin
    charsCount := 0;
    while( (readedChar <> '*') and (readedChar <> ' ') ) do
        begin
            charsCount := charsCount + 1;
            Read(readedChar);
        end;
    Writeln('asd, ', charsCount);
    HowManyCharsWord := charsCount;
end;


var
    readedChar: char;
    sevenCharsWords: integer;
begin
    sevenCharsWords := 0;
    readedChar := ' ';
    while(readedChar <> '*') do
        begin
            readedChar := filterSpace(readedChar);
            if HowManyCharsWord(readedChar) = 7 then
                begin
                    sevenCharsWords := sevenCharsWords + 1;
                end;
        end;
    Writeln('Hay ', sevenCharsWords, ' palabras de 7 caracteres');
end.