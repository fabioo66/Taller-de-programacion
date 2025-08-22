
package finaljulio;

public class Examen {
    private int mes;
    private int anio;
    private double calificacion;
    private String modalidad;

    public Examen(int mes, int anio, double calificacion, String modalidad) {
        this.mes = mes;
        this.anio = anio;
        this.calificacion = calificacion;
        this.modalidad = modalidad;
    }

    public int getMes() {
        return mes;
    }

    public int getAnio() {
        return anio;
    }

    public double getCalificacion() {
        return calificacion;
    }

    public String getModalidad() {
        return modalidad;
    }    
}
