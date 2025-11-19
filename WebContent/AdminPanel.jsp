<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    String admin = (String) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("Admin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <style>
        body { background-color: #f4f7fc; }
        .panel-header { text-align: center; padding: 50px; background-color: #007bff; color: white; }
        .card { border: none; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); margin-bottom: 20px; }
        .card-body a { display: block; padding: 15px; text-decoration: none; color: white; background-color: #28a745; border-radius: 8px; text-align: center; margin: 10px 0; }
        .card-body a:hover { background-color: #218838; }
    </style>
</head>
<body>
    <nav class="navbar navbar-dark bg-dark">
        <div class="container-fluid">
            <span class="navbar-text text-white">Welcome Admin</span>
            <a class="nav-link" href="Logout.jsp" style="color: white;">Logout</a>
        </div>
    </nav>

    <div class="panel-header">
        <h2>Admin Panel</h2>
    </div>

    <div class="container mt-4">
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <a href="NewAccount.jsp"><i class="fas fa-user-plus"></i> New Account</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <a href="CheckBalance.jsp"><i class="fas fa-balance-scale"></i> Check Balance</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <a href="ChangePassword.jsp"><i class="fas fa-key"></i> Change Password</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
