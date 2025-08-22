package finalfebrero;

public class Empresa {
    private String nombre;
    private String direccion;
    private Oficina oficinas[][];
    
    public Empresa(String nombre, String direccion) {
        this.nombre = nombre;
        this.direccion = direccion;
        //java inicializa todas las posiciones en null
        this.oficinas = new Oficina[3][10];
    }
    
    public void alquilarOficina(Persona persona, double montoDiario, int p, int l) {
        //Asumimos que hay lugar
        this.oficinas[p-1][l-1] = new Oficina(persona, montoDiario);
    }
    
    public void liberarOficina(String dni) {
        int i = 0;
        boolean encontre = false;

        while (i < 3 && !encontre) {
            int j = 0;
            while (j < 10 && !encontre) {
                if (this.oficinas[i][j] != null &&
                    this.oficinas[i][j].getPersona().getDni().equals(dni)) {
                    this.oficinas[i][j] = null;
                    encontre = true;
                }
                j++;
            }
            i++;
        }

        if (encontre) {
            System.out.println("Se borró la oficina del DNI " + dni);
        } else {
            System.out.println("No se encontró el DNI " + dni);
        }
    }

    
    public void incrementarMontoDiario() {
        for (int i=0; i<3; i++) {
            for (int j=0; j<10; j++) {
                if (this.oficinas[i][j] != null) {
                    if (i == 0) {
                        this.oficinas[i][j].incremenarMontoDiario(0.05);
                    } else {
                        if (i == 1) {
                            this.oficinas[i][j].incremenarMontoDiario(0.1);
                        } else {
                            this.oficinas[i][j].incremenarMontoDiario(0.15);
                        }
                    }
                }
            }
        }
    }
    
    public int cantOficinasAlquiladas(int piso) {
        int cant = 0;
        for (int j=0; j<10; j++) {
            if (this.oficinas[piso-1][j] != null) {
                cant++;
            }
        }
        return cant;
    }
}
