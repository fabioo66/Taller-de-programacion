package finaloctubre;

public class Paciente {
    private int dni;
    private String nombre;
    private String obraSocial;

    public Paciente(int dni, String nombre, String obraSocial) {
        this.dni = dni;
        this.nombre = nombre;
        this.obraSocial = obraSocial;
    }
    
    public int getDni() {
        return this.dni;
    }
}
