package finaloctubre;

import PaqueteLectura.Lector;

public class FinalOctubre {

    public static void main(String[] args) {
        Hospital hospital = new Hospital("Garrahan","Pedro Hita 214");
        
        Paciente paciente1 = new Paciente(123, "fabio", "pedro hita");
        Paciente paciente2 = new Paciente(234, "pepe", "pedro hita");
        Paciente paciente3 = new Paciente(345, "jorge", "pedro hita");
        Paciente paciente4 = new Paciente(456, "raul", "pedro hita");
        Paciente paciente5 = new Paciente(678, "hugo", "pedro hita");
        
        hospital.ingresarPaciente(paciente1, 1, 12);
        hospital.ingresarPaciente(paciente2, 1, 10);
        hospital.ingresarPaciente(paciente3, 2, 5);
        hospital.ingresarPaciente(paciente4, 3, 20);
        hospital.ingresarPaciente(paciente5, 2, 12);
        
        hospital.incrementarDias();
        
        System.out.println("La cantidad de pisos llenos es " + hospital.cantPisosLlenos());
        
        System.out.println("Ingrese un dni de un paciente para darlo de alta");
        int dni = Lector.leerInt();
        
        hospital.darDeAltaPaciente(dni);
    }
    
}
