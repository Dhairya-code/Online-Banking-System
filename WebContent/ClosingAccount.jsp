<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Close Account</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); min-height: 100vh; display: flex; align-items: center; }
    .container { background: white; padding: 40px; border-radius: 10px; box-shadow: 0 10px 25px rgba(0,0,0,0.2); max-width: 600px; }
</style>
</head>
<body>
<div class="container">
    <h2 class="text-center mb-4">Close Your Account</h2>
    <% 
        String accountNumber = (String) session.getAttribute("accountNumber");
        if(accountNumber == null) {
            out.println("<div class='alert alert-danger'>Please login first</div>");
        } else {
    %>
    <div class="alert alert-warning">
        <strong>Warning:</strong> Closing your account will permanently delete all your account data. This action cannot be undone.
    </div>
    <form method="post" action="processClosingAccount.jsp">
        <div class="mb-3">
            <label class="form-label">Account Number</label>
            <input type="text" class="form-control" value="<%= accountNumber %>" readonly>
        </div>
        <div class="mb-3">
            <label class="form-label">Reason for Closing</label>
            <textarea class="form-control" name="reason" rows="3" required></textarea>
        </div>
        <div class="form-check mb-3">
            <input class="form-check-input" type="checkbox" name="confirm" id="confirm" required>
            <label class="form-check-label" for="confirm">
                I understand that closing this account is permanent
            </label>
        </div>
        <button type="submit" class="btn btn-danger w-100">Close Account</button>
        <a href="UserDashboard.jsp" class="btn btn-secondary w-100 mt-2">Cancel</a>
    </form>
    <% } %>
</div>
</body>
</html>
