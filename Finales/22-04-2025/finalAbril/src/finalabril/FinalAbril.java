/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package finalabril;

/**
 *
 * @author fabio
 */
public class FinalAbril {

    public static void main(String[] args) {
        Agencia agencia = new Agencia();
        
        // Agregar partidos
        int id1 = agencia.agregarPartido(new Partido("Boca", "River", "", 1.5, 2.0, 3.0));
        int id2 = agencia.agregarPartido(new Partido("Racing", "Independiente", "", 1.8, 2.5, 2.8));
        
        // Agregar apuestas
        agencia.agregarApuesta(new Apuesta("Juan Perez", "12345678", id1, "victoria local", 1000));
        agencia.agregarApuesta(new Apuesta("Maria Gomez", "87654321", id1, "empate", 500));
        agencia.agregarApuesta(new Apuesta("Luis Lopez", "45678912", id2, "victoria visitante", 2000));
        
        // Ingresar resultados
        agencia.ingresarResultado(id1, "victoria local");
        agencia.ingresarResultado(id2, "victoria visitante");
        
        // Cerrar apuestas e imprimir ganadores
        System.out.println(agencia.cerrarApuestas());
        
    }

}
