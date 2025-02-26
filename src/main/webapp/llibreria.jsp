<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ca">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Llibres - Biblioteca</title>
    <!-- Vincula Bootstrap 5 desde CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Barra de Navegació -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Biblioteca</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Inici</a>
                    </li>
                    <!-- Enlace para Afegir Llibre -->
                    <li class="nav-item">
                        <a class="nav-link" href="afegir_llibre.jsp">Afegir Llibre</a>
                    </li>
                    <!-- Enlace para Modificar Llibre -->
                    <li class="nav-item">
                        <a class="nav-link" href="modificar_llibre.jsp">Modificar Llibre</a>
                    </li>
                    <!-- Enlace para Eliminar Llibre -->
                    <li class="nav-item">
                        <a class="nav-link" href="eliminar.jsp">Eliminar Llibre</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Contingut Principal -->
    <div class="container my-5">
        <h1 class="text-center mb-4">Llista de Llibres</h1>
        <%
            // Configuració de connexió a la base de dades
            String url = "jdbc:mysql://192.168.0.24:3306/llibres?useSSL=false&serverTimezone=UTC";
            String usuari = "usuari";
            String contrasenya = "usuari123";
            Connection connexio = null;
            Statement statement = null;
            ResultSet resultat = null;

            try {
                // Connectar a la base de dades
                Class.forName("com.mysql.cj.jdbc.Driver");
                connexio = DriverManager.getConnection(url, usuari, contrasenya);
                statement = connexio.createStatement();

                // Consulta a la base de dades
                String consultaSQL = "SELECT id, titol, isbn, any_publicacio FROM llibres";
                resultat = statement.executeQuery(consultaSQL);
        %>
        
        <!-- Taula de Llibres -->
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Títol</th>
                    <th>ISBN</th>
                    <th>Any de Publicació</th>
                    <th>Accions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    while (resultat.next()) {
                        int id = resultat.getInt("id");
                        String titol = resultat.getString("titol");
                        String isbn = resultat.getString("isbn");
                        int anyPublicacio = resultat.getInt("any_publicacio");
                %>
                    <tr>
                        <td><%= id %></td>
                        <td><%= titol %></td>
                        <td><%= isbn %></td>
                        <td><%= anyPublicacio %></td>
                        <td>
                            <!-- Botons d'Acció -->
                            <a href="modificar_llibre.jsp?id=<%= id %>" class="btn btn-warning btn-sm">Modificar</a>
                            <a href="eliminar_llibre.jsp?id=<%= id %>" class="btn btn-danger btn-sm">Eliminar</a>
                        </td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <% 
            } catch (Exception e) {
                out.println("<p class='alert alert-danger'>Error en connectar amb la base de dades: " + e.getMessage() + "</p>");
            } finally {
                // Tancar recursos
                if (resultat != null) try { resultat.close(); } catch (SQLException ignore) {}
                if (statement != null) try { statement.close(); } catch (SQLException ignore) {}
                if (connexio != null) try { connexio.close(); } catch (SQLException ignore) {}
            }
        %>
        
    </div>

    <!-- Scripts de Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
