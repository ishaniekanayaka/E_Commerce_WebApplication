
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 1/24/2025
  Time: 11:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #fbe0ec;
            font-family: 'Arial', sans-serif;
        }
        .container {
            max-width: 800px;
            margin-top: 120px;
        }
        h1 {
            font-size: 2.5rem;
            font-weight: bold;
            margin-bottom: 30px;
            color: #813271;
            text-align: center;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            transition: transform 0.3s ease-in-out;
            margin-bottom: 30px;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .card-body {
            text-align: center;
        }
        .card-title {
            font-size: 1.75rem;
            color: #813271;
        }
        .card-text {
            font-size: 1.2rem;
            color: #424242;
        }
        .btn {
            border-radius: 25px;
            font-weight: bold;
            padding: 12px 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
            margin: 10px;
            font-size: 1rem;
        }
        .btn:hover {
            transform: scale(1.1);
        }
        .btn-primary {
            background: linear-gradient(45deg, #ff80ab, #813271);
            border: none;
            color: white;
        }
        .btn-primary:hover {
            background: linear-gradient(45deg, #734a5b, #813271);
        }
        .btn-danger {
            background: linear-gradient(45deg, #734a5b, #813271);
            border: none;
            color: white;
        }
        .btn-danger:hover {
            background: linear-gradient(45deg, #734a5b, #813271);
        }
        footer {
            margin-top: 50px;
            text-align: center;
            color: #6c757d;
            font-size: 0.9rem;
        }
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

<div class="container">
    <h1>Category Management</h1>

    <!-- Category Management Card -->
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Manage Products</h4>
            <p class="card-text">Easily add, view, or manage Products for your e-commerce platform. Stay organized and up-to-date!</p>


            <div class="d-flex justify-content-center mb-4">
                <form action="product-list" class="me-3">
                    <button type="submit" class="btn btn-danger">View Products</button>
                </form>
                <form action="product.jsp">
                    <button type="submit" class="btn btn-danger">Add Products</button>
                </form>
            </div>
        </div>
    </div>
</div>

<footer>
    &copy; 2024 Category Management. All rights reserved.
</footer>

<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
