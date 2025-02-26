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
 * Servlet que maneja la eliminación de libros en la base de datos.
 */
@WebServlet("/Eliminar")
public class Eliminar extends HttpServlet {

    /**
     * Maneja las solicitudes POST para eliminar un libro de la base de datos.
     *
     * @param request  el objeto HttpServletRequest que contiene la solicitud del cliente
     * @param response el objeto HttpServletResponse que contiene la respuesta del servlet
     * @throws ServletException si ocurre un error específico del servlet
     * @throws IOException      si ocurre un error de entrada/salida
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = Connexio.obtenirConnexio();
            String query = "DELETE FROM llibres WHERE id = ?";
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, id);

            int rowsDeleted = stmt.executeUpdate();
            if (rowsDeleted > 0) {
                response.sendRedirect("llibreria.jsp");
            } else {
                response.getWriter().println("No es va poder eliminar el llibre.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error en eliminar el llibre: " + e.getMessage());
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
