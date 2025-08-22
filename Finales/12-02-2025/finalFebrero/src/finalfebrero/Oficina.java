package finalfebrero;

public class Oficina {
    private boolean estaAlquilada;
    private Persona persona;
    private double montoDiario;
    
    public Oficina() {
        this.estaAlquilada = false;
        this.montoDiario = 0;
    }
    
    public Oficina(Persona persona, double montoDiario) {
        this.estaAlquilada = true;
        this.montoDiario = montoDiario;
        this.persona = persona;
    }
    
    public Persona getPersona() {
        return this.persona;
    }
    
    public double getMontoDiario() {
        return this.montoDiario;
    }
    
    public void setMontoDiario(double montoDiario) {
        this.montoDiario = montoDiario;
    }
    
    public void incremenarMontoDiario(double porcentaje) {
        this.montoDiario = this.montoDiario + (this.montoDiario * porcentaje);
    }
}
