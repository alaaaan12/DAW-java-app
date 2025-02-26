import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Clase que maneja la conexión a la base de datos MariaDB.
 */
public class Connexio {

    private static final String URL = "jdbc:mariadb://192.168.3.86:3306/llibres"; // La URL de la base de dades
    private static final String USER = "usuari";  // Usuari de la base de dades
    private static final String PASSWORD = "usuari123";  // Contrasenya de la base de dades

    /**
     * Estableix una connexió amb la base de dades MariaDB.
     *
     * @return Una connexió a la base de dades o null en cas d'error.
     */
    public static Connection obtenirConnexio() {
        Connection conn = null;
        try {// Carregar el driver de MariaDB
            Class.forName("org.mariadb.jdbc.Driver");// Establir la connexió amb la base de dades
            conn = DriverManager.getConnection(URL, USER, PASSWORD);} catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();}
        return conn;}
}