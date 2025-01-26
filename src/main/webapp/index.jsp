<%@ page import="lk.ijse.e_commerc_mynew.dto.ProductDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LAR'S - Skin Glow</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
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

        /* Hero Section */
        .content h1 {
            font-size: 50px;
            font-weight: bold;
            animation: fadeIn 2s ease-in-out;
            margin-top: -150px;
            font-family: "Lucida Handwriting";
        }

        .highlight {
            color: rgba(0, 0, 0, 0.4);
        }


        /* Floating Shop Now Button */
        .floating-shop-btn {
            position: absolute;
            bottom: 20px;
            right: 20px;
            background: #813271;
            color: black;
            font-size: 18px;
            font-weight: bold;
            padding: 15px 30px;
            border: none;
            border-radius: 50px;
            box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.2);
            cursor: pointer;
            transition: all 0.3s ease-in-out;
            animation: fadeInUp 1s ease-in-out;
            display: none; /* Initially hidden */
        }

        .floating-shop-btn:hover {
            transform: scale(1.1);
            background: #734a5b;
        }

        /* Bounce Animation */
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-5px); }
        }

        .floating-shop-btn:hover {
            animation: bounce 0.5s ease-in-out infinite;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .hero {
                flex-direction: column;
                text-align: center;
            }


            .image-container img {
                width: 100%;
                height: 200px;
                object-fit: cover;
            }

            .cart-overlay {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background: rgba(255, 0, 0, 0.8);
                padding: 10px;
                border-radius: 50%;
                display: none;
            }

            .cart-overlay i {
                color: white;
                font-size: 20px;
            }

            .image-container:hover .cart-overlay {
                display: block;
            }

            /* Styling for the social media icons */
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
                    </button>K
                    <button class="logout-btn">
                        <a href="logout.jsp">
                            <img src="image/logut.png" alt="Logout" style="width: 22px; height: 20px;">
                        </a>
                    </button>
                    <%--<button class="logout-btn">
                        <a href="logout.jsp"><i class="fa fa-sign-out fa-lg" style="color: white;"></i></a>
                    </button>--%>
                </div>
            </nav>
            <div class="content">
                <h1>TO MAKE YOUR <span class="highlight">SKIN GLOW</span></h1>
                <!-- <button class="shop-btn">SHOP NOW</button>-->
            </div>
        </div>
        <!-- Floating Shop Now Button -->
        <a href="new-product-list" class="floating-shop-btn">Shop Now</a>
        <%--<button class="floating-shop-btn">SHOP NOW</button>--%>
    </div>
</section>

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
                    <form action="cart" method="post">
                        <input type="hidden" name="product_id" value="<%= product.getProduct_id() %>">
                        <input type="hidden" name="product_name" value="<%= product.getProductName() %>">
                        <input type="hidden" name="product_price" value="<%= product.getProductPrice() %>">
                        <input type="hidden" name="product_quantity" value="1">
                        <input type="hidden" name="product_image" value="<%= product.getImage_path() %>">
                        <button type="submit" class="btn btn-danger">Add to Cart</button>
                    </form>

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

<!-- Footer -->
<footer class="footer text-center">
    <div class="container">
        <p>Follow us on</p>
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
        <p class="mt-3">© 2025 E-Shop. All Rights Reserved.</p>
    </div>
</footer>

<script>
    document.querySelector(".search-btn").addEventListener("click", function () {
        document.querySelector(".search-bar").classList.toggle("show");
    });

    document.addEventListener("click", function (event) {
        if (!event.target.closest(".search-btn, .search-bar")) {
            document.querySelector(".search-bar").classList.remove("show");
        }
    });

    setTimeout(() => {
        document.querySelector(".floating-shop-btn").style.display = "block";
    }, 2000);

    // Button fade-in effect on scroll
    window.addEventListener("scroll", function () {
        let button = document.querySelector(".floating-shop-btn");
        if (window.scrollY > 100) {
            button.style.opacity = "1";
            button.style.transform = "translateY(-20px)";
        } else {
            button.style.opacity = "0";
            button.style.transform = "translateY(20px)";
        }
    });
</script>
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
