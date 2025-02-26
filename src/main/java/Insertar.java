import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet que maneja la inserción de nuevos libros en la base de datos.
 */
@WebServlet("/Insertar")
public class Insertar extends HttpServlet {

    /**
     * Maneja las solicitudes POST para insertar un nuevo libro en la base de datos.
     *
     * @param request  el objeto HttpServletRequest que contiene la solicitud del cliente
     * @param response el objeto HttpServletResponse que contiene la respuesta del servlet
     * @throws ServletException si ocurre un error específico del servlet
     * @throws IOException      si ocurre un error de entrada/salida
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String titol = request.getParameter("titol");
        String isbn = request.getParameter("isbn");
        int anyPublicacio = Integer.parseInt(request.getParameter("any_publicacio"));

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = Connexio.obtenirConnexio();
            String query = "INSERT INTO llibres (titol, isbn, any_publicacio) VALUES (?, ?, ?)";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, titol);
            stmt.setString(2, isbn);
            stmt.setInt(3, anyPublicacio);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("llibreria.jsp");
            } else {
                response.getWriter().println("No es va poder afegir el llibre.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error al inserir el llibre: " + e.getMessage());
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}