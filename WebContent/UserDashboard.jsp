<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String user = (String) session.getAttribute("username");
    if (user == null) {
        response.sendRedirect("UserLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f7fc;
            font-family: Arial, sans-serif;
        }
        .navbar-brand img {
            height: 60px;
        }
        .panel-header {
            padding: 40px 20px;
            text-align: center;
            background-color: #007bff;
            color: white;
            margin-bottom: 30px;
            border-radius: 8px 8px 0 0;
        }
        .panel-header h2 {
            margin: 0;
        }
        .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border: none;
            transition: transform 0.3s ease;
            margin-bottom: 20px;
        }
        .card:hover {
            transform: translateY(-5px);
        }
        .card-body a {
            display: block;
            padding: 15px;
            text-decoration: none;
            color: white;
            background-color: #28a745;
            border-radius: 8px;
            margin-bottom: 10px;
            text-align: center;
            transition: background-color 0.3s;
        }
        .card-body a:hover {
            background-color: #218838;
        }
        .footer {
            text-align: center;
            padding: 20px;
            background-color: #343a40;
            color: #fff;
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="images/logo13.png" alt="Logo">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="UserDashboard.jsp">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Logout.jsp">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Dashboard Header -->
    <div class="panel-header">
        <h2>Welcome, <%= user %>!</h2>
        <p>Your secure banking dashboard</p>
    </div>

    <!-- Dashboard Features -->
    <div class="container">
        <div class="row">
            <!-- Check Account -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <a href="checkBalance.jsp"><i class="fas fa-balance-scale"></i> Check Balance</a>
                    </div>
                </div>
            </div>

            <!-- Transfer Money -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <a href="MoneyTransfer.jsp"><i class="fas fa-money-bill-wave"></i> Transfer Money</a>
                    </div>
                </div>
            </div>

            <!-- Transaction History -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <a href="TransactionHistory.jsp"><i class="fas fa-history"></i> Transaction History</a>
                    </div>
                </div>
            </div>

            <!-- Change Password -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <a href="ChangePasswordUser.jsp"><i class="fas fa-key"></i> Change Password</a>
                    </div>
                </div>
            </div>

            <!-- Withdraw Money -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <a href="WithdrawMoney.jsp"><i class="fas fa-hand-holding-usd"></i> Withdraw Money</a>
                    </div>
                </div>
            </div>

            <!-- Deposit Money -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <a href="Deposit.jsp"><i class="fas fa-hand-holding-usd"></i> Deposit Money</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2025 Online Banking System. All Rights Reserved.</p>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
