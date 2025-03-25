program app;

var 
    engeeniering_students_number:integer;
    number_of_subjects_approved: integer;
    note_of_subjects:integer;
    i:integer;
    max_note:real;
    average: real;
    max_note_average: real;
    max_note_code: real;
    sum_note : Real;
begin
    max_note_average := 0;
    repeat
        max_note:= 0;
        sum_note := 0;
        write('ingresar numero del estudiante de ingenieria: ');
        read(engeeniering_students_number);
        write('ingresar cantidad de materias aprobadas: ');
        read(number_of_subjects_approved);
        for i := 1 to number_of_subjects_approved do // por cada materia aprobada
            begin
                write('ingresar la nota de ', i, ': '); 
                read(note_of_subjects);
                if  (note_of_subjects > max_note) then
                    begin
                        max_note:= note_of_subjects;
                    end;
                sum_note := sum_note + note_of_subjects;
            end;
        average := sum_note / number_of_subjects_approved;
        if (average > max_note_average) then
            begin
                max_note_average := average;
                max_note_code := engeeniering_students_number;
            end;
        writeln('La maxima nota del estudiante es: ', max_note);    
    until engeeniering_students_number = 756;
    writeln('El alumno con la nota maxima es ', max_note_code:2:2, ' con un promedio de ', max_note_average:2:2);    
end.