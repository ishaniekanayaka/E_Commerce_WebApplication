
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.e_commerc_mynew.dto.CartItemDTO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- Custom CSS -->
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
           z-index: 100;
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
           color: #310428;
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
       .cart-container {
           background: white;
           padding: 20px;
           border-radius: 10px;
           box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
           margin-top: 100px;
           margin-bottom: 20px;
       }

       .cart-item-card {
           border: none;
           margin-bottom: 10px;
           background-color: #ffffff;
           border-radius: 10px;
           box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
           padding: 5px;
       }

       .cart-item-card img {
           width: 100%;
           height: auto;
           max-height: 120px;
           object-fit: cover;
           border-radius: 5px;
       }

       .cart-summary {
           background-color: #ffffff;
           padding: 15px;
           border-radius: 10px;
           box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
       }

       .checkout-btn {
           background-color: #28a745;
           color: white;
           text-decoration: none;
           padding: 10px 20px;
           border-radius: 5px;
           display: inline-block;
       }

       .checkout-btn:hover {
           background-color: #218838;
       }

       .btn-home {
           position: absolute;
           top: 110px;
           left: 20px;
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
<!-- Home Button -->
<form action="index.jsp" class="text-start mb-4">
    <button type="submit" class="btn btn-home">
        <i class="fas fa-home"></i>
    </button>
</form>

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
                    <li><a href="#">Blog</a></li>
                    <li><a href="#">Contact Us</a></li>
                </ul>
                <div class="nav-icons">
                    <button class="customer-btn">
                        <a href="admin-login.jsp"><img src="image/admin.png" alt="Add Customer"></a>
                    </button>
                    <button class="search-btn">
                        <a href="#"><img src="image/search.png" alt="Search"></a>
                    </button>
                    <button class="search-btn">
                        <a href="#"><img src="image/cart.png" alt="Cart"></a>
                    </button>
                </div>
            </nav>
            <div class="container">
                <div class="cart-container" style="background-color: #6b275e">
                    <h1 class="text-center mb-4">Your Shopping Cart</h1>
                   <%-- <form action="index.jsp" class="mb-4">
                        <button type="submit" class="btn btn-secondary">Home</button>
                    </form>--%>
                    <div class="row">
                        <%
                            List<CartItemDTO> cart = (List<CartItemDTO>) session.getAttribute("cart");
                            if (cart != null && !cart.isEmpty()) {
                                for (CartItemDTO item : cart) {
                        %>
                        <div class="col-md-6 col-lg-4">
                            <div class="card cart-item-card">
                                <img src="<%= item.getImage_path() %>" alt="Product Image" class="card-img-top">
                                <div class="card-body">
                                    <h5 class="card-title"><%= item.getProductName() %></h5>
                                    <p class="card-text">Price: LKR <%= item.getProductPrice() %></p>
                                    <form action="cart" method="post" class="d-flex align-items-center mb-3">
                                        <input type="hidden" name="action" value="update">
                                        <input type="hidden" name="product_id" value="<%= item.getProductId() %>">
                                        <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1" class="form-control me-2" style="max-width: 80px;">
                                        <button type="submit" class="btn btn-primary btn-sm">Update</button>
                                    </form>
                                    <p>Subtotal: LKR <%= item.getSubtotal() %></p>
                                    <form action="cart" method="post">
                                        <input type="hidden" name="action" value="remove">
                                        <input type="hidden" name="product_id" value="<%= item.getProductId() %>">
                                        <button type="submit" class="btn btn-danger btn-sm">Remove</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        } else {
                        %>
                        <div class="col-12 text-center">
                            <p>Your cart is empty.</p>
                        </div>
                        <%
                            }
                        %>
                    </div>

                    <!-- Cart Summary -->
                    <div class="cart-summary mt-4">
                        <%
                            double subtotal = 0;
                            if (cart != null) {
                                for (CartItemDTO item : cart) {
                                    subtotal += item.getSubtotal();
                                }
                            }
                        %>
                        <h3>Subtotal: <span class="text-primary">LKR <%= subtotal %></span></h3>
                        <a href="registercart.jsp" class="checkout-btn">Proceed to Checkout</a>
                    </div>
                </div>
                <!-- <button class="shop-btn">SHOP NOW</button>-->
            </div>
        </div>
        <!-- Floating Shop Now Button -->

        <%--<button class="floating-shop-btn">SHOP NOW</button>--%>
    </div>
</section>

<%--<div class="container">
   &lt;%&ndash; <div class="cart-container">
        <h1 class="text-center mb-4">Your Shopping Cart</h1>
        <form action="index.jsp" class="mb-4">
            <button type="submit" class="btn btn-secondary">Home</button>
        </form>
        <div class="row">
            <%
                List<CartItemDTO> cart = (List<CartItemDTO>) session.getAttribute("cart");
                if (cart != null && !cart.isEmpty()) {
                    for (CartItemDTO item : cart) {
            %>
            <div class="col-md-6 col-lg-4">
                <div class="card cart-item-card">
                    <img src="<%= item.getImage_path() %>" alt="Product Image" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title"><%= item.getProductName() %></h5>
                        <p class="card-text">Price: LKR <%= item.getProductPrice() %></p>
                        <form action="cart" method="post" class="d-flex align-items-center mb-3">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="product_id" value="<%= item.getProductId() %>">
                            <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1" class="form-control me-2" style="max-width: 80px;">
                            <button type="submit" class="btn btn-primary btn-sm">Update</button>
                        </form>
                        <p>Subtotal: LKR <%= item.getSubtotal() %></p>
                        <form action="cart" method="post">
                            <input type="hidden" name="action" value="remove">
                            <input type="hidden" name="product_id" value="<%= item.getProductId() %>">
                            <button type="submit" class="btn btn-danger btn-sm">Remove</button>
                        </form>
                    </div>
                </div>
            </div>
            <%
                }
            } else {
            %>
            <div class="col-12 text-center">
                <p>Your cart is empty.</p>
            </div>
            <%
                }
            %>
        </div>

        <!-- Cart Summary -->
        <div class="cart-summary mt-4">
            <%
                double subtotal = 0;
                if (cart != null) {
                    for (CartItemDTO item : cart) {
                        subtotal += item.getSubtotal();
                    }
                }
            %>
            <h3>Subtotal: <span class="text-primary">LKR <%= subtotal %></span></h3>
            <a href="cart.jsp" class="checkout-btn">Proceed to Checkout</a>
        </div>
    </div>&ndash;%&gt;
</div>--%>

<!-- Bootstrap JS Bundle (includes Popper) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
