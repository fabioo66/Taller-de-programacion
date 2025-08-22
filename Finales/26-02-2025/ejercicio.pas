program parcial;
type
    iRango = 1..17;
    
    egresado = record
        nombre: string;
        legajo: integer;
        id: iRango;
        promedio: real;
    end;
    
    arbol = ^nodoArbol;
    nodoArbol = record 
        dato: egresado;
        HI: arbol;
        HD: arbol;
    end;
    
    arbolVector = ^nodoArbolVector;
    nodoArbolVector = record
        dato: egresado;
        HI: arbolVector;
        HD: arbolVector;
    end;
    
    vector = array [iRango] of arbolVector;

{---------------- Lectura ----------------}
procedure leerEgresado(var e: egresado);
begin
    writeln('Ingrese el promedio');
    readln(e.promedio);
    if (e.promedio >= 0) then begin 
        writeln('Ingrese el nombre');
        readln(e.nombre);
        writeln('Ingrese el legajo');
        readln(e.legajo);
        writeln('Ingrese el id de facultad (1..17)');
        readln(e.id);
    end;
end;

{---------------- Árbol por legajo ----------------}
procedure insertarEgresado(var a: arbol; e: egresado);
begin
    if (a = nil) then begin
        new(a);
        a^.dato := e;
        a^.HI := nil;
        a^.HD := nil
    end
    else begin
        if(e.legajo < a^.dato.legajo) then
            insertarEgresado(a^.HI, e)
        else
            insertarEgresado(a^.HD, e);
    end;
end;

procedure cargarArbol(var a: arbol);
var
    e: egresado;
begin
    leerEgresado(e);
    if (e.promedio >= 0) then begin   { ✅ ahora corta con promedio negativo }
        insertarEgresado(a, e);
        cargarArbol(a);
    end;
end;

{---------------- Vector de árboles por promedio ----------------}
procedure inicializarVector(var v: vector);
var 
    i: integer;
begin
    for i := 1 to 17 do 
        v[i] := nil;
end;

procedure insertarEgresadoPromedio(var a: arbolVector; e: egresado);
begin
    if (a = nil) then begin
        new(a);
        a^.dato := e;
        a^.HI := nil;
        a^.HD := nil
    end
    else begin
        if(e.promedio < a^.dato.promedio) then
            insertarEgresadoPromedio(a^.HI, e)
        else
            insertarEgresadoPromedio(a^.HD, e);
    end;
end;

procedure cargarArbolVector(a: arbol; var v: vector);
begin
    if (a <> nil) then begin
        cargarArbolVector(a^.HI, v);
        insertarEgresadoPromedio(v[a^.dato.id], a^.dato); { ✅ nodo en medio }
        cargarArbolVector(a^.HD, v);
    end;
end;

{---------------- Buscar mejor promedio ----------------}
function mejorEgresado(a: arbolVector): egresado;
begin
    { se asume que a <> nil }
    if (a^.HD = nil) then
        mejorEgresado := a^.dato
    else
        mejorEgresado := mejorEgresado(a^.HD);
end;

procedure mejorPromedio(v: vector; id: integer);
var
    e: egresado;
begin
    if (v[id] <> nil) then begin
        e := mejorEgresado(v[id]);
        writeln('El alumno con mejor promedio de la facultad ', id, ' es ', e.nombre, ' con promedio ', e.promedio:0:2);
    end
    else
        writeln('No hay alumnos registrados en la facultad ', id);
end;

{---------------- Programa principal ----------------}
var
    a: arbol;
    v: vector;
    id: integer;
begin
    a := nil;
    cargarArbol(a);             { a) carga árbol por legajo }
    inicializarVector(v);
    cargarArbolVector(a, v);    { b) genera vector de árboles por promedio }
    writeln('Ingrese un id de facultad');
    readln(id);
    mejorPromedio(v, id);       { c) muestra mejor promedio de esa facultad }
end.
