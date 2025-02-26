<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ca">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminar Llibre</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="card shadow">
            <div class="card-header bg-danger text-white">
                <h3 class="text-center">Eliminar Llibre</h3>
            </div>
            <div class="card-body">
                <form action="Eliminar" method="post">
                    <div class="mb-3">
                        <label for="id" class="form-label">ID del Llibre</label>
                        <input type="number" class="form-control" id="id" name="id" placeholder="Introdueix l'ID del llibre" required>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-danger">Eliminar</button>
                        <a href="llibreria.jsp" class="btn btn-secondary">Cancel·la</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
