var
  letras: set of char;
  numeros: set of 1..10;
begin
    letras := ['a', 'b', 'c'];
    if 'a' in letras then
        Writeln('El caracter a esta dentro del conjunto letras');
    Include(letras, 'd');
    Writeln('El caracter d esta dentro del conjunto letras');
    Exclude(letras, 'b');
    Writeln('El caracter b ya no esta dentro del conjunto letras');
    letras := letras + ['x', 'y'];
    Writeln('Los caracteres x e y ahora estan dentro del conjunto letras');
    // letras := letras * ['a', 'e', 'i', 'o', 'u']; // intereseccion
    // letras := letras - ['a', 'e']; // Diferencia
    if letras = ['a', 'b'] then
        Writeln('El conjunto letras es igual a [a, b]');
    if ['a'] <= letras then
        Writeln('El conjunto letras contiene al subconjunto [a]');



end.