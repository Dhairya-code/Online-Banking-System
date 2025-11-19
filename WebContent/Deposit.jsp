<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Deposit Money</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container" style="max-width: 500px; margin-top: 30px;">
        <h2 class="text-center">Deposit Money</h2>
        <form method="post" class="mt-4">
            <div class="mb-3">
                <label class="form-label">Account Number:</label>
                <input type="text" class="form-control" name="accountNo" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Amount:</label>
                <input type="number" class="form-control" name="amount" required min="1" step="0.01">
            </div>
            <button type="submit" class="btn btn-success w-100" name="deposit" value="yes">Deposit</button>
        </form>
        <% 
            if (request.getParameter("deposit") != null) {
                try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "123");
                    String updateQuery = "UPDATE accounttable SET balance = balance + ? WHERE accountnumber = ?";
                    PreparedStatement pstmt = con.prepareStatement(updateQuery);
                    pstmt.setDouble(1, Double.parseDouble(request.getParameter("amount")));
                    pstmt.setString(2, request.getParameter("accountNo"));
                    int result = pstmt.executeUpdate();
                    if (result > 0) {
                        %>
                        <div class="alert alert-success mt-3">Deposit Successful!</div>
                        <% 
                    }
                    con.close();
                } catch (Exception e) {
                    %>
                    <div class="alert alert-danger mt-3">Error: <%= e.getMessage() %></div>
                    <% 
                }
            }
        %>
    </div>
</body>
</html>
