<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Admin Account</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

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

        .password-info {
            font-size: 12px;
            color: #666;
            text-align: left;
            margin-top: -10px;
            margin-bottom: 10px;
        }

        .register-btn {
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

        .register-btn:hover {
            background: #813271;
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

<div class="form-container">
    <h2>Create Admin Account</h2>

    <form id="registerForm" action="admin-register-servlet" method="post">
        <input type="hidden" name="role" value="admin">
        <div class="input-box">
            <i class="fas fa-user"></i>
            <input type="text" name="user_name" placeholder="First and last name" required>
        </div>
        <div class="input-box">
            <i class="fas fa-envelope"></i>
            <input type="email" name="email" placeholder="Enter your email" required>
        </div>
        <div class="input-box">
            <i class="fas fa-phone"></i>
            <input type="text" name="phone" placeholder="Enter your mobile number" required>
        </div>
        <div class="input-box">
            <i class="fas fa-map-marker-alt"></i>
            <input type="text" name="address" placeholder="Enter your address" required>
        </div>
        <div class="input-box">
            <i class="fas fa-lock"></i>
            <input type="password" id="password" name="password" placeholder="At least 6 characters" required>
        </div>
        <p class="password-info">Passwords must be at least 6 characters.</p>
        <div class="input-box">
            <i class="fas fa-lock"></i>
            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Re-enter your password" required>
        </div>
        <button type="submit" class="register-btn">Register</button>
    </form>
    <p class="bottom-text">Already have an account? <a href="admin-login.jsp">Sign in</a></p>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    document.getElementById('registerForm').addEventListener('submit', function (event) {
        var password = document.getElementById('password').value;
        var confirmPassword = document.getElementById('confirmPassword').value;

        if (password !== confirmPassword) {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Passwords do not match!'
            });
            event.preventDefault();
        } else {
            event.preventDefault();
            Swal.fire({
                icon: 'success',
                title: 'Success!',
                text: 'Admin account created successfully!',
                confirmButtonText: 'OK'
            }).then(() => {
                document.getElementById('registerForm').submit();
            });
        }
    });
</script>

</body>
</html>
