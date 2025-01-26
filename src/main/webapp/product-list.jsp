<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.e_commerc_mynew.dto.ProductDTO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Management</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <style>
        .btn-home {
            position: absolute;
            top: 40px;
            left: 30px;
            background-color: #a8a2a6;
            border: none;
            padding: 12px;
            border-radius: 50%;
            transition: all 0.3s ease;
            z-index: 1000;
        }
        .btn-home i {
            color: white;
            font-size: 28px; /* Adjust icon size */
        }
        .btn-home:hover {
            background-color: #6b5569;
            transform: scale(1.1);
        }
    </style>
</head>
<body>

<form action="admin-dashboard.jsp" class="text-start mb-4">
    <button type="submit" class="btn btn-home">
        <i class="fas fa-home"></i>
    </button>
</form>

<div class="container mt-4">
    <h1 class="text-center">Product Management</h1>

    <% List<ProductDTO> dataList = (List<ProductDTO>) request.getAttribute("productList");
        if (dataList != null && !dataList.isEmpty()) { %>
    <table class="table table-bordered table-hover">
        <thead class="table-dark">
        <tr>
            <th>Product ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Category ID</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <% for (ProductDTO productDTO : dataList) { %>
        <tr>
            <td class="text-center"><%= productDTO.getProduct_id() %></td>
            <td><%= productDTO.getProductName() %></td>
            <td><%= productDTO.getProductDescription() %></td>
            <td class="text-end">LKR <%= String.format("%.2f", productDTO.getProductPrice()) %></td>
            <td class="text-center"><%= productDTO.getProductQuantity() %></td>
            <td class="text-center"><%= productDTO.getCategory_id() %></td>
            <td class="text-center">
                <!-- Update Button to trigger modal -->
                <button type="button" class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#editProductModal"
                        data-product-id="<%= productDTO.getProduct_id() %>"
                        data-product-name="<%= productDTO.getProductName() %>"
                        data-product-description="<%= productDTO.getProductDescription() %>"
                        data-product-price="<%= productDTO.getProductPrice() %>"
                        data-product-quantity="<%= productDTO.getProductQuantity() %>"
                        data-category-id="<%= productDTO.getCategory_id() %>">
                    Update
                </button>

                <!-- Delete Button -->
                <form action="delete-product-servlet" method="post" onsubmit="return confirm('Are you sure you want to delete this product?');">
                    <input type="hidden" name="id" value="<%= productDTO.getProduct_id() %>">
                    <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                </form>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <% } else { %>
    <div class="alert alert-warning text-center">No products available.</div>
    <% } %>

    <form action="add-product.jsp" class="text-center mt-4">
        <button type="submit" class="btn btn-primary">Add New Product</button>
    </form>
</div>

<!-- Edit Product Modal -->
<div class="modal fade" id="editProductModal" tabindex="-1" aria-labelledby="editProductModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editProductModalLabel">Edit Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="update-product.jsp" method="post">
                    <input type="hidden" name="productId" id="productId">
                    <div class="mb-3">
                        <label for="productName" class="form-label">Name</label>
                        <input type="text" class="form-control" id="productName" name="productName" required>
                    </div>
                    <div class="mb-3">
                        <label for="productDescription" class="form-label">Description</label>
                        <textarea class="form-control" id="productDescription" name="productDescription" rows="3" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="productPrice" class="form-label">Price (LKR)</label>
                        <input type="number" class="form-control" id="productPrice" name="productPrice" step="0.01" required>
                    </div>
                    <div class="mb-3">
                        <label for="productQuantity" class="form-label">Quantity</label>
                        <input type="number" class="form-control" id="productQuantity" name="productQuantity" required>
                    </div>
                    <div class="mb-3">
                        <label for="categoryId" class="form-label">Category ID</label>
                        <input type="number" class="form-control" id="categoryId" name="categoryId" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Save Changes</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- JavaScript to populate modal with data -->
<script>
    var editProductModal = document.getElementById('editProductModal');
    editProductModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget; // Button that triggered the modal
        var productId = button.getAttribute('data-product-id');
        var productName = button.getAttribute('data-product-name');
        var productDescription = button.getAttribute('data-product-description');
        var productPrice = button.getAttribute('data-product-price');
        var productQuantity = button.getAttribute('data-product-quantity');
        var categoryId = button.getAttribute('data-category-id');

        var modal = editProductModal.querySelector('form');
        modal.querySelector('#productId').value = productId;
        modal.querySelector('#productName').value = productName;
        modal.querySelector('#productDescription').value = productDescription;
        modal.querySelector('#productPrice').value = productPrice;
        modal.querySelector('#productQuantity').value = productQuantity;
        modal.querySelector('#categoryId').value = categoryId;
    });
</script>

</body>
</html>
