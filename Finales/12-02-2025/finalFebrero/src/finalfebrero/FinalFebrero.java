package finalfebrero;

import PaqueteLectura.Lector;

public class FinalFebrero {

    public static void main(String[] args) {
        Empresa empresa = new Empresa("Jorge alquileres", "Pedro hita");
        
        empresa.alquilarOficina(new Persona("123", "Fabio"), 5000, 1, 2);
        empresa.alquilarOficina(new Persona("321", "Cape"), 1000, 2, 10);
        empresa.alquilarOficina(new Persona("456", "Santi"), 3000, 1, 7);
        empresa.alquilarOficina(new Persona("789", "Nico"), 4000, 1, 5);
        
        empresa.incrementarMontoDiario();
        
        System.out.println(empresa.cantOficinasAlquiladas(3));
        
        System.out.println("Ingrese el dni de la oficina a borrar");
        String dni = Lector.leerString();
        empresa.liberarOficina(dni);
    }
    
}
