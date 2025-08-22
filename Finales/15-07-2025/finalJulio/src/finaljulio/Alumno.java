package finaljulio;

public class Alumno {
    private String nombre;
    private String apellido;
    private String legajo;
    private Examen examenes[];
    private int m;
    private int cantExamenes;

    public Alumno(String nombre, String apellido, String legajo, int m) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.legajo = legajo;
        this.examenes = new Examen[m];
        this.cantExamenes = 0;
    }
    
    public String getLegajo() {
        return this.legajo;
    }
    
    public void agregarExamen(Examen examen) {
        //asumimos que hay lugar
        this.examenes[this.cantExamenes] = examen;
        this.cantExamenes++;
    }
    
    public int cantExamenesPeriodo(int mes, int anio, String modalidad) {
        int cant = 0;
        for (int i=0; i<this.cantExamenes; i++) {
            Examen examenActual = this.examenes[i];
            if (examenActual.getMes() == mes && examenActual.getAnio() == anio && examenActual.getModalidad() == modalidad) {
                cant++;
            }
        }
        return cant;
    }
    
    public double promedio() {
        if (this.cantExamenes != 0){
            double suma = 0;
            for (int i = 0; i<this.cantExamenes; i++) {
                suma = suma + this.examenes[i].getCalificacion();
            }
            return suma/this.cantExamenes;
        }
        return 0;
    }

    @Override
    public String toString() {
        return "Alumno{" + "nombre=" + nombre + ", apellido=" + apellido + ", legajo=" + legajo + ", examenes=" + examenes + ", m=" + m + ", cantExamenes=" + cantExamenes + '}';
    }
}
