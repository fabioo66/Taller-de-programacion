package finalabril;

public class Partido {
    private String local;
    private String visitante;
    private String resultado;
    private double pagoLocal;
    private double pagoEmpate;
    private double pagoVisitante;
    private int id;

    public Partido(String local, String visitante, String resultado, double pagoLocal, double pagoEmpate, double pagoVisitante) {
        this.local = local;
        this.visitante = visitante;
        this.resultado = resultado;
        this.pagoLocal = pagoLocal;
        this.pagoEmpate = pagoEmpate;
        this.pagoVisitante = pagoVisitante;
    }
    
    public void setResultado(String resultado) {
        this.resultado = resultado;
    }
    
    public String getResultado() {
        return this.resultado;
    }
    
    protected void setId(int id) {
        this.id = id;
    }
    
    public int getId() {
        return this.id;
    }

    public String getLocal() {
        return local;
    }

    public String getVisitante() {
        return visitante;
    }

    public double getPagoLocal() {
        return pagoLocal;
    }

    public double getPagoEmpate() {
        return pagoEmpate;
    }

    public double getPagoVisitante() {
        return pagoVisitante;
    }
    
    
}
