package finaljulio;

public class Universidad {
    private Alumno alumnos[];
    private int n;
    private int cantAlumnos;
    
    public Universidad(int n) {
        this.alumnos = new Alumno[n];
        this.cantAlumnos = 0;
    }
    
    public void agregarAlumno(Alumno alumno) {
        //asumimos que hay lugar
        this.alumnos[this.cantAlumnos] = alumno;
        this.cantAlumnos++;
    }
    
    public Alumno buscarAlumno(String legajo) {
        boolean encontre = false;
        int i = 0;
        Alumno alumno = null;
        while (i < this.cantAlumnos && !encontre) {
            if (this.alumnos[i].getLegajo().equals(legajo)) {
                encontre = true;
                alumno = this.alumnos[i];
            }
        }
        return alumno;
    }
    
    public void agregarExamen(String legajo, Examen examen) {
        Alumno alumno = buscarAlumno(legajo);
       if (alumno != null) {
           alumno.agregarExamen(examen);
       }
    }
    
    public Alumno alumnoMejorPromedio() {
        double max = -1;
        Alumno alumnoMax = null;
        for (int i=0; i<this.cantAlumnos; i++) {
            if (this.alumnos[i].promedio() > max) {
                max = this.alumnos[i].promedio();
                alumnoMax = this.alumnos[i];
            }
        }
        return alumnoMax;
    }
    
    public int cantExamenesPeriodo(int mes, int anio, String modalidad) {
        int cant = 0;
        for (int i=0; i<this.cantAlumnos; i++) {
            cant = cant + this.alumnos[i].cantExamenesPeriodo(mes, anio, modalidad);
        }
        return cant;
    }
}
