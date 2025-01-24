<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: linear-gradient(135deg, #f3f3f3, #ddd);
        }

        .form-container {
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }

        h2 {
            margin-bottom: 15px;
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }

        .input-box {
            position: relative;
            margin-bottom: 20px;
        }

        .input-box input {
            width: 100%;
            padding: 12px;
            padding-left: 40px;
            border: 2px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            transition: 0.3s ease;
        }

        .input-box input:focus {
            border-color: #813271;
            outline: none;
            box-shadow: 0 0 8px rgb(62, 8, 52);
        }

        .input-box i {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 18px;
            color: #777;
        }

        .login-btn {
            width: 100%;
            background: #813271;
            border: none;
            padding: 12px;
            border-radius: 8px;
            font-size: 18px;
            color: white;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .login-btn:hover {
            background: #6b275e;
        }

        .bottom-text {
            margin-top: 15px;
            font-size: 14px;
            color: #555;
        }

        .bottom-text a {
            color: #813271;
            text-decoration: none;
            font-weight: bold;
        }

        .bottom-text a:hover {
            text-decoration: underline;
        }

        .error-message {
            color: red;
            font-size: 14px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Admin Login</h2>
    <% if (request.getAttribute("error") != null) { %>
    <p class="error-message"><%= request.getAttribute("error") %></p>
    <% } %>

    <form action="admin-login" method="post">
        <div class="input-box">
            <i class="fas fa-user"></i>
            <input type="text" name="email" placeholder="Email or Phone" required>
        </div>
        <div class="input-box">
            <i class="fas fa-lock"></i>
            <input type="password" name="password" placeholder="Enter your password" required>
        </div>
        <button type="submit" class="login-btn">Login</button>
    </form>
    <p class="bottom-text">Don't have an account? <a href="register.jsp">Sign up</a></p>
</div>

</body>
</html>
