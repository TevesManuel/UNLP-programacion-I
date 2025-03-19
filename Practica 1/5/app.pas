program app;

var

    degree_code: Char;
    degree_count: Integer;
    degree_duration: Integer;

    min_average_students : Real;
    min_average_deegre_code : Char;

    i: Integer; {ITERATOR}
    year_students: Integer; {INPUT}
    total_year_students: Integer;
    average: Real;
    
begin
    
    min_average_students := 100;

    for degree_count := 1 to 2 do {TO 10 DO}
        begin

            Write('Codigo de carrera: ');
            ReadLn(degree_code);
            Write('Cuanto dura en anos: ');
            ReadLn(degree_duration);

            total_year_students := 0;

            for i := 1 to degree_duration do
                begin

                    Write('Cuantos alumnos cursan el ', i, ' ano: ');
                    ReadLn(year_students);
                    total_year_students := total_year_students + year_students;

                end;

            average := total_year_students/degree_duration;

            if average < min_average_students then
                begin
                    min_average_students := average;
                    min_average_deegre_code := degree_code;
                end;

        end;
    
    Writeln('La carrera mas baja es ', min_average_deegre_code, ' con un promedio de ', min_average_students); {PSICOLOGIA}

end.