package finaljulio;

import PaqueteLectura.Lector;

public class FinalJulio {

    public static void main(String[] args) {
        Universidad universidad = new Universidad(1000);
        
        System.out.println("Ingrese el nombre del alumno ");
        String nombre = Lector.leerString();
        System.out.println("Ingrese el apellido del alumno ");
        String apellido = Lector.leerString();
        System.out.println("Ingrese el legajo del alumno ");
        String legajo = Lector.leerString();
        System.out.println("Ingrese la cantidad de M examenes del alumno ");
        int m = Lector.leerInt();
        Alumno a1 = new Alumno(nombre, apellido, legajo, m);
        
        System.out.println("Ingrese el nombre del alumno ");
        nombre = Lector.leerString();
        System.out.println("Ingrese el apellido del alumno ");
        apellido = Lector.leerString();
        System.out.println("Ingrese el legajo del alumno ");
        legajo = Lector.leerString();
        System.out.println("Ingrese la cantidad de M examenes del alumno ");
        m = Lector.leerInt();
        Alumno a2 = new Alumno(nombre, apellido, legajo, m);
        
        universidad.agregarAlumno(a1);
        universidad.agregarAlumno(a2);
        
        a1.agregarExamen(new Examen(4, 2025, 4, "escrito"));
        a1.agregarExamen(new Examen(5, 2025, 8, "trabajo integrador"));
        
        a2.agregarExamen(new Examen(4, 2025, 4, "escrito"));
        a2.agregarExamen(new Examen(7, 2025, 10, "escrito"));
        
        System.out.println("cant examenes mes " + 4 + "anio 2025 y escrito" + universidad.cantExamenesPeriodo(4, 2025, "escrito"));
        
        System.out.println(universidad.alumnoMejorPromedio().toString());
    }
    
}
