Type
    Date = record 
        day: integer;
        month: integer;
        year: integer;
    end;
    Duration = record
        minutes: integer;
        seconds: integer;
    end;
    SessionData = record
        guest: string;
        views: integer;
        date: Date;
        duration: Duration;
    end;

function isDateOlder(date: Date; comp: Date) : boolean;
begin
    if date.year <> comp.year then
        begin
            if date.year < comp.year then
                isDateOlder := true
            else
                isDateOlder := false;
        end
    else if date.month <> comp.month then
        begin
            if date.month < comp.month then
                isDateOlder := true
            else
                isDateOlder := false;        
        end
    else if date.day <> comp.day then
        begin
            if date.day < comp.day then
                isDateOlder := true
            else
                isDateOlder := false;
        end;
end;

function areDatesEquals(date1: Date; date2: Date): boolean;
begin
    if(
        (date1.day = date2.day) and
        (date1.month = date2.month) and
        (date1.year = date2.year)
    ) then
        areDatesEquals := true
    else
        areDatesEquals := false;
end;

function isLongerThan(duration: Duration; duration2: Duration) : boolean;
begin
    isLongerThan := false;
    if duration.minutes <> duration2.minutes then
        begin
            if duration.minutes < duration2.minutes then
                isLongerThan := false
            else
                isLongerThan := true;
        end
    else if duration.seconds <> duration2.minutes then
        begin
            if duration.seconds < duration2.seconds then
                isLongerThan := false
            else
                isLongerThan := true;
        end;
end;

function isBreakCaseSession(session: SessionData): boolean;
begin
    isBreakCaseSession := ((session.date.day = 30) and (session.date.month = 4) and (session.date.year = 2001));
end;

procedure readSession(var inputSession: SessionData);
begin
    Writeln('###########################################');
    Writeln('## Session                               ##');
    Writeln('###########################################');
    Write('Dia de fecha de lanzamiento: ');
    Readln(inputSession.date.day);
    Write('Mes de fecha de lanzamiento: ');
    Readln(inputSession.date.month);
    Write('Ano de fecha de lanzamiento: ');
    Readln(inputSession.date.year);
    if(not isBreakCaseSession(inputSession)) then
        begin
            Write('Invitado de la sesion: ');
            Readln(inputSession.guest);
            Write('Vistas de la sesion: ');
            Readln(inputSession.views);
            Write('Minutos de duracion: ');
            Readln(inputSession.duration.minutes);
            Write('Segundos de duracion: ');
            Readln(inputSession.duration.seconds);
        end;
end;

procedure writeDate(date: Date);
begin
    Writeln(date.day, '/', date.month, '/', date.year);
end;

procedure setZeroDate(var date: Date);
begin
    date.day := 0;
    date.month := 0;
    date.year := 0;
end;

procedure setHighDate(var date: Date);
begin
    date.day := High(integer);
    date.month := High(integer);
    date.year := High(integer);
end;

procedure setHighDuration(var duration: Duration);
begin
    duration.minutes := High(integer);
    duration.seconds := High(integer);
end;

var
    inputSession: SessionData;
    lastGuest: string;
    dateLastGuest: Date;
    penultimateGuest: string;
    datePenultimateGuest: Date;
    firstGuest: string;
    dateFirstGuest: Date;
    viewsShorterSession: integer;
    durationShorterSession: Duration;

begin
    lastGuest := '';
    setZeroDate(dateLastGuest);
    penultimateGuest := '';
    setZeroDate(datePenultimateGuest);
    firstGuest := '';
    setHighDate(dateFirstGuest);
    viewsShorterSession := 0;
    setHighDuration(durationShorterSession);

    repeat
        readSession(inputSession);
        if (not isBreakCaseSession(inputSession)) then
            begin
                if( isDateOlder(dateLastGuest, inputSession.date)) then
                    begin
                        penultimateGuest := lastGuest;
                        datePenultimateGuest := dateLastGuest;
                        lastGuest := inputSession.guest;
                        dateLastGuest := inputSession.date;
                    end
                else if( isDateOlder(datePenultimateGuest, inputSession.date)) then
                    begin
                        penultimateGuest := inputSession.guest;
                        datePenultimateGuest := inputSession.date;
                    end;
                if( isDateOlder(inputSession.date, dateFirstGuest) ) then
                    begin
                        firstGuest := inputSession.guest;
                        dateFirstGuest := inputSession.date;
                    end;
                if (isLongerThan(durationShorterSession, inputSession.duration)) then
                    begin
                        durationShorterSession := inputSession.duration;
                        viewsShorterSession := inputSession.views;
                    end;
                
            end;
    until isBreakCaseSession(inputSession);
    Writeln('El artista con la cancion mas reciente es ', lastGuest);
    Writeln('El artista posterior con la cancion mas reciente es ', penultimateGuest);
    Writeln('El artista que hizo la primera sesion es ', firstGuest);
    Writeln('La cantidad de vistas de la sesion mas corta es  ', viewsShorterSession);
end.