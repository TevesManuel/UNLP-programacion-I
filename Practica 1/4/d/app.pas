program app;

var

	i: Integer;
	exit_condition: Boolean;
	cities_num : Integer;
	city_population : Integer;
	total_population : Integer;
	min_population_average : Real;
	id_min : Integer;
	max_population_average : Real;
	id_max : Integer;

	tmp_average : Real;

begin

	id_max := -1;
	id_min := -1;
	min_population_average := High(Integer);
	max_population_average := 0;
	total_population := 0;

	for i := 1 to 3 do
		begin
			
            cities_num := 0;
    		total_population := 0;
            exit_condition := false;
    
            While not exit_condition do
				begin
                    cities_num := cities_num + 1;
					Write('Numero de habitantes de la ciudad nro ', cities_num, ' en el partido nro ', i, ' :');
					Read(city_population);
                    if city_population = 0 then
                        begin
                            cities_num := cities_num - 1;
                            exit_condition := true;
                        end
                    else
                        begin
                        	total_population := total_population + city_population;
                        end;
                end;
			
			tmp_average := total_population/cities_num;

			WriteLn('Habitantes promedio por ciudad del partido: ', tmp_average);
			if tmp_average > max_population_average then
				begin
					max_population_average := tmp_average;
					id_max := i;
				end;
			if tmp_average < min_population_average then
				begin
					min_population_average := tmp_average;
					id_min := i;
				end;
		end;

		WriteLn('Resultados:');
		WriteLn('El partido con mas habitantes en promedio es ', id_max, ' y el con menos es ', id_min);

end.