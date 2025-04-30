Type
	PersonInstance = record
        name: string; 
        age: integer;
    end;
	ListInstance = ^ NodeInstance;
	NodeInstance = record
		data: PersonInstance;
		next: ListInstance;
	end;

procedure readPerson(var person: PersonInstance);
begin
    Writeln('#########################################');
    Writeln('### Person input                      ###');
    Writeln('#########################################');
    Write('Input name:');
    Readln(person.name);
    Write('Input age:');
    Readln(person.age);
end;


procedure addForward(var list: ListInstance; person: PersonInstance);
var

    current: ListInstance;
    newList: ListInstance;

begin

    new(newList); // newList es un puntero a un NodeInstance por lo tanto al usar ^ accedemos al puntero node
    newList^.data := person;
    newList^.next := Nil;

    if ( list <> Nil ) then
        begin
            
            current := list;
            
            while ( current^.next <> Nil ) do
                current := current^.next;
            
            current^.next := newList;

        end
    else
        list := newList;

end;

procedure writeList(list: ListInstance);
begin
    if(list <> Nil) then
        begin-
            while(list^.next <> Nil) do
                begin
                    Writeln('Elemento ', list^.data.name);
                    list := list^.next;
                end;
        end;
end;


var

	list: ListInstance;
	person: PersonInstance;
	
begin
	list := nil;
	readPerson(person);
    writeList(list);
	while(person.age > 0) do
		begin
			addForward(list, person);
        	readPerson(person);
		end;
    writeList(list);
end.