<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Check Balance</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { font-family: Arial, sans-serif; background: #f0f0f0; padding: 30px; }
        .container { max-width: 500px; margin: 0 auto; background: white; padding: 25px; border-radius: 8px; box-shadow: 0 0 8px rgba(0,0,0,0.1); }
        h2 { text-align: center; margin-bottom: 20px; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 8px; font-weight: bold; }
        input { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        button { width: 100%; padding: 10px; background: #28a745; color: white; border: none; border-radius: 4px; cursor: pointer; }
        button:hover { background: #218838; }
        .message { margin-top: 15px; font-weight: bold; text-align: center; }
        .error { color: #d9534f; }
        .success { color: #28a745; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Check Account Balance</h2>
        <form method="post">
            <div class="form-group">
                <label for="accountNo">Enter Account Number:</label>
                <input type="text" id="accountNo" name="accountNo" required>
            </div>
            <button type="submit" name="check" value="Check">Check Balance</button>
        </form>
        <% 
            String accountNo = request.getParameter("accountNo");
            if (request.getParameter("check") != null && accountNo != null && !accountNo.trim().isEmpty()) {
                try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "123");
                    String query = "SELECT balance FROM accounttable WHERE accountnumber = ?";
                    PreparedStatement pstmt = con.prepareStatement(query);
                    pstmt.setString(1, accountNo);
                    ResultSet rs = pstmt.executeQuery();
                    if (rs.next()) {
                        String balance = rs.getString("balance");
                        %>
                        <div class="message success">Account Balance: Rs. <%= balance %></div>
                        <% 
                    } else {
                        %>
                        <div class="message error">Account not found!</div>
                        <% 
                    }
                    rs.close(); pstmt.close(); con.close();
                } catch (Exception e) {
                    %>
                    <div class="message error">Error: <%= e.getMessage() %></div>
                    <% 
                }
            }
        %>
    </div>
</body>
</html>
