program parcial;
type
	paqueteEnviado = record
		codigoDeEnvio: integer;
		dniEmisor: integer;
		dniReceptor: integer;
		cantObjetos: integer;
		peso: real;
	end;
	
	listaPaquetes = ^nodoLista;
	nodoLista = record
		dato: paqueteEnviado;
		sig: listaPaquetes;
	end;
	
	data = record
		dniEmisor: integer;
		sumaPesos: real;
		cantTotalPaquetes: integer;
		lista: listaPaquetes;
	end;
	
	arbol = ^nodoArbol;
	nodoArbol = record
		dato: data;
		HI: arbol;
		HD: arbol;
	end;
	
	listaData = ^nodoData;
    nodoData = record
        dato: data;  
        sig: listaData;
    end;
	
procedure leerPaqueteEnviado(var p: paqueteEnviado);
begin
	writeln('Ingrese el codigo del envio');
	readln(p.codigoDeEnvio);
	if (p.codigoDeEnvio <> 0) then begin
		writeln('Ingrese el dni del emisor');
		readln(p.dniEmisor);
		writeln('Ingrese el dni del receptor');
		readln(p.dniReceptor);
		writeln('Ingrese la cantidad de objetos en el paquete');
		readln(p.cantObjetos);
		writeln('Ingrese el peso en gramos del paquete');
		readln(p.peso);
	end;
end;

procedure agregarAdelante(var l: listaPaquetes; p: paqueteEnviado);
var
	nue: listaPaquetes;
begin
	new(nue);
	nue^.dato := p;
	nue^.sig := l;
	l := nue;
end;

procedure insertarPaquete(var a: arbol; p: paqueteEnviado);
var 
	d: data;
begin
	if (a = nil) then begin
		new(a);
		d.dniEmisor := p.dniEmisor;
		d.sumaPesos := p.peso;
		d.cantTotalPaquetes := 1;
		d.lista := nil;
		a^.dato := d;
		agregarAdelante(a^.dato.lista, p);
		a^.HI := nil;
		a^.HD := nil;
	end
	else if (a^.dato.dniEmisor = p.dniEmisor) then begin
		a^.dato.sumaPesos := a^.dato.sumaPesos + p.peso;
		a^.dato.cantTotalPaquetes := a^.dato.cantTotalPaquetes + 1;
		agregarAdelante(a^.dato.lista, p)
	end
	else if (p.dniEmisor <= a^.dato.dniEmisor) then 
		insertarPaquete(a^.HI, p)
	else
		insertarPaquete(a^.HD, p);
end;

procedure cargarArbol(var a: arbol);
var
	p: paqueteEnviado;
begin
	leerPaqueteEnviado(p);
	if (p.codigoDeEnvio <> 0) then begin
		insertarPaquete(a, p);
		cargarArbol(a);
	end;
end;

procedure insertarOrdenado(var l: listaData; d: data);
var
	nue, act, ant: listaData;
begin
	new(nue);
	nue^.dato:= d;
	act:= l;
	ant := l;
	while(act <> nil)and(act^.dato.dniEmisor < d.dniEmisor)do begin
		ant:= act;
		act:= act^.sig;
	end;
	if(act = ant)then
		L:= nue
	else
		ant^.sig:= nue;
	nue^.sig:= act;
end;

procedure crearLista(a: arbol; x: integer; var l: listaData);
begin
	if (a <> nil) then begin
		crearLista(a^.HI, x, l);
		crearLista(a^.HD, x, l);
		if (a^.dato.cantTotalPaquetes < x) then
			insertarOrdenado(l, a^.dato);
	end;
end;

procedure imprimirLista(l: listaData);
begin
	while (l <> nil) do begin
		writeln('DNI: ', l^.dato.dniEmisor,
                    ' | Suma de pesos: ', l^.dato.sumaPesos:0:2,
                    ' | Cantidad paquetes: ', l^.dato.cantTotalPaquetes);
        l := l^.sig;
    end;
end;

function buscarDni(a: arbol; d: integer): boolean;
begin
	if (a = nil) then
		buscarDni := false
	else begin
		if (d = a^.dato.dniEmisor) then
			buscarDni := true
		else begin
			if (d < a^.dato.dniEmisor) then 
				buscarDni := buscarDni(a^.HI, d)
			else 
				buscarDni := buscarDni(a^.HD, d);
		end;
	end;
end;

var
	a: arbol;
	x, d: integer;
	l: listaData;
begin
	a := nil;
	l := nil;
	cargarArbol(a);
	writeln('Ingrese un valor x');
	readln(x);
	crearLista(a, x, l);
	imprimirLista(l);
	writeln('Ingrese un valor D');
	readln(d);
	if (buscarDni(a, d))then 
		writeln('El dni se encuentra en el arbol')
	else
		writeln('El dni no se encuentra en el arbol');
end.
