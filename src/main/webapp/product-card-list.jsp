
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.e_commerc_mynew.dto.ProductDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center mb-4">Our Products</h1>

    <%
        // Fetch the product list passed from the servlet
        List<ProductDTO> productList = (List<ProductDTO>) request.getAttribute("productList");
        if (productList != null && !productList.isEmpty()) {
    %>
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
        <%
            for (ProductDTO product : productList) {
        %>
        <div class="col">
            <div class="card h-100">
                <!-- Product Image -->
                <img src="<%= product.getImage_path() %>" class="card-img-top" alt="<%= product.getProductName() %>" style="height: 200px; object-fit: cover;">

                <div class="card-body">
                    <!-- Product Name -->
                    <h5 class="card-title"><%= product.getProductName() %></h5>

                    <!-- Product Description -->
                    <p class="card-text text-muted"><%= product.getProductDescription() %></p>

                    <!-- Product Price -->
                    <p class="fw-bold">Price: $<%= product.getProductPrice() %></p>

                    <!-- Product Quantity -->
                    <p>Available: <%= product.getProductQuantity() %> units</p>

                    <!-- Action Button -->
                    <a href="product-details?productId=<%= product.getProduct_id() %>" class="btn btn-primary">View Details</a>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
    <% } else { %>
    <div class="alert alert-warning text-center" role="alert">
        No products available at the moment.
    </div>
    <% } %>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

