<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 1/24/2025
  Time: 1:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>POS Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background-color: #f4f7fc;
            font-family: 'Poppins', sans-serif;
        }
        .login-container {
            width: 350px;
            padding: 30px;
            background: white;
            border-radius: 12px;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.1);
        }
        .login-btn {
            font-size: 16px;
            padding: 12px;
            background: #813271;
            border: none;
            color: white;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .login-btn:hover {
            background: #a12b5f;
        }
        .nav-tabs .nav-link {
            padding: 8px 15px;
            font-size: 16px;
            font-weight: bold;
        }
        .form-control {
            font-size: 16px;
            padding: 12px;
        }
        .small-text {
            font-size: 14px;
        }
        .input-group-text {
            font-size: 16px;
        }
        .text-end a {
            color: #813271;
        }
        .text-end a:hover {
            text-decoration: underline;
        }
        .btn-light {
            font-size: 14px;
            padding: 8px;
        }
        .btn-light img {
            width: 18px;
            margin-right: 5px;
        }
    </style>
</head>
<body>

<div class="login-container">
    <form>
        <ul class="nav nav-tabs" id="loginTabs">
            <li class="nav-item">
                <a class="nav-link active" data-bs-toggle="tab" href="#passwordLogin">Password</a>
            </li>
        </ul>
        <div class="tab-content mt-3">
            <div id="passwordLogin" class="tab-pane fade show active">
                <input type="text" class="form-control mb-3" placeholder="Phone or Email" required>
                <div class="input-group mb-3">
                    <input type="password" class="form-control" placeholder="Password" required>
                    <span class="input-group-text"><i class="bi bi-eye"></i></span>
                </div>
                <a href="#" class="d-block mt-1 small-text text-end">Forgot password?</a>
            </div>
        </div>
        <button type="submit" class="btn btn-warning w-100 mt-2 login-btn">LOG IN</button>
        <p class="text-center small-text mt-3">Don't have an account? <a href="admin-register.jsp">Sign up</a></p>
        <div class="text-center small-text mt-3">Or log in with</div>
        <div class="d-flex justify-content-center gap-3 mt-3">
            <button type="button" class="btn btn-light border btn-sm" style="background-color: #813271; color: white;">
               <a href="admin-dashboard.jsp">Admin</a>
            </button>
        </div>
    </form>
</div>

</body>
</html>
