program app;

var
    inscriptos: Integer;
    aprobados: Integer;
begin

    inscriptos := 160;
    aprobados := 48;

    Write(((aprobados/inscriptos)*100):2:2);
    WriteLn('% de aprobados')

end.