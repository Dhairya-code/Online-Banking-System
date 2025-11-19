<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Transaction History</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); min-height: 100vh; padding: 20px; }
    .table-container { background: white; padding: 30px; border-radius: 10px; box-shadow: 0 10px 25px rgba(0,0,0,0.2); }
</style>
</head>
<body>
<div class="container">
    <div class="table-container">
        <h2 class="mb-4">Transaction History</h2>
        <% 
            String accountNumber = (String) session.getAttribute("accountNumber");
            if(accountNumber == null) {
                out.println("<div class='alert alert-danger'>Please login first</div>");
            } else {
        %>
        <table class="table table-striped">
            <thead class="table-dark">
                <tr>
                    <th>Date</th>
                    <th>Transaction ID</th>
                    <th>Type</th>
                    <th>Amount</th>
                    <th>Balance</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>2024-01-15</td>
                    <td>TXN001</td>
                    <td>Deposit</td>
                    <td>+5000</td>
                    <td>25000</td>
                    <td><span class="badge bg-success">Success</span></td>
                </tr>
                <tr>
                    <td>2024-01-10</td>
                    <td>TXN002</td>
                    <td>Withdraw</td>
                    <td>-2000</td>
                    <td>20000</td>
                    <td><span class="badge bg-success">Success</span></td>
                </tr>
            </tbody>
        </table>
        <a href="UserDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
        <% } %>
    </div>
</div>
</body>
</html>
