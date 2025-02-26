import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Clase para probar la conexión a la base de datos.
 */
public class ConnexioProva {

    /**
     * Punto de entrada principal para probar la conexión a la base de datos.
     *
     * @param args los argumentos de la línea de comandos
     */
    public static void main(String[] args) {
        String url = "jdbc:mysql://192.168.0.24:3306/llibres";// Substitueix amb la teva URL
        String usuari = "usuari"; // Nom d'usuari de la base de dades
        String contrasenya = "usuari123"; // Contrasenya de la base de dades

        try (Connection connexio = DriverManager.getConnection(url, usuari, contrasenya)) {
            System.out.println("Connexió establerta amb èxit!");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error en connectar amb la base de dades.");
        }
    }
}