<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 1/26/2025
  Time: 9:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .logout-container {
            background: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 300px;
            opacity: 0;
            animation: fadeIn 1s forwards;
        }

        .logout-container h2 {
            font-size: 24px;
            color: #4a90e2;
            margin-bottom: 20px;
            transform: translateY(20px);
            animation: slideUp 0.8s forwards;
            animation-delay: 0.5s;
        }

        .logout-container p {
            font-size: 18px;
            color: #666;
            margin-bottom: 30px;
            transform: translateY(20px);
            animation: slideUp 0.8s forwards;
            animation-delay: 0.7s;
        }

        .logout-btn {
            background: #e74c3c;
            color: #fff;
            border: none;
            padding: 12px 20px;
            font-size: 18px;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s ease;
            transform: translateY(30px);
            animation: slideUp 0.8s forwards;
            animation-delay: 1s;
        }

        .logout-btn:hover {
            background: #c0392b;
            transform: scale(1.1) translateY(-5px); /* Enlarging button and lifting */
        }

        .logout-btn img {
            width: 18px;
            height: 18px;
            margin-right: 8px;
        }

        .logout-container .icon {
            font-size: 50px;
            color: #e74c3c;
            margin-bottom: 20px;
            animation: bounce 1.5s infinite;
        }

        .message {
            font-size: 16px;
            color: #95a5a6;
            margin-top: 20px;
            display: none;
            opacity: 0;
            animation: fadeIn 1s forwards;
            animation-delay: 2s;
        }

        .message.show {
            display: block;
            opacity: 1;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideUp {
            from { transform: translateY(20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }
            40% {
                transform: translateY(-15px);
            }
            60% {
                transform: translateY(-7px);
            }
        }

    </style>
</head>
<body>

<div class="logout-container">
    <div class="icon">
        <i class="fa fa-sign-out-alt"></i>
    </div>
    <h2>Logging Out</h2>
    <p>We're sorry to see you go. Your session will end shortly.</p>
    <button class="logout-btn" onclick="logout()">Logout Now</button>
    <p class="message">You have been logged out successfully.</p>
</div>

<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<script>
    function logout() {
        setTimeout(function() {
            // Simulate logout action
            document.querySelector('.logout-btn').style.display = 'none'; // Hide logout button
            document.querySelector('.message').classList.add('show'); // Show logout success message
        }, 2000); // Simulating logout process delay
    }
</script>
</body>
</html>
