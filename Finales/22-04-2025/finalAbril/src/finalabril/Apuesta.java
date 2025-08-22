package finalabril;

public class Apuesta {
    private String nombreCliente;
    private String dni;
    private int idPartido;
    private String apuesta;
    private double montoApostado;

    public Apuesta(String nombreCliente, String dni, int idPartido, String apuesta, double montoApostado) {
        this.nombreCliente = nombreCliente;
        this.dni = dni;
        this.idPartido = idPartido;
        this.apuesta = apuesta;
        this.montoApostado = montoApostado;
    }
    
    public String getApuesta() {
        return this.apuesta;
    }
    
    public int getIdPartido() {
        return this.idPartido;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public String getDni() {
        return dni;
    }

    public double getMontoApostado() {
        return montoApostado;
    }
    
    
}
