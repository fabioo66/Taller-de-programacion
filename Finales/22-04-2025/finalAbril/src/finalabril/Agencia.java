package finalabril;

public class Agencia {
    private Partido partidos[];
    private Apuesta apuestas[];
    private int cantPartidos;
    private int cantApuestas;
    
    public Agencia() {
        this.partidos = new Partido[20];
        this.apuestas = new Apuesta[100];
        this.cantPartidos = 0;
        this.cantApuestas = 0;
    }
    
    public int agregarPartido(Partido partido) {
        if (this.cantPartidos < 20) {
            this.partidos[this.cantPartidos] = partido;
            this.cantPartidos++;
            partido.setId(cantPartidos);
            return this.cantPartidos;
        } else {
            return -1;
        }
    }
    
    public void agregarApuesta(Apuesta apuesta) {
        if (this.cantApuestas < 100) {
            this.apuestas[this.cantApuestas] = apuesta;
            this.cantApuestas++;
        }
    }
    
    public void ingresarResultado(int id, String resultado) {
        if (id > 0 && id <= cantPartidos && this.partidos[id-1] != null) {
            this.partidos[id-1].setResultado(resultado);
        }
    }
    
    //if (this.partidos[this.apuestas[i].getIdPartido()-1].getResultado().equals(this.apuestas))
    
    public String cerrarApuestas() {
        String aux = "";
        for(int i=0; i<this.cantApuestas; i++) {
            Partido partidoActual = this.partidos[this.apuestas[i].getIdPartido()-1];
            Apuesta apuestaActual = this.apuestas[i];
            if (partidoActual.getResultado().equals(apuestaActual.getApuesta())) {
                if (apuestaActual.getApuesta().equals("victoria local")) {
                    aux+= "Nombre " + apuestaActual.getNombreCliente() + " dni " + apuestaActual.getDni() + " dinero ganado " + apuestaActual.getMontoApostado() * partidoActual.getPagoLocal() + "\n";
                } else {
                    if (apuestaActual.getApuesta().equals("victoria visitante")) {
                        aux+= "Nombre " + apuestaActual.getNombreCliente() + " dni " + apuestaActual.getDni() + " dinero ganado " + apuestaActual.getMontoApostado() * partidoActual.getPagoVisitante() + "\n";
                    } else {
                        aux+= "Nombre " + apuestaActual.getNombreCliente() + " dni " + apuestaActual.getDni() + " dinero ganado " + apuestaActual.getMontoApostado() * partidoActual.getPagoEmpate() + "\n";
                    }
                }
                
            }
        }
        return aux;
    }
}
