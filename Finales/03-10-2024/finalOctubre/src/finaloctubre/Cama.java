package finaloctubre;

public class Cama {
    private int id;
    private boolean ocupada;
    private Paciente paciente;
    private int cantDias;

    public Cama(int id) {
        this.id = id;
        this.ocupada = false;
        this.paciente = null;
        this.cantDias = 0;
    }

    public void ocupar(Paciente paciente) {
        this.paciente = paciente;
        this.ocupada = true;
        this.cantDias = 0;
    }

    public void liberar() {
        this.paciente = null;
        this.ocupada = false;
        this.cantDias = 0;
    }

    public void incrementarDia() {
        if (ocupada) {
            this.cantDias++;
        }
    }

    public boolean isOcupada() {
        return ocupada;
    }

    public Paciente getPaciente() {
        return paciente;
    }

    public int getId() {
        return id;
    }

    public int getCantDias() {
        return cantDias;
    }
}
