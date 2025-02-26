<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String idLlibre = request.getParameter("id");
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String titol = "";
    String isbn = "";
    int anyPublicacio = 0;
    if (idLlibre != null) {
        try {
            String url = "jdbc:mysql://192.168.49.185:3306/llibres?useSSL=false&serverTimezone=UTC";
            String usuari = "usuari";
            String contrasenya = "usuari123";
            conn = DriverManager.getConnection(url, usuari, contrasenya);

            String query = "SELECT titol, isbn, any_publicacio FROM llibres WHERE id = ?";
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, Integer.parseInt(idLlibre));
            rs = stmt.executeQuery();

            if (rs.next()) {
                titol = rs.getString("titol");
                isbn = rs.getString("isbn");
                anyPublicacio = rs.getInt("any_publicacio");
            }
        } catch (Exception e) {
            out.println("Error al recuperar el llibre: " + e.getMessage());
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) {}
            if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
            if (conn != null) try { conn.close(); } catch (SQLException e) {}
        }
    }
%>
<!DOCTYPE html>
<html lang="ca">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar Llibre</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container my-5">
        <h1 class="text-center mb-4">Modificar Llibre</h1>

        <form action="ModificarLlibreServlet" method="post">
            <input type="hidden" name="id" value="<%= idLlibre %>">
            <div class="mb-3">
                <label for="titol" class="form-label">Títol</label>
                <input type="text" class="form-control" id="titol" name="titol" value="<%= titol %>" required>
            </div>
            <div class="mb-3">
                <label for="isbn" class="form-label">ISBN</label>
                <input type="text" class="form-control" id="isbn" name="isbn" value="<%= isbn %>" required>
            </div>
            <div class="mb-3">
                <label for="any_publicacio" class="form-label">Any de publicació</label>
                <input type="number" class="form-control" id="any_publicacio" name="any_publicacio" value="<%= anyPublicacio %>" required>
            </div>
            <button type="submit" class="btn btn-primary">Modificar Llibre</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
