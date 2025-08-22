{Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la
información de los autos en venta. Implementar un programa que:
a) Lea la información de los autos (patente, año de fabricación (2010..2018), marca y
modelo) y los almacene en dos estructuras de datos:
i. Una estructura eficiente para la búsqueda por patente.
ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar todos juntos los autos pertenecientes a ella.
b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.
c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.
d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.
e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.
f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente.}

program ejercicio2;
type
    aRango = 2010..2018;

    auto = record 
        patente: string;
        anio: aRango;
        marca: string;
        modelo: string;
    end;

    arbolPatente = ^nodoPatente;
    nodoPatente = record 
        dato: auto;
        HI: arbolPatente;
        HD: arbolPatente;
    end;

    listaAutos = ^nodoAutos;
    nodoAutos = record 
        dato: auto;
        sig: listaAutos;
    end;

    data = record 
        marca: string;
        lista: lista;
    end;

    arbolLista = ^nodoLista;
    nodoLista = record 
        dato: data;
        HI: arbolLista;
        HD: arbolLista;
    end;

procedure leerAuto(var a: auto);
begin
    writeln('Ingrese la patente del auto');
    readln(a.patente);
    if (a.patente <> 'zzz') then begin
        writeln('Ingrese el año de fabricacion del auto');
        readln(a.anio);
        writeln('Ingrese la marca del auto');
        readln(a.marca);
        writeln('Ingrese el modelo del auto');
        readln(a.modelo);
    end;
end;

procedure insertarPorPatente(var aP: arbolPatente; a: auto);
begin
    if (aP = nil) then begin
        new(aP);
        aP^.dato := a;
        aP^.HI := nil;
        aP^.HD := nil 
    end
    else if (a.patente <= aP^.dato.patente) then 
        insertarPorPatente(ap^.HI, a)
    else 
        insertarPorPatente(ap^.HD, a);
end;

procedure agregarAdelante(var l: lista; d: data);
var 
    nue: lista;
begin
    new(nue);
    nue^.dato := d;
    nue^.sig := nil;
    l := nue;
end;

procedure insertarPorMarca(var aL: arbolLista; d: data);
begin 
    if (aL = nil) then begin
        new(aL);
        aL^.dato := d;
        aL^.dato := nil;
        agregarAdelante(l, d);
        aL^.HI := nil;
        aL^.HD := nil
    end 
    else if (aL^.dato.marca = d.marca) then
        agregarAdelante(l, d)
    else if (d.marca <= aL^.dato.marca) then 
        insertarPorMarca(aL^.HI, d)
    else 
        insertarPorMarca(aL^.HD, d);
end;