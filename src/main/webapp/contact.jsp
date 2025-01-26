<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 1/26/2025
  Time: 8:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        .video-container {
            position: relative;
            width: 100%;
            height: 100vh;
            overflow: hidden;
        }

        video {
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: 0;
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.3);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
        }

        /* Navbar Styling */
        .navbar {
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            background: rgb(30, 6, 25);
            padding: 15px 50px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            transition: background 0.5s ease-in-out;
            z-index: 1000;
            opacity: 0;
            animation: fadeIn 1s ease-in-out forwards;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .navbar:hover {
            /* background: rgba(100, 97, 97, 0.9);*/
        }

        .navbar .logo {
            font-size: 32px;
            font-weight: bold;
            color: white;
            flex: 1;
            font-family: "Lucida Handwriting";
        }

        .navbar ul {
            list-style: none;
            display: flex;
            gap: 40px;
            flex: 1;
            justify-content: center;
            margin-top: 10px;
            position: relative;
        }

        .navbar ul li {
            position: relative;
            overflow: hidden;
        }

        .navbar a {
            text-decoration: none;
            color: white;
            font-size: 18px;
            font-family: "Verdana";
            transition: all 0.3s ease-in-out;
            position: relative;
            padding: 5px 0;
            display: inline-block;
        }

        /* Sliding Underline Effect */
        .navbar a::after {
            content: "";
            position: absolute;
            left: 50%;
            bottom: 0;
            width: 0;
            height: 3px;
            background: rgba(129, 50, 113, 0.34);
            transition: all 0.3s ease-in-out;
            transform: translateX(-50%);
        }

        .navbar a:hover::after {
            width: 100%;
        }

        /* Smooth Hover Effect */
        .navbar a:hover {
            color: #813271;
            transform: translateY(-2px);
        }

        /* Navbar Buttons */
        .nav-icons {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .customer-btn, .search-btn {
            background: transparent;
            border: none;
            cursor: pointer;
        }

        .customer-btn img, .search-btn img {
            width: 24px;
            height: 24px;
        }

        /* Search Bar */
        .search-bar {
            position: absolute;
            top: 60px;
            right: 50px;
            width: 250px;
            background: white;
            padding: 5px;
            border-radius: 5px;
            display: none;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .search-bar input {
            width: 100%;
            padding: 8px;
            border: none;
            outline: none;
        }

        .search-bar.show {
            display: block;
            animation: fadeIn 0.3s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }


        .container {
            margin-top: 80px;
            max-width: 600px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
            animation: fadeIn 1.5s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .form-control {
            background: rgba(255, 255, 255, 0.2);
            border: none;
            color: white;
        }

        .form-control:focus {
            background: rgba(255, 255, 255, 0.3);
            color: white;
            box-shadow: none;
        }

        .btn {
            background: linear-gradient(45deg, #ff80ab, #813271);
            border: none;
            color: white;
            font-weight: bold;
            padding: 10px 20px;
            border-radius: 25px;
            transition: transform 0.3s ease-in-out;
        }

        .btn:hover {
            transform: scale(1.1);
        }

        h2{
            font-size: 50px;
            font-weight: bold;
            animation: fadeIn 2s ease-in-out;

            font-family: "Lucida Handwriting";
        }
    </style>
</head>
<body>

<section class="main">
    <div class="video-container">
        <video autoplay muted loop>
            <source src="vedio/5.mp4" type="video/mp4">
            Your browser does not support the video tag.
        </video>
        <div class="overlay">
            <nav class="navbar">
                <a href="#"><h2 class="logo">Cliara.</h2></a>
                <ul>
                    <li><a  href="new-product-list">Products</a></li>
                    <li><a href="blog.jsp">Blog</a></li>
                    <li><a href="#">Contact Us</a></li>
                </ul>
                <div class="nav-icons">
                    <button class="customer-btn">
                        <a href="admin-login.jsp"><img src="image/admin.png" alt="Add Customer"></a>
                    </button>
                    <button class="search-btn">
                        <a href="#"><img src="image/search.png" alt="Seaarch"></a>
                    </button>
                    <button class="search-btn">
                        <a href="add-cart.jsp"><img src="image/cart.png" alt="Cart"></a>
                    </button>
                </div>
            </nav>
            <div class="container">
                <h2>Contact Us</h2>
                <p>We'd love to hear from you! Fill out the form below.</p>
                <form>
                    <div class="mb-3">
                        <input type="text" class="form-control" placeholder="Your Name" required>
                    </div>
                    <div class="mb-3">
                        <input type="email" class="form-control" placeholder="Your Email" required>
                    </div>
                    <div class="mb-3">
                        <textarea class="form-control" rows="4" placeholder="Your Message" required></textarea>
                    </div>
                    <button type="submit" class="btn">Send Message</button>
                </form>
            </div>
        </div>

    </div>
</section>
<%--<div class="container">
    <h2>Contact Us</h2>
    <p>We'd love to hear from you! Fill out the form below.</p>
    <form>
        <div class="mb-3">
            <input type="text" class="form-control" placeholder="Your Name" required>
        </div>
        <div class="mb-3">
            <input type="email" class="form-control" placeholder="Your Email" required>
        </div>
        <div class="mb-3">
            <textarea class="form-control" rows="4" placeholder="Your Message" required></textarea>
        </div>
        <button type="submit" class="btn">Send Message</button>
    </form>
</div>--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

