program app;

var

	i: Integer;
	j: Integer;
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
			Write('Introduce el numero de ciudades del partido nro ', i, ': ');
			Read(cities_num);

			total_population := 0;

			for j := 1 to cities_num do
				begin

					Write('Numero de habitantes de la ciudad nro ', j, ' en el partido nro ', i, ' :');
					Read(city_population);
					total_population := total_population + city_population;
				end;
			
			tmp_average := total_population/cities_num;

			WriteLn('Habitantes promedio por ciudad del partido: ', tmp_average);
			
			if tmp_average > max_population_average then
				begin
					max_population_average := tmp_average;
					id_max := i;
				end
			else if tmp_average < min_population_average then
				begin
					min_population_average := tmp_average;
					id_min := i;
				end;
		end;

		WriteLn('Resultados:');
		WriteLn('El partido con mas habitantes en promedio es ', id_max, ' y el con menos es ', id_min);

end.
