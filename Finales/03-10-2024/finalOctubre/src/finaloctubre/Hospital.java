package finaloctubre;

public class Hospital {
    private String nombre;
    private String direccion;
    private Cama[][] camas;

    public Hospital(String nombre, String direccion) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.camas = new Cama[10][20];

        int idCama = 1;
        for (int i = 0; i < 10; i++) {
            for (int j = 0; j < 20; j++) {
                this.camas[i][j] = new Cama(idCama);
                idCama++;
            }
        }
    }

    public void ingresarPaciente(Paciente paciente, int piso, int numCama) {
        Cama cama = this.camas[piso-1][numCama-1]; // piso 1..10, cama 1..20
        if (!cama.isOcupada()) {
            cama.ocupar(paciente);
        } else {
            System.out.println("La cama " + numCama + " del piso " + piso + " ya está ocupada.");
        }
    }

    public void darDeAltaPaciente(int dni) {
        boolean encontre = false;
        for (int i = 0; i < 10 && !encontre; i++) {
            for (int j = 0; j < 20 && !encontre; j++) {
                Cama cama = this.camas[i][j];
                if (cama.isOcupada() && cama.getPaciente().getDni() == dni) {
                    cama.liberar();
                    encontre = true;
                }
            }
        }
    }

    public void incrementarDias() {
        for (int i = 0; i < 10; i++) {
            for (int j = 0; j < 20; j++) {
                if (camas[i][j].isOcupada()) {
                    camas[i][j].incrementarDia();
                }
            }
        }
    }

    public int cantPisosLlenos() {
        int cantTotal = 0;
        for (int i = 0; i < 10; i++) {
            int ocupadas = 0;
            for (int j = 0; j < 20; j++) {
                if (camas[i][j].isOcupada()) {
                    ocupadas++;
                }
            }
            if (ocupadas == 20) {
                cantTotal++;
            }
        }
        return cantTotal;
    }
}
