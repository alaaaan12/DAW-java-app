import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet que maneja la consulta de libros en la base de datos.
 */
@WebServlet("/consulta")
public class Consulta extends HttpServlet {

    /**
     * Maneja las solicitudes GET para consultar los libros en la base de datos.
     *
     * @param request  el objeto HttpServletRequest que contiene la solicitud del cliente
     * @param response el objeto HttpServletResponse que contiene la respuesta del servlet
     * @throws ServletException si ocurre un error específico del servlet
     * @throws IOException      si ocurre un error de entrada/salida
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Establir la connexió amb la base de dades mitjançant Connexio
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        PrintWriter out = response.getWriter();

        response.setContentType("text/html;charset=UTF-8");

        try {
            // Obtenir connexió amb la base de dades
            conn = Connexio.obtenirConnexio();
            
            // Consulta SQL per obtenir els llibres
            String query = "SELECT id, titol, isbn FROM llibres";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();

            // Generar la resposta HTML
            out.println("<html><head><title>Llibres</title></head><body>");
            out.println("<h1>Llibres a la Base de Dades</h1>");
            out.println("<table border='1'><tr><th>ID</th><th>Títol</th><th>ISBN</th></tr>");

            // Iterar a través dels resultats de la consulta i mostrar-los
            while (rs.next()) {
                int id = rs.getInt("id");
                String titol = rs.getString("titol");
                String isbn = rs.getString("isbn");
                out.println("<tr><td>" + id + "</td><td>" + titol + "</td><td>" + isbn + "</td></tr>");
            }

            out.println("</table>");
            out.println("</body></html>");

        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<h2>Error en la connexió amb la base de dades</h2>");
        } finally {
            // Tancar recursos
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }}
}
}