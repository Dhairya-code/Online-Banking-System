<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Change Password - Admin</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); min-height: 100vh; display: flex; align-items: center; }
    .container { background: white; padding: 40px; border-radius: 10px; box-shadow: 0 10px 25px rgba(0,0,0,0.2); max-width: 500px; }
</style>
</head>
<body>
<div class="container">
    <h2 class="text-center mb-4">Admin - Change Password</h2>
    <% 
        String adminId = (String) session.getAttribute("adminId");
        if(adminId == null) {
            out.println("<div class='alert alert-danger'>Please login first</div>");
        } else {
            String message = request.getParameter("message");
            if(message != null && !message.isEmpty()) {
                out.println("<div class='alert alert-success'>" + message + "</div>");
            }
    %>
    <form method="post" action="processChangePasswordAdmin.jsp">
        <div class="mb-3">
            <label class="form-label">Current Password</label>
            <input type="password" class="form-control" name="currentPassword" required>
        </div>
        <div class="mb-3">
            <label class="form-label">New Password</label>
            <input type="password" class="form-control" name="newPassword" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Confirm New Password</label>
            <input type="password" class="form-control" name="confirmPassword" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">Change Password</button>
        <a href="AdminPanel.jsp" class="btn btn-secondary w-100 mt-2">Back to Admin Panel</a>
    </form>
    <% } %>
</div>
</body>
</html>
