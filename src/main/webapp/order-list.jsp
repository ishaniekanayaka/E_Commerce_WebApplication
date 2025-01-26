
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.e_commerc_mynew.dto.OrderDTO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Management</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }

        .container {
            max-width: 900px;
            margin-top: 40px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #333;
            font-size: 2.5rem;
            text-align: center;
            margin-bottom: 30px;
        }

        .btn {
            border-radius: 30px;
            font-weight: 600;
            padding: 10px 20px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }


        .btn-secondary {
            background-color: #6c757d;
            border: none;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        table {
            border-collapse: collapse;
        }

        th {
            text-align: center;
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
    <form action="index.jsp" class="mb-3">
        <button type="submit" class="btn btn-secondary">Home</button>
    </form>

    <h1>Order Management</h1>

    <%
        List<OrderDTO> orderList = (List<OrderDTO>) request.getAttribute("orderList");
        if (orderList != null && !orderList.isEmpty()) {
    %>
    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle">
            <thead class="table-dark">
            <tr>
                <th>Order ID</th>
                <th>User ID</th>
                <th>Total Price</th>
                <th>Order Date</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (OrderDTO order : orderList) {
            %>
            <tr>
                <td class="text-center"><%= order.getOrderId() %></td>
                <td class="text-center"><%= order.getUserId() %></td>
                <td class="text-end">LKR <%= String.format("%.2f", order.getTotalPrice()) %></td>
                <td class="text-center"><%= order.getDate() %></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
    <% } else { %>
    <div class="alert alert-warning mt-4" role="alert">
        No orders available.
    </div>
    <% } %>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
