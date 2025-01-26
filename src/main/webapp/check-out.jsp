<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.e_commerc_mynew.dto.CartItemDTO" %>
<%@ page import="lk.ijse.e_commerc_mynew.dto.UserDTO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }
        .navbar-brand {
            font-size: 1.75rem;
            font-weight: bold;
            color: #f0c14b !important;
        }
        .navbar-nav .nav-link {
            color: #fff !important;
        }
        .checkout-container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
        }
        .summary-card {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        .summary-card h4 {
            color: #343a40;
        }
        .place-orderDTO-btn {
            background-color: #28a745;
            color: white;
            text-decoration: none;
            padding: 12px 25px;
            border-radius: 5px;
            display: inline-block;
            font-size: 1.1rem;
        }
        .place-orderDTO-btn:hover {
            background-color: #218838;
        }
        .form-label {
            font-weight: bold;
        }
        .form-control {
            border-radius: 8px;
        }
        .order-item {
            margin-bottom: 15px;
            padding: 10px;
            background-color: #f1f1f1;
            border-radius: 5px;
        }
        .order-item .product-name {
            font-weight: 600;
            color: #333;
        }
        .order-item .product-price {
            color: #007bff;
            font-weight: bold;
        }
        .cart-summary {
            margin-top: 20px;
        }
        .cart-summary h4 {
            font-size: 1.3rem;
        }
        .cart-summary .total {
            font-size: 1.5rem;
            color: #28a745;
            font-weight: bold;
        }
    </style>
</head>
<body>

<%
    List<CartItemDTO> cart = (List<CartItemDTO>) session.getAttribute("cart");
%>

<div class="container">

    <h4 class="text-center">Cart Summary</h4>
    <ul class="list-unstyled">
        <% for (CartItemDTO item : cart) { %>
        <li class="order-item">
            <div class="d-flex justify-content-between">
                <span class="product-name"><%= item.getProductName() %> (x<%= item.getQuantity() %>)</span>
                <span class="product-price">LKR <%= item.getSubtotal() %></span>
            </div>
        </li>
        <% } %>
    </ul>
</div>

<div class="container">
    <div class="checkout-container">
        <h1 class="text-center mb-4">Checkout</h1>
        <form action="order-confirmation.jsp" method="post">
            <div class="row">
                <!-- Billing Details -->
                <div class="col-md-6">
                    <h3>Billing Details</h3>
                    <div class="mb-3">
                        <label for="billingName" class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="billingName" name="billingName" required>
                    </div>
                    <div class="mb-3">
                        <label for="billingEmail" class="form-label">Email</label>
                        <input type="email" class="form-control" id="billingEmail" name="billingEmail" required>
                    </div>
                    <div class="mb-3">
                        <label for="billingPhone" class="form-label">Phone</label>
                        <input type="tel" class="form-control" id="billingPhone" name="billingPhone" required>
                    </div>
                    <div class="mb-3">
                        <label for="billingAddress" class="form-label">Address</label>
                        <textarea class="form-control" id="billingAddress" name="billingAddress" rows="3" required></textarea>
                    </div>
                </div>
            </div>

            <!-- Order Summary -->
            <div class="cart-summary">
                <h4>Order Summary</h4>
                <div class="summary-card">
                    <%
                        double total = 0;
                        if (cart != null) {
                            for (CartItemDTO item : cart) {
                                total += item.getSubtotal();
                    %>
                    <div class="d-flex justify-content-between mb-3">
                        <span><%= item.getProductName() %> (x<%= item.getQuantity() %>)</span>
                        <span>LKR <%= item.getSubtotal() %></span>
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <p>Your cart is empty.</p>
                    <%
                        }
                    %>
                    <hr>
                    <div class="d-flex justify-content-between">
                        <h4>Total:</h4>
                        <h4 class="total">LKR <%= total %></h4>
                    </div>
                </div>
            </div>

            <!-- Place Order Button -->
            <div class="text-end mt-4">
                <button type="submit" class="place-orderDTO-btn">Place Order</button>
            </div>
        </form>
    </div>
</div>

<!-- Bootstrap JS Bundle (includes Popper) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
