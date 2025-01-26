<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 1/26/2025
  Time: 8:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog Section</title>
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

        .blog-card {
            transition: transform 0.3s ease-in-out;
        }
        .blog-card:hover {
            transform: scale(1.05);
        }



        .content h2 {
            font-size: 50px;
            font-weight: bold;
            animation: fadeIn 2s ease-in-out;
            margin-top: -50px;
            font-family: "Lucida Handwriting";
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
        .btn{
            background: linear-gradient(45deg, #ff80ab, #813271);
            border: none;
            color: white;
        }
        .btn:hover {
            background: linear-gradient(45deg, #734a5b, #813271);
        }
        .btn {
            background: linear-gradient(45deg, #734a5b, #813271);
            border: none;
            color: white;
        }
        .btn:hover {
            background: linear-gradient(45deg, #734a5b, #813271);
        }

        .social-icons {
            display: flex;
            justify-content: center;
            gap: 15px;
            padding: 20px;
        }

        .social-icons a {
            text-decoration: none;
            color: #555;
            font-size: 2rem;
            transition: color 0.3s;
        }

        .social-icons a:hover {
            color: #813271; /* Hover color for the icons */
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
                    <li><a href="contact.jsp">Contact Us</a></li>
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
            <div class="content">

                <div class="container mt-5 pt-5" id="blog">
                    <h2 class="text-center mb-4">Latest Blog Posts</h2>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="card blog-card">
                                <img src="image/img_5.png" class="card-img-top" alt="Blog Image">
                                <div class="card-body">
                                    <h5 class="card-title">A Night-time Routine That the Earth Will Love</h5>
                                    <p class="card-text">This beauty routine combines skincare and fragrance to relax your mind, deeply hydrate your skin, and prepare you for a restful night’s sleep.</p>
                                    <a href="#" class="btn">Read More</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card blog-card">
                                <img src="image/img_6.png" class="card-img-top" alt="Blog Image">
                                <div class="card-body">
                                    <h5 class="card-title">How to Make Your Fragrance Last All Day</h5>
                                    <p class="card-text">Learn how fragrances can do more than just smell good. Explore the link between aromatherapy, mood enhancement, and how certain scents benefit your skin and overall well-being.</p>
                                    <a href="#" class="btn">Read More</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card blog-card">
                                <img src="image/img_7.png" class="card-img-top" alt="Blog Image">
                                <div class="card-body">
                                    <h5 class="card-title">How Scents Influence Your Mood and Skin</h5>
                                    <p class="card-text">Learn how fragrances can do more than just smell good. Explore the link between aromatherapy, mood enhancement, and how certain scents benefit your skin and overall well-being.</p>
                                    <a href="#" class="btn">Read More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- <button class="shop-btn">SHOP NOW</button>-->
            </div>
        </div>

    </div>

    <div class="social-icons">
        <!-- Facebook Link -->
        <a href="https://www.facebook.com" target="_blank">
            <i class="fab fa-facebook fa-lg"></i>
        </a>

        <!-- Twitter Link -->
        <a href="https://www.twitter.com" target="_blank">
            <i class="fab fa-twitter fa-lg"></i>
        </a>

        <!-- Instagram Link -->
        <a href="https://www.instagram.com" target="_blank">
            <i class="fab fa-instagram fa-lg"></i>
        </a>

        <!-- LinkedIn Link -->
        <a href="https://www.linkedin.com" target="_blank">
            <i class="fab fa-linkedin fa-lg"></i>
        </a>
    </div>
</section>

<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>



