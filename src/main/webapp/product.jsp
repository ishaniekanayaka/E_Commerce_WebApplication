<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 1/25/2025
  Time: 12:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f1f3f5;
            font-family: 'Arial', sans-serif;
            color: #b77a92;
            padding-top: 50px;
        }
        /* Home button in the top-left corner */
        .btn-home {
            position: absolute;
            top: 20px;
            left: 20px;
            background-color: #4c2838;
            border: none;
            padding: 12px;
            border-radius: 50%;
            transition: all 0.3s ease;
        }
        .btn-home i {
            color: white;
            font-size: 28px; /* Adjust icon size */
        }
        .btn-home:hover {
            background-color: #2a0522;
            transform: scale(1.1);
        }

        .container {
            margin-top: 20px;
            max-width: 700px;
            background-color: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;

        }
        .container:hover {
            transform: scale(1.05); /* Smooth animation for container hover */
        }

        h1 {
            text-align: center;
            margin-bottom: 32px;
            color: #320729;
            font-family: "Lucida Handwriting";
            font-weight: bold;
        }

        .form-label {
            font-weight: bold;
            color: #6c757d;
        }

        /* Style for the form fields */
        .input-group {
            position: relative;
        }

        .input-group i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #6c757d;
        }

        .form-control {
            padding-left: 35px; /* Space for the icon */
            border-radius: 8px;
            border: 1px solid #ced4da;
            transition: border-color 0.3s ease;
            font-size: 14px; /* Smaller font size */
            padding: 10px; /* Smaller padding for compact form */
        }

        .form-control:focus {
            border-color: #45083a;
            box-shadow: 0 0 0 0.2rem rgb(115, 74, 91);
        }

        /* Box shadow on normal state */
        .form-control {
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .form-select {
            border-radius: 8px;
            border: 1px solid #ced4da;
            font-size: 14px;
        }

        .form-select:focus {
            border-color: #813271;
        }

        .btn-primary {
            font-weight: bold;
            background-color: #813271;
            border: none;
            transition: all 0.3s ease; /* Smooth transition for background, transform, and box-shadow */
            padding: 8px 26px;  /* Increased the horizontal padding for a better button shape */
            font-size: 14px;    /* Smaller font size */
            border-radius: 4px; /* Optional: rounded corners for a smoother look */
            align-items: center;
            position: relative;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Initial subtle box shadow */
        }

        .btn-primary:hover {
            background-color: #734a5b;
            transform: translateY(-4px); /* Button slightly moves upwards */
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.2); /* Larger shadow for a lifted effect */
        }

        .btn-primary:active {
            transform: translateY(2px); /* Slight push down effect when clicked */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Reduced shadow on click */
        }

        /* Animation for button text */
        .btn-primary i {
            transition: transform 0.3s ease;
        }

        .btn-primary:hover i {
            transform: rotate(360deg); /* Rotate icon on hover */
        }


    </style>
</head>
<body>
<!-- Home Button -->
<form action="admin-dashboard.jsp" class="text-start mb-4">
    <button type="submit" class="btn btn-home">
        <i class="fas fa-home"></i>
    </button>
</form>

<div class="container">
    <h1>Add Product</h1>

    <a href="category-name" class="btn btn-primary w-100 mb-4" role="button" style="background-color: #b77a92">Load categories</a>

    <form action="product-new" method="post" enctype="multipart/form-data">
        <div class="mb-3 input-group">
            <i class="fas fa-cogs"></i>
            <input type="text" class="form-control" id="productName" name="productName" placeholder="Enter product name" required>
        </div>
        <div class="mb-3 input-group">
            <i class="fas fa-pencil-alt"></i>
            <textarea class="form-control" id="productDescription" name="productDescription" rows="3" placeholder="Enter product description" required></textarea>
        </div>
        <div class="mb-3 input-group">
            <i class="fas fa-dollar-sign"></i>
            <input type="number" class="form-control" id="productPrice" name="productPrice" step="0.01" placeholder="Enter product price" required>
        </div>
        <div class="mb-3 input-group">
            <i class="fas fa-cubes"></i>
            <input type="number" class="form-control" id="productQuantity" name="productQuantity" placeholder="Enter product quantity" required>
        </div>
        <div class="mb-3">
            <label for="categorySelect" class="form-label">Select Category ID</label>
            <select class="form-select" id="categorySelect" name="category_id" required>
                <option value="">Select Category</option>

            </select>
        </div>
        <div class="mb-3">
            <label for="productImage" class="form-label">Product Image</label>
            <input type="file" class="form-control" id="productImage" name="productImage" accept="image/*" required>
        </div>
        <button type="submit" name="action" value="save" class="btn btn-primary w-40" style="margin-left: 120px">Add Product</button>
        <button type="submit" name="action" value="update" class="btn btn-primary w-20" style="margin-left: 40px">Update Product</button>

    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

