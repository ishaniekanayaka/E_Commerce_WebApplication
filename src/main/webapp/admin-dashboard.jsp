<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 1/24/2025
  Time: 1:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Materialize CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>


        /* White Overlay */
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.8); /* Semi-transparent white */
            backdrop-filter: blur(5px);
            z-index: -1;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background: #35042d;
            padding-top: 20px;
            position: fixed;
            height: 100%;
            z-index: 1;
        }

        .sidebar a {
            display: block;
            padding: 15px 20px;
            color: #fff;
            text-decoration: none;
            font-size: 18px;
            transition: 0.3s;
        }

        .sidebar a:hover {
            background: #734a5b;
        }

        .sidebar i {
            margin-right: 10px;
        }

        /* Main Content */
        .content {
            margin-left: 260px;
            padding: 20px;
            width: calc(100% - 260px);
            position: relative;
            z-index: 2;

        }

        h4{
            font-weight: bold;
            font-family: "Lucida Handwriting";
            text-align: center;
            margin-top: 75px;
        }

        .card {
            padding: 20px;
            text-align: center;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            margin-top: 150px;
        }

        /* Hover Animation */
        .card:hover {
            transform: scale(1.1);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>


<!-- Sidebar Navigation -->
<div class="sidebar">

    <h5 class="white-text center-align" style=" font-family:Lucida Handwriting">Cliara</h5>
    <a href="#"><i class="material-icons">category</i> Category</a>
    <a href="#"><i class="material-icons">shopping_cart</i> Products</a>
    <a href="#"><i class="material-icons">person</i> User</a>
    <a href="#"><i class="material-icons">receipt</i> Manage Orders</a>
</div>

<!-- Main Content -->
<div class="content">
    <h4>Welcome to Admin Dashboard</h4>
    <div class="row">
        <div class="col s6 m3">
            <div class="card blue lighten-1 white-text">
                <i class="material-icons large">category</i>
                <h6>Manage Categories</h6>
            </div>
        </div>
        <div class="col s6 m3">
            <div class="card red lighten-1 white-text">
                <i class="material-icons large">shopping_cart</i>
                <h6>Manage Products</h6>
            </div>
        </div>
        <div class="col s6 m3">
            <div class="card green lighten-1 white-text">
                <i class="material-icons large">person</i>
                <h6>Manage Users</h6>
            </div>
        </div>
        <div class="col s6 m3">
            <div class="card orange lighten-1 white-text">
                <i class="material-icons large">receipt</i>
                <h6>Manage Orders</h6>
            </div>
        </div>
    </div>
</div>

<!-- Materialize JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

<!-- Fix for Video Autoplay -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        let video = document.getElementById("bgVideo");
        video.play().catch(error => {
            console.error("Autoplay failed:", error);
        });
    });
</script>

</body>
</html>
