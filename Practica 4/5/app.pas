program app;

const

    CONTENTS_NUMBER := 3;

type

    ContentInstance = record
        code: string;
        duration: integer;
        category: string;
        reproductions: integer;
        costPerReproduction: integer;
    end;

procedure readContent(var content: ContentInstance);
begin
    Writeln('#############################################');
    Writeln('### Content Input                         ###');
    Writeln('#############################################');
    Write('Codigo de identificacion: ');
    Readln(content.code);
    Write('Duration: ');
    Readln(content.duration);
    Write('Categoria: ');
    Readln(content.category);
    Write('Reproducciones: ');
    Readln(content.reproductions);
    Write('Costo por reproduccion: ');
    Readln(content.costPerReproduction);
end;

var

    content: ContentInstance;

    codeFewerViews: string;
    fewerViews: integer;

begin

    readContent(content);
    

end.