<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ca">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Afegir Llibre</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container my-5">
        <h1 class="text-center mb-4">Afegir Llibre</h1>

        <form action="AfegirLlibreServlet" method="post">
            <div class="mb-3">
                <label for="titol" class="form-label">Títol</label>
                <input type="text" class="form-control" id="titol" name="titol" required>
            </div>
            <div class="mb-3">
                <label for="isbn" class="form-label">ISBN</label>
                <input type="text" class="form-control" id="isbn" name="isbn" required>
            </div>
            <div class="mb-3">
                <label for="any_publicacio" class="form-label">Any de publicació</label>
                <input type="number" class="form-control" id="any_publicacio" name="any_publicacio" required>
            </div>
            <button type="submit" class="btn btn-primary">Afegir Llibre</button>
        </form>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
