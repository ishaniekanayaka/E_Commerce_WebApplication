
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.e_commerc_mynew.dto.CategoryDTO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category Management</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f9fafc;
            font-family: 'Arial', sans-serif;
        }

        h1 {
            font-size: 2.5rem;
            color: #333;
            font-weight: bold;
        }

        .container {
            max-width: 900px;
            margin-top: 40px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        table {
            border-collapse: collapse;
        }

        th {
            text-align: center;
        }

        .btn {
            border-radius: 30px;
            font-weight: bold;
            padding: 10px 20px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            background-color: #6c757d;
            border: none;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        .alert-warning {
            border-radius: 8px;
            font-size: 1rem;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container">
    <form action="admin.jsp" class="mb-4">
        <button type="submit" class="btn btn-secondary">Home</button>
    </form>

    <h1 class="text-center mb-4">Category Management</h1>

    <%
        List<CategoryDTO> dataList = (List<CategoryDTO>) request.getAttribute("categoryList");
        if (dataList != null && !dataList.isEmpty()) {
    %>
    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle">
            <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (CategoryDTO categoryDTO : dataList) {
            %>
            <tr>
                <td class="text-center"><%= categoryDTO.getCategoryId() %></td>
                <td><%= categoryDTO.getCategoryName() %></td>
                <td><%= categoryDTO.getDescription() %></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
    <form action="category.jsp" class="text-center mt-4">
        <button type="submit" class="btn btn-primary">Add, Update, or Delete Category</button>
    </form>
    <% } else { %>
    <div class="alert alert-warning" role="alert">
        No categories available.
    </div>
    <% } %>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
