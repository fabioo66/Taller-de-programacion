program diciembre.pas;
type
	vehiculo = record
		patente: string;
		marca: string;
		anio: integer;
		color: string;
		dni: integer;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: vehiculo;
		HI: arbol;
		HD: arbol;
	end;
	
	lista = ^nodoLista;
	nodoLista = record
		dato: vehiculo;
		sig: lista;
	end;

procedure leerVehiculo(var v: vehiculo);
begin
	writeln('Ingrese la patente del auto');
	readln(v.patente);
	if (v.patente <> 'ZZZ') then begin
		writeln('Ingrese la marca');
		readln(v.marca);
		writeln('Ingrese el anio');
		readln(v.anio);
		writeln('Ingrese el color');
		readln(v.color);
		writeln('Ingrese el dni');
		readln(v.dni);
	end;
end;

procedure insertarVehiculo(var a: arbol; v: vehiculo);
begin
	if (a = nil) then begin
		new(a);
		a^.dato := v;
		a^.HI := nil;
		a^.HD := nil
	end
	else begin
		if (v.dni < a^.dato.dni) then
			insertarVehiculo(a^.HI, v)
		else
			insertarVehiculo(a^.HD, v);
	end;
end;

procedure cargarArbol(var a: arbol);
var 
	v: vehiculo;
begin
	leerVehiculo(v);
	if (v.patente <> 'ZZZ') then begin
		insertarVehiculo(a, v);
		cargarArbol(a);
	end;
end;

procedure cantEntre(a: arbol; anio1, anio2: integer; var cant: integer);
begin
	if (a <> nil) then begin
		cantEntre(a^.HI, anio1, anio2, cant);
		if (a^.dato.anio >= anio1) and (a^.dato.anio <= anio2) then
			cant := cant + 1;
		cantEntre(a^.HD, anio1, anio2, cant);
	end;
end;

procedure insertarOrdenado(var l: lista; v: vehiculo);
var
	nue, ant, act: lista;
begin
	new(nue);
	nue^.dato := v;
	act := l;
	ant := act;
	while(act <> nil) and (act^.dato.dni < v.dni) do begin
		ant := act;
		act := act^.sig;
	end;
	if (act = ant) then
		l := nue
	else
		ant^.sig := nue;
	nue^.sig := act;
end;

procedure crearLista(a: arbol; var l: lista; dni: integer);
begin
	if (a <> nil) then begin
		if (a^.dato.dni < dni) then begin
			insertarOrdenado(l, a^.dato);
			crearLista(a^.Hi, l, dni);
			crearLista(a^.HD, l, dni)
		end
		else
			crearLista(a^.HI, l, dni);
	end;
end;

procedure imprimirLista(l: lista);
begin
  while (l <> nil) do begin
    writeln('patente: ', l^.dato.patente, ' dni propietario ', l^.dato.dni);
    l := l^.sig;
  end;
end;

var
	a: arbol;
	l: lista;
	anio1, anio2, cant, dni: integer;
begin
	a := nil;
	l := nil;
	cargarArbol(a);
	writeln('Ingrese un anio de fabricacion');
	readln(anio1);
	writeln('Ingrese un anio de fabricacion');
	readln(anio2);
	cant := 0;
	cantEntre(a, anio1, anio2, cant);
	writeln('La cantidad es ', cant);
	writeln('Ingrese un dni');
	readln(dni);
	crearLista(a, l, dni);
	imprimirLista(l);
end.
