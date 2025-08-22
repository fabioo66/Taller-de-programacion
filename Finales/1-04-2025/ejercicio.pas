program ejercicioParcial;
type
	vehiculo = record
		patente: string;
		marca: string;
		anioFabricacion: integer;
		valorFiscal: real;
		dniPropietario: integer;
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
	writeln('Ingrese la patente');
	readln(v.patente);
	if (v.patente <> 'ZZZ') then begin
		writeln('Ingrese la marca');
		readln(v.marca);
		writeln('Ingrese el anio de fabricacion');
		readln(v.anioFabricacion);
		writeln('Ingrese el valorFiscal');
		readln(v.valorFiscal);
		writeln('Ingrese el dni del propietario'); 
		readln(v.dniPropietario);
	end;
end;

procedure insertarVehiculo(var a: arbol; v: vehiculo);
begin
	if (a = nil) then begin
		new(a);
		a^.dato := v;
		a^.HI := nil;
		a^.HD := nil;
	end
	else begin
		if(v.valorFiscal <= a^.dato.valorFiscal) then
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

procedure entreValores(a: arbol; valor1, valor2: real; var cant: integer);
begin
    if (a <> nil) then begin
        if (a^.dato.valorFiscal >= valor1) and (a^.dato.valorFiscal <= valor2) then begin
            cant := cant + 1;
            entreValores(a^.HI, valor1, valor2, cant);
            entreValores(a^.HD, valor1, valor2, cant);
        end
        else if (a^.dato.valorFiscal < valor1) then
            entreValores(a^.HD, valor1, valor2, cant)
        else
            entreValores(a^.HI, valor1, valor2, cant);
    end;
end;

procedure insertarOrdenado(var l: lista; v: vehiculo);
var
	ant, act, nue: lista;
begin
	new(nue);
	nue^.dato := v;
	act := l;
	ant := act;
	while (act <> nil) and (act^.dato.valorFiscal < v.valorFiscal) do begin
		ant := act;
		act := act^.sig;
	end;
	if (act = ant) then
		l := nue
	else
		ant^.sig := nue;
	nue^.sig := act;
end;

procedure cargarLista(a: arbol; var l: lista; anio: integer);
begin
	if (a <> nil) then begin
		cargarLista(a^.HI, l, anio);
		cargarLista(a^.HD, l, anio);
		if (a^.dato.anioFabricacion < anio) then
			insertarOrdenado(l, a^.dato);
	end;
end;

procedure imprimirVehiculo(v: vehiculo);
begin
    writeln('Patente: ', v.patente);
    writeln('Marca: ', v.marca);
    writeln('Anio de fabricacion: ', v.anioFabricacion);
    writeln('Valor fiscal: ', v.valorFiscal:0:2);
    writeln('DNI propietario: ', v.dniPropietario);
    writeln('-----------------------------');
end;

procedure imprimirLista(l: lista);
begin
	while (l <> nil) do begin
		imprimirVehiculo(l^.dato);
		l := l^.sig;
	end;
end;

var
	a: arbol;
	l: lista;
	cant, anio: integer;
	valor1, valor2: real;
begin
	a := nil;
	l := nil;
	cant := 0;
	cargarArbol(a);
	writeln('ingrese un valor');
	readln(valor1);
	writeln('ingrese un valor');
	readln(valor2);
	entreValores(a, valor1, valor2, cant);
	writeln('La cantidad de valores entre los valores ingresados ', valor1:0:2, ' y ', valor2, ' es ', cant);
	writeln('Ingrese un anio');
	readln(anio);
	cargarLista(a, l, anio);
	imprimirLista(l);
end.
